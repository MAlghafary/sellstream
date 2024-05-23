const express = require("express");
const router = express.Router();
const jwt = require('jsonwebtoken');
const User = require('../models/User');

router.post('/', (req, res) => {
    const { email, password } = req.body;

    User.findByEmail(email, (err, user) => {
        if (err) {
            console.error('Error during login:', err);
            return res.status(500).json({ message: 'Internal Server Error' });
        }

        if (!user) {
            console.log('User not found. Please register.');
            return res.status(404).json({ error: 'User not found. Please register.' });
        }

        user.verifyPassword(password, (err, match) => {
            if (err) {
                console.error('Error during password verification:', err);
                return res.status(500).json({ message: 'Internal Server Error' });
            }

            if (match) {
                console.log('Login successful');
                const token = jwt.sign({ userId: user.userId, role: user.userType }, '%AZZ)oYObUuxw}eN!Iv&T$!|`>?4Q~', {
                    expiresIn: '1h',
                });
                res.status(200).json({ token : token,email :user.email , usertype : user.userType});
            } else {
                console.log('Incorrect password');
                return res.status(401).json({ error: 'Incorrect password' });
            }
        });
    });
});

function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function isValidPassword(password) {
    const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    return passwordRegex.test(password);
}

module.exports = router;
