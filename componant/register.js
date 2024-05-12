const express = require("express");
const router = express.Router();
const mysqlConnection = require('../utils/database.js');
const bcrypt = require('bcrypt');

// Function to validate email format
function isValidEmail(email) {
    // Add email validation logic here
    return true; // Placeholder, implement actual validation
}

// Function to validate password criteria
function isValidPassword(password) {
    // Add password validation logic here
    return password.length >= 8 && /\d/.test(password); // Placeholder, implement actual validation
}

router.post('/', async (req, res) => {
    const { username, email, password, user_type } = req.body;

    // Check if email is valid
    if (!isValidEmail(email)) {
        return res.status(400).json({ message: 'Invalid email address' });
    }

    // Check if password meets criteria
    if (!isValidPassword(password)) {
        return res.status(400).json({ message: 'Password must be at least 8 characters long and include at least one number' });
    }

    try {
        const saltRounds = 10;
        const salt = await bcrypt.genSalt(saltRounds);
        const hashedPassword = await bcrypt.hash(password, salt);

        const user = [username, email, hashedPassword, user_type];

        mysqlConnection.query('INSERT INTO users (username, email, password, user_type) VALUES (?, ?, ?, ?)', user, (err, result) => {
            if (err) {
                console.log('Error registering user:', err);
                return res.status(500).json({ message: 'Error registering user' });
            }
            console.log('User registered successfully');
            return res.status(200).json({ message: 'User registered successfully' });
        });
    } catch (error) {
        console.error('Error registering user:', error);
        return res.status(500).json({ message: 'Error registering user' });
    }
});

module.exports = router;
