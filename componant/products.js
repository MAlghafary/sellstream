const express = require("express");
const router = express.Router();
const isAuthenticated = require("../middlewares/isAuthenticated.js");
const mysqlConnection = require("../utils/database.js");
const Product = require("../models/Product")

// Route to get all products
router.get("/", isAuthenticated, (req, res) => {
  Product.fetchAll((err, products) => {
    console.log(err)
    console.log(products)
    if (err) {
      return res.status(500).json({ error: "Failed to fetch products" });
    }
    res.json(products);
  });
});


router.post("/", isAuthenticated, (req, res) => {
  const { product_name, description, price, image_url } = req.body;
  const sql =
    "INSERT INTO products (product_name, description, price, image_url) VALUES (?, ?, ?, ?)";
  mysqlConnection.query(
    sql,
    [product_name, description, price, image_url],
    (err, result) => {
      if (err) {
        throw err;
      }
      res.send("Product added successfully");
    }
  );
});

module.exports = router;
