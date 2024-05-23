const express = require("express");
const router = express.Router();
const mysqlConnection = require('../utils/database.js');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

router.post('/', async (req, res) => {
    const { email, password } = req.body;
    console.log(email)
    console.log(password)

    try {
        mysqlConnection.query('SELECT * FROM users WHERE email = ?', [email], async (err, results) => {
            if (err) {
                console.log('Error during login:', err);
                return res.status(500).json({ message: 'Internal Server Error' });
            }

            if (results.length > 0) {
                const user = results[0];
                const match = await bcrypt.compare(password, user.password);

                if (match) {
                    console.log('Login successful');
                    const token = jwt.sign({ userId: user.user_id, role: user.user_type }, '%AZZ)oYObUuxw}eN!Iv&T$!|`>?4Q~', {
                        expiresIn: '1h',
                    });
                    res.status(200).json({ token });
                } else {
                    console.log('Incorrect password');
                    return res.status(401).json({ error: 'Incorrect password' });
                }
            } else {
                console.log('User not found. Please register.');
                return res.status(404).json({ error: 'User not found. Please register.' });
            }
        });
    } catch (error) {
        console.error('Error during login:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
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
