const mysqlConnection = require('../utils/database.js');
const isAdmin = require('../middlewares/isAdmin.js');
const express = require('express');
const isAuthenticated = require('../middlewares/isAuthenticated.js');
const router = express.Router();
const app = express();


app.use(express.json());

// Route to return products with approval_status "pending"
router.get('/', isAuthenticated, (req, res) => {
    const { user_role } = req.body;
    if (user_role != 'admin') {
        return res.status(401).json({ message: 'Unauthorized you are not admin' });
    }
    const sql = 'SELECT * FROM products WHERE approval_status = ?';
    const approvalStatus = 'pending';

    mysqlConnection.query(sql, [approvalStatus], (err, result) => {
        if (err) {
            console.error('Error fetching products:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.json(result);
    });
});

// Approve product
router.put('/approve', isAuthenticated, (req, res) => {
    const { productId, newState } = req.body;

    const query = 'UPDATE products SET approval_status = ? WHERE product_id = ? AND approval_status = "pending"';

    mysqlConnection.query(query, [newState, productId], (err, result) => {
        if (err) {
            console.error('Error updating product state:', err);
            return res.status(500).send('Internal server error');
        }

        if (result.affectedRows === 0) {
            return res.status(404).send('Product not found or not in pending state');
        }

        res.send('Product state updated to approved');
    });
});

// Reject product
router.put('/reject', isAuthenticated, (req, res) => {
    const { productId, newState } = req.body;
    console.log(productId, newState);

    const query = 'UPDATE products SET approval_status = ? WHERE  product_id = ? AND approval_status = "pending"';

    mysqlConnection.query(query, [newState, productId], (err, result) => {
        if (err) {
            console.error('Error updating product state:', err);
            return res.status(500).send('Internal server error');
        }

        if (result.affectedRows === 0) {
            return res.status(404).send('Product not found or not in pending state');
        }

        res.send('Product state updated to rejected');
    });
});

module.exports = router;
