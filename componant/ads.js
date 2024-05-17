const mysqlConnection = require('../utils/database.js');
const isAuthenticated = require('../middlewares/isAuthenticated');
const isAdmin = require('../middlewares/isAdmin');
const isSeller = require('../middlewares/isSeller');
const express = require('express');
const isBuyer = require('../middlewares/isBuyer');
const router = express.Router();

const app = express();
//category delet

// Route for adding a new ad
router.use((err, req, res, next) => {
  console.error('Error:', err);
  res.status(500).json({ message: 'Internal server error' });
});

//const getConnection = () => mysqlConnection.promise().getConnection();

// Validation middleware
function validateAdData(req, res, next) {
  const { product_name, description, price, category, images } = req.body;
  if (!product_name || !description || !price || !category || !images) {
    return res.status(400).json({ message: 'All fields are required' });
  }
  next();
}

// Route for adding a new ad with validation middleware
router.post('/', validateAdData, async (req, res, next) => {
  try {
    const { product_name, description, price, category, images } = req.body;
    //const connection = await getConnection();
    const [result] = await mysqlConnection.query(
      `INSERT INTO products (product_name, description, price, category, images, seller_id, status) 
          VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [product_name, description, price, category, images, req.user.id, 'pending']
    );
    const insertedId = result.insertId;
    connection.release();
    res.status(201).json({ message: 'Ad submitted for approval', id: insertedId });
  } catch (error) {
    next(error);
  }
});

/*
// Route for admin to approve ads
app.put('/admin/ads/:id/approve', isAuthenticated, isAdmin, async (req, res, next) => {
  try {
    const adId = req.params.id;
    const connection = await getConnection();
    const [existingAds] = await connection.query('SELECT * FROM products WHERE id = ?', [adId]);
    if (existingAds.length === 0) {
      return res.status(404).json({ message: 'Ad not found' });
    }
    await connection.query('UPDATE products SET status = ? WHERE id = ?', ['approved', adId]);
    connection.release();
    res.json({ message: 'Ad approved successfully' });
  } catch (error) {
    next(error);
  }
});

// Route for admin to reject ads
router.put('/admin/ads/:id/reject', isAuthenticated, isAdmin, async (req, res, next) => {
  try {
    const adId = req.params.id;
    //const connection = await getConnection();
    const [existingAds] = await connection.query('SELECT * FROM products WHERE id = ?', [adId]);
    if (existingAds.length === 0) {
      return res.status(404).json({ message: 'Ad not found' });
    }
    await connection.query('UPDATE products SET status = ? WHERE id = ?', ['rejected', adId]);
    connection.release();
    res.json({ message: 'Ad rejected successfully' });
  } catch (error) {
    next(error);
  }
});

app.use('/ads', router);


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