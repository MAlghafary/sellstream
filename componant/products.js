const express = require("express");
const router = express.Router();
const isAuthenticated = require("../middlewares/isAuthenticated.js");
const mysqlConnection = require("../utils/database.js");
const Product = require("../models/Product");

router.get("/", isAuthenticated, (req, res) => {
  Product.fetchApproved((err, products) => {
    if (err) {
      return res.status(500).json({ error: "Failed to fetch products" });
    }
    res.json(products);
  });
});

router.get("/pending", isAuthenticated, (req, res) => {
  Product.fetchPending((err, products) => {
    if (err) {
      return res.status(500).json({ error: "Failed to fetch products" });
    }
    res.json(products);
  });
});

router.post("/", isAuthenticated, (req, res) => {
  const productData = req.body;
  if (
    !productData ||
    !productData.name ||
    !productData.price ||
    !productData.image
  ) {
    return res.status(400).send({ error: "Product data is incomplete" });
  }

  const product = Product.fromData(productData);

  product.save((err, savedProduct) => {
    if (err) {
      return res.status(500).send({ error: "Failed to save product" });
    }
    res.status(201).send({ message: "product saved", data: product });
  });
});

router.put("/approve/:productid", isAuthenticated, (req, res) => {
  Product.fetchOne(req.params.productid, (err, products) => {
    if (err) {
      res.status(404).send({ error: "no product found" });
    }

    products[0].approve((err, updatedProduct) => {
      if (err) {
        return res.status(500).send({ error: "Failed to Approve product" });
      }
      res.status(201).send({ message: "product Approved", data: updatedProduct });
    });
  });
});

router.put("/reject/:productid", isAuthenticated, (req, res) => {
  Product.fetchOne(req.params.productid, (err, products) => {
    if (err) {
      res.status(404).send({ error: "no product found" });
    }

    products[0].reject((err, updatedProduct) => {
      if (err) {
        return res.status(500).send({ error: "Failed to Approve product" });
      }
      res.status(201).send({ message: "product rejected", data: updatedProduct });
    });
  });
});

module.exports = router;
