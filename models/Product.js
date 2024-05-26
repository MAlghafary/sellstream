const mysqlConnection = require("../utils/database");

class Product {
  constructor(
    id,
    name,
    category,
    categoryId,
    discount,
    description,
    price,
    rating,
    saleCount,
    offerEnd,
    isNew,
    stock,
    image
  ) {
    this.id = id;
    this.name = name;
    this.category = category;
    this.categoryId = categoryId;
    this.discount = discount;
    this.description = description;
    this.price = price;
    this.rating = rating;
    this.saleCount = saleCount;
    this.offerEnd = offerEnd;
    this.isNew = isNew;
    this.stock = stock;
    this.image = image;
  }

  static fromData(data) {
    return new Product(
      data.id || null,
      data.name,
      data.category || "",
      data.categoryId || 0,
      data.discount || 0,
      data.description || "",
      data.price,
      data.rating || 0,
      data.saleCount || 0,
      data.offerEnd || null,
      data.isNew || true,
      data.stock,
      data.image || []
    );
  }

  static fetchApproved(callback) {
    const query = `
      SELECT 
        p.id, 
        p.name, 
        p.price, 
        p.discount, 
        p.description, 
        p.rating, 
        p.saleCount, 
        p.isNew, 
        p.offerEnd, 
        p.stock,
        c.name AS categories,
        GROUP_CONCAT(DISTINCT i.url) AS images
      FROM 
        product p
      LEFT JOIN 
        category c ON p.category_id = c.id
      LEFT JOIN 
        image i ON p.id = i.product_id
      WHERE p.approval_status = 'approved'  
      GROUP BY 
        p.id
    `;
    return this.fetch(query, null, callback);
  }

  static fetchPending(callback) {
    const query = `
      SELECT 
        p.id, 
        p.name, 
        p.price, 
        p.discount, 
        p.description, 
        p.rating, 
        p.saleCount, 
        p.isNew, 
        p.offerEnd, 
        p.stock,
        c.name AS category,
        c.id AS categoryId,
        GROUP_CONCAT(DISTINCT i.url) AS images
      FROM 
        product p
      LEFT JOIN 
        category c ON p.category_id = c.id
      LEFT JOIN 
        image i ON p.id = i.product_id
      WHERE p.approval_status = 'pending'  
      GROUP BY 
        p.id
    `;
    return this.fetch(query, null, callback);
  }

  static fetchOne(productId , callback) {
    const query = `
    SELECT 
      p.id, 
      p.name, 
      p.price, 
      p.discount, 
      p.description, 
      p.rating, 
      p.saleCount, 
      p.isNew, 
      p.offerEnd, 
      p.stock,
      c.name AS category,
      c.id AS categoryId,
      GROUP_CONCAT(DISTINCT i.url) AS images
    FROM 
      product p
    LEFT JOIN 
      category c ON p.category_id = c.id
    LEFT JOIN 
      image i ON p.id = i.product_id
    WHERE p.id = ?  
    GROUP BY 
      p.id
  `;
    return this.fetch(query, [productId], callback)
  }
  static fetch(query, params, callback) {
    mysqlConnection.query(query, params, (err, results) => {
      if (err) {
        console.error("Error fetching products:", err);
        callback(err, null);
        return;
      }

      const products = results.map(
        (row) =>
          new Product(
            row.id,
            row.name,
            row.category,
            row.categoryId,
            row.discount,
            row.description,
            row.price,
            Number(row.rating),
            row.saleCount,
            row.offerEnd,
            row.isNew,
            row.stock,
            row.images ? row.images.split(",") : []
          )
      );

      callback(null, products);
    });
  }

  save(callback) {
    const query = `
      INSERT INTO product (
        name,
        discount,
        description,
        price,
        rating,
        saleCount,
        offerEnd,
        isNew,
        stock,
        category_id
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)
    `;
    const values = [
      this.name,
      this.discount,
      this.description,
      this.price,
      this.rating,
      this.saleCount,
      this.offerEnd,
      this.isNew,
      this.stock,
      this.categoryId,
    ];

    mysqlConnection.query(query, values, (err, result) => {
      if (err) {
        console.error("Error saving product:", err);
        callback(err, null);
        return;
      }

      const productId = result.insertId;

      // Insert images into the images table
      this.image.forEach((img) => {
        const imageQuery = `
          INSERT INTO image (
            product_id,
            url
          ) VALUES (?, ?)
        `;
        const imageValues = [productId, img];

        mysqlConnection.query(
          imageQuery,
          imageValues,
          (imageErr, imageResult) => {
            if (imageErr) {
              console.error("Error saving product image:", imageErr);
              callback(imageErr, null);
              return;
            }
          }
        );
      });

      this.id = productId;
      callback(null, this);
    });
  }

  approve(callback) {
    const query = `
      UPDATE product set approval_status = 'approved' WHERE id = ? `;
    mysqlConnection.query(query, [this.id], (err, result) => {
      if (err) {
        console.error("Error saving product:", err);
        callback(err, null);
        return;
      }
      callback(null, this);
    });
  }

  reject(callback) {
    const query = `
    UPDATE product set approval_status = 'rejected' WHERE id = ? `;
    mysqlConnection.query(query, [this.id], (err, result) => {
      if (err) {
        console.error("Error saving product:", err);
        callback(err, null);
        return;
      }
      callback(null, this);
    });
  }
}

module.exports = Product;
