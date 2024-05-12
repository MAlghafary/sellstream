/*
const mysqlConnection = require('../server');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();

// Middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Checkout Route
app.post('/checkout', (req, res) => {
    const { user_id, phone, email, City, street_address, company_name, first_Name, last_Name } = req.body;

    // Insert checkout info into database
    const checkoutInfo = 'INSERT INTO checkout_info (user_id,phone,email, City, street_address,company_name,first_Name,last_Name) VALUES (?, ?, ?, ?, ?, ?, ?,?)';
    mysqlConnection.query(checkoutInfo, [user_id, phone, email, City, street_address, company_name, first_Name, last_Name], (err, result) => {
        if (err) {
            console.error('Error inserting checkout info:', err);
            return res.status(500).json({ error: 'Error inserting checkout info' });
        }
        console.log('Checkout info inserted successfully');
        res.status(200).json({ message: 'Checkout completed successfully' });
    });
});
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
*/