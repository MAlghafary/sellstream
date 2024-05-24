const express = require("express");
const nodemailer = require("nodemailer");
const bodyParser = require("body-parser");
const mysqlConnection = require("../utils/database.js");
const isAuthenticated = require("../middlewares/isAuthenticated.js");
const router = express.Router();

const app = express();
// Middleware
app.use(bodyParser.json());

// Route to handle contact form submission
router.post("/", isAuthenticated, (req, res) => {
  const { name, email, subject, message } = req.body;

  // Insert data into MySQL database
  const sqlQuery =
    "INSERT INTO contactus (name, email, subject, message) VALUES (?, ?, ?, ?)";
  mysqlConnection.query(
    sqlQuery,
    [name, email, subject, message],
    (error, results, fields) => {
      if (error) {
        console.error("Error inserting data into MySQL:", error);
        res.status(500).json({ error: "Failed to save contact form data" });
        return;
      }
      console.log("Data inserted into MySQL");
      res.status(200).json({ message: "Email sent" });
    }
  );
});

module.exports = router;
