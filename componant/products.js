const express = require('express');
const router = express.Router();
const isAuthenticated = require('../middlewares/isAuthenticated.js');

const mysqlConnection = require('../utils/database.js');

// Route to get all products
router.get('/', isAuthenticated, (req, res) => {
    const sql = ` SELECT 
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
      p.id`
    mysqlConnection.query(sql, (err, result) => {
        if (err) {
            console.log("error here");
            throw err;
        }

        const products =  result.map(product => ({
            id: product.id,
            name: product.name,
            sku: product.sku,
            price: product.price,
            discount: product.discount,
            fullDescription: product.fullDescription,
            shortDescription: product.shortDescription,
            rating: product.rating,
            saleCount: product.saleCount,
            new: product.isNew,
            offerEnd: product.offerEnd,
            category: product.categories ? product.categories.split(',') : [],
            image: product.images ? product.images.split(',') : []
          }));
        res.json(products);
    });
});

///new ads

router.post('/', isAuthenticated, (req, res) => {
    const { product_name, description, price, image_url } = req.body;
    const sql = 'INSERT INTO products (product_name, description, price, image_url) VALUES (?, ?, ?, ?)';
    mysqlConnection.query(sql, [product_name, description, price, image_url], (err, result) => {
        if (err) {
            throw err;
        }
        res.send('Product added successfully');
    });
});

module.exports = router;

