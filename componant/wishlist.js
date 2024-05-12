
const express = require('express');
const app = express();
const mysqlConnection = require('../utils/database.js');
const router = express.Router();

app.use(express.json());

// Route to get all wishlist items
router.get('/', (req, res) => {
  mysqlConnection.query("SELECT * FROM wishlist", (error, results, fields) => {
    if (error) {
      console.error("Error fetching wishlist items:", error);
      res.status(500).json({ error: "Error fetching wishlist items" });
      return;
    }
    res.json(results);
  });
});

// Route to add a new wishlist item
router.post('/', (req, res) => {
  const sqlQuery = `INSERT INTO wishlist (wish)
  SELECT product_name FROM products WHERE IsWishlistItem = 1`;
  mysqlConnection.query(sqlQuery, (error, results, fields) => {
    if (error) {
      console.error("Error adding wishlist item:", error);
      res.status(500).json({ error: "Error adding wishlist item" });
      return;
    }
    res.json({ message: "Wishlist item added successfully" });
  });
});


module.exports = router;

