const express = require('express');
const mysqlConnection = require('../utils/database.js');
const bodyParser = require('body-parser');
const session = require('express-session');
const router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

// View cart
router.get('/', (req, res) => {
    const sql = 'SELECT * FROM cart_items';
    mysqlConnection.query(sql, (err, result) => {
        if (err) {
            console.error('Error fetching cart items:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.json(result);
    });
});

// Add item to cart
router.post('/', (req, res) => {
    const { productId } = req.body;
    if (!productId) {
        return res.status(400).json({ error: 'Product ID is required' });
    }
    const sql = 'INSERT INTO cart_items (product_id) VALUES (?)';
    mysqlConnection.query(sql, [productId], (err, result) => {
        if (err) {
            console.error('Error adding item to cart:', err);
            return res.status(500).json({ error: 'Error adding item to cart' });
        }
        res.redirect('/cart');
    });
});

// Remove item from cart
router.post('/remove', (req, res) => {
    const { itemId, userId } = req.body;
    if (!itemId || !userId) {
        return res.status(400).json({ error: 'Item ID and User ID are required' });
    }
    const sql = 'DELETE FROM cart_items WHERE id = ? AND user_id = ?';
    mysqlConnection.query(sql, [itemId, userId], (err, result) => {
        if (err) {
            console.error('Error removing item from cart:', err);
            return res.status(500).json({ error: 'Error removing item from cart' });
        }
        res.redirect('/cart');
    });
});

module.exports = router;
