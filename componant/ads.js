const mysqlConnection = require('../utils/database.js');
const isSeller = require('../middlewares/isSeller');
const express = require('express');
const isBuyer = require('../middlewares/isBuyer');
const router = express.Router();
const isAuthenticated = require('../middlewares/isAuthenticated.js');
const app = express();


// Validation middleware
function validateAdData(req, res, next) {
  const { product_name, description, price, contact, images } = req.body;
  if (!product_name || !description || !price || !contact || !images) {
    return res.status(400).json({ message: 'All fields are required' });
  }
  next();
}
// Route for adding a new ad with validation middleware
router.post('/', validateAdData, isAuthenticated, async (req, res, next) => {
  const user_role = req.user.role;
  console.log(req.user);
  if (user_role == 'seller') {
    console.log("User authenticated and is a seller");
    const { product_name, description, price, contact, images, seller_id } = req.body;

    const sql = `
      INSERT INTO products (product_name, description, price, contact, images, seller_id, approval_status)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    `;
    const values = [product_name, description, price, contact, images, seller_id, 'pending'];

    mysqlConnection.query(sql, values, (err, result) => {
      if (err) {
        console.error('Error inserting product:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }
      res.json(result);
    });
  } else {
    return res.status(401).json({ message: 'Unauthorized: you are not a seller' });
  }
});

/*
//save button

router.get('/post-ad', (req, res) => {
  res.render('postAd'); // Render the page with the form for creating ads
});
app.post('/post-ad', (req, res) => {
  const { title, description, price } = req.body;
  // Insert the ad details into the database
  mysqlConnection.query('INSERT INTO products (title, description, price) VALUES (?, ?, ?)', [title, description, price], (err, result) => {
    if (err) {
      console.log('Error posting ad:', err);
      res.status(500).json({ message: 'Error posting ad' });
    } else {
      console.log('Ad posted successfully');
      res.redirect('/'); // Redirect to homepage or any other page
    }
  });
});
*/

module.exports = router;





















































/*
               const insertId = await mysqlConnection.promise().query(
                   `INSERT INTO products (title, description, price,category,images, seller_id, status) 
                       VALUES (?, ?,?,?,?,?,?)`,
                   [title, description, price, category, images, req.user.id, 'pending']
               );
               /*app.post("/users", async (req, res) => {
                   try {
                     const { name, address, country } = req.body;
                     const [{ insertId }] = await connection.promise().query(
                       `INSERT INTO users (name, address, country) 
                           VALUES (?, ?,?)`,
                       [name, address, country]
                     );
                     res.status(202).json({
                       message: "User Created",
                     });
                   } catch (err) {
                     res.status(500).json({
                       message: err,
                     });
                   }
                 })*/




/*
             const insertId = await mysqlConnection.promise().query(
                 `INSERT INTO products (title, description, price,category,images, seller_id, status) 
                     VALUES (?, ?,?,?,?,?,?)`,
                 [title, description, price, category, images, req.user.id, 'pending']
             );
             /*app.post("/users", async (req, res) => {
                 try {
                   const { name, address, country } = req.body;
                   const [{ insertId }] = await connection.promise().query(
                     `INSERT INTO users (name, address, country) 
                         VALUES (?, ?,?)`,
                     [name, address, country]
                   );
                   res.status(202).json({
                     message: "User Created",
                   });
                 } catch (err) {
                   res.status(500).json({
                     message: err,
                   });
                 }
               })*/