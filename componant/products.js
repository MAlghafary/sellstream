const express = require('express');
const router = express.Router();

const mysqlConnection = require('../utils/database.js');

// Route to get all products
router.get('/', (req, res) => {
    console.log("inside product")
    const sql = 'SELECT * FROM products';
    mysqlConnection.query(sql, (err, result) => {
        if (err) {
            console.log("error here");
            throw err;
        }
        res.json(result);
    });
});

///new ads

router.post('/', (req, res) => {
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

