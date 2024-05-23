const express = require("express");
const router = express.Router();
const mysqlConnection = require("../utils/database.js");
const bcrypt = require("bcrypt");
const isAuthenticated = require("../middlewares/isAuthenticated.js");

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

function checkEmailExistence(email, callback) {
  const query = "SELECT * FROM users WHERE email = ?";
  mysqlConnection.query(query, [email], (error, results) => {
    if (error) {
      console.error("Error checking email existence:", error);
      return callback(error, null);
    }

    // If a user with the provided email exists, return an error response
    if (results.length > 0) {
      return callback(null, true); // Email exists
    }

    // Email doesn't exist
    callback(null, false);
  });
}

router.post("/", async (req, res) => {
  const { username, email, password, userType } = req.body;

  // Check if email is valid
  if (!isValidEmail(email)) {
    return res.status(400).json({ message: "Invalid email address" });
  }

  // Check if the email already exists
  checkEmailExistence(email, (error, emailExists) => {
    if (error) {
      console.error("Error checking email existence:", error);
      return res.status(500).json({ error: "Server error , please try again" });
    }

    if (emailExists) {
      return res.status(400).json({ error: "Email already exists" });
    }

    // Check if password meets criteria
    if (!isValidPassword(password)) {
      return res
        .status(400)
        .json({
          error:
            "Password must be at least 8 characters long and include at least one number",
        });
    }

    try {
      const saltRounds = 10;
      bcrypt.genSalt(saltRounds, (err, salt) => {
        if (err) {
          console.error("Error generating salt:", err);
          return res.status(500).json({ error: "Server error" });
        }

        bcrypt.hash(password, salt, async (err, hashedPassword) => {
          if (err) {
            console.error("Error hashing password:", err);
            return res.status(500).json({ error: "Server error" });
          }

          const user = [username, email, hashedPassword, userType];

          mysqlConnection.query(
            "INSERT INTO users (username, email, password, user_type) VALUES (?, ?, ?, ?)",
            user,
            (err, result) => {
              if (err) {
                console.error("Error registering user:", err);
                return res.status(500).json({ error: "Error registering user" });
              }
              console.log("User registered successfully");
              return res
                .status(200)
                .json({ message: "User registered successfully" });
            }
          );
        });
      });
    } catch (error) {
      console.error("Error registering user:", error);
      return res.status(500).json({ error: "Error registering user" });
    }
  });
});

module.exports = router;
