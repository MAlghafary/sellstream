const express = require("express");
const router = express.Router();
const isAuthenticated = require("../middlewares/isAuthenticated.js");
const mysqlConnection = require("../utils/database.js");
const Product = require("../models/Product")

router.get("/", isAuthenticated, (req, res) => {
  Product.fetchAll((err, products) => {
    if (err) {
      return res.status(500).json({ error: "Failed to fetch products" });
    }
    res.json(products);
  });
});

router.post('/', isAuthenticated , (req, res) => {
  const productData = req.body;
  console.log(productData)
  if (!productData || !productData.name || !productData.price || !productData.image) {
    return res.status(400).send({ error: 'Product data is incomplete' });
  }

  const product = Product.fromData(productData)

  product.save((err, savedProduct) => {
    if (err) {
      return res.status(500).send({ error: 'Failed to save product' });
    }
    res.status(201).send({message:"product saved" , data : product});
  });
});

module.exports = router;
