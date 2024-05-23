const mysqlConnection = require("../utils/database");

class Product {
  constructor(
    id,
    name,
    category,
    discount,
    fullDescription,
    shortDescription,
    price,
    rating,
    saleCount,
    sku,
    offerEnd,
    isNew,
    stock,
    image
  ) {
    this.id = id;
    this.name = name;
    this.category = category;
    this.discount = discount;
    this.fullDescription = fullDescription;
    this.shortDescription = shortDescription;
    this.price = price;
    this.rating = rating;
    this.saleCount = saleCount;
    this.sku = sku;
    this.offerEnd = offerEnd;
    this.isNew = isNew;
    this.stock = stock;
    this.image = image;
  }

  static fromData(data) {
    return new Product(
      data.id || null,
      data.name,
      data.category || [],
      data.discount || 0,
      data.fullDescription || "",
      data.shortDescription || "",
      data.price,
      data.rating || 0,
      data.saleCount || 0,
      data.sku || "",
      data.offerEnd || null,
      data.isNew || true,
      data.stock,
      data.image || []
    );
  }

  static fetchAll(callback) {
    const query = `
      SELECT 
        p.id, 
        p.name, 
        p.sku, 
        p.price, 
        p.discount, 
        p.fullDescription, 
        p.shortDescription, 
        p.rating, 
        p.saleCount, 
        p.isNew, 
        p.offerEnd, 
        p.stock,
        GROUP_CONCAT(DISTINCT c.name) AS categories,
        GROUP_CONCAT(DISTINCT i.url) AS images
      FROM 
        product p
      LEFT JOIN 
        product_category pc ON p.id = pc.product_id
      LEFT JOIN 
        category c ON pc.category_id = c.id
      LEFT JOIN 
        image i ON p.id = i.product_id
      GROUP BY 
        p.id
    `;
    return this.fetch(query,callback);
  }

  static fetchPending(callback) {
    const query = `
      SELECT 
        p.id, 
        p.name, 
        p.sku, 
        p.price, 
        p.discount, 
        p.fullDescription, 
        p.shortDescription, 
        p.rating, 
        p.saleCount, 
        p.isNew, 
        p.offerEnd, 
        p.stock,
        GROUP_CONCAT(DISTINCT c.name) AS categories,
        GROUP_CONCAT(DISTINCT i.url) AS images
      FROM 
        product p
      LEFT JOIN 
        product_category pc ON p.id = pc.product_id
      LEFT JOIN 
        category c ON pc.category_id = c.id
      LEFT JOIN 
        image i ON p.id = i.product_id
      WHERE p.approval_status = 'pending'  
      GROUP BY 
        p.id
    `;
    return this.fetch(query,callback);

  }

  static fetch(query , callback) {
    mysqlConnection.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching products:', err);
        callback(err, null);
        return;
      }

      const products = results.map((row) =>
        new Product(
          row.id,
          row.name,
          row.categories ? row.categories.split(",") : [],
          row.discount,
          row.fullDescription,
          row.shortDescription,
          row.price,
          Number(row.rating), 
          row.saleCount,
          row.sku,
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
        fullDescription,
        shortDescription,
        price,
        rating,
        saleCount,
        sku,
        offerEnd,
        isNew,
        stock
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;
    const values = [
      this.name,
      this.discount,
      this.fullDescription,
      this.shortDescription,
      this.price,
      this.rating,
      this.saleCount,
      this.sku,
      this.offerEnd,
      this.isNew,
      this.stock
    ];

    mysqlConnection.query(query, values, (err, result) => {
      if (err) {
        console.error('Error saving product:', err);
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

        mysqlConnection.query(imageQuery, imageValues, (imageErr, imageResult) => {
          if (imageErr) {
            console.error('Error saving product image:', imageErr);
            callback(imageErr, null);
            return;
          }
        });
      });

      this.id = productId; 
      callback(null, this);
    });
  }
}

module.exports = Product;
