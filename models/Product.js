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
}

module.exports = Product;
