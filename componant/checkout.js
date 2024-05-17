const express = require('express');
const mysqlConnection = require('../utils/database.js');
const bodyParser = require('body-parser');
const session = require('express-session');
const router = express.Router();
const app = express();
// Middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.json());

router.post('/', (req, res) => {
    const { phone, email, city, street_address, company_name, first_name, last_name } = req.body;

    // Validate input data (e.g., check required fields)
    if (!phone || !email) {
        res.status(400).send('Missing required fields');
        return;
    }

    // Create SQL query to insert new order
    const sql = 'INSERT INTO orders (phone, email, city, street_address, company_name, first_name, last_name) VALUES (?, ?, ?, ?, ?, ?, ?)';
    const values = [phone, email, city, street_address, company_name, first_name, last_name];

    // Execute the query
    mysqlConnection.query(sql, values, (err, result) => {
        if (err) {
            console.error('Error creating order:', err);
            res.status(500).send('Error creating order');
            return;
        }
        console.log('New order created:', result);
        res.status(201).send('Order created successfully');
    });


});

// Route to move data from cart_items to order_items
router.post('/move', (req, res) => {
    const { orderId, userId } = req.body;

    // Start a transaction
    mysqlConnection.beginTransaction(err => {
        if (err) {
            console.error('Error starting transaction:', err);
            res.status(500).send('Error starting transaction');
            return;
        }

        // Move data from cart_items to order_items
        const moveQuery = `
            INSERT INTO order_item (order_id, product_id)
            SELECT ?, product_id
            FROM cart_items
            WHERE user_id = ?;
        `;
        mysqlConnection.query(moveQuery, [orderId, userId], (err, moveResult) => {
            if (err) {
                console.error('Error moving data:', err);
                mysqlConnection.rollback(() => {
                    res.status(500).send('Error moving data');
                });
                return;
            }


            // Commit the transaction
            mysqlConnection.commit(err => {
                if (err) {
                    console.error('Error committing transaction:', err);
                    mysqlConnection.rollback(() => {
                        res.status(500).send('Error committing transaction');
                    });
                    return;
                }

                console.log('Transaction committed');
                res.status(200).send('Data moved successfully');
            });
        });
    });
});

router.post('/delete', (req, res) => {
    const { userId } = req.body;

    // Delete items from cart_items
    const deleteQuery = 'DELETE FROM cart_items WHERE user_id = ?';
    mysqlConnection.query(deleteQuery, [userId], (err, deleteResult) => {
        if (err) {
            console.error('Error deleting cart items:', err);
            res.status(500).send('Error deleting cart items');
            return;
        }

        console.log('Items deleted from cart_items');
        res.status(200).send('Items deleted successfully');
    });
});
module.exports = router;
