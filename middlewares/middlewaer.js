const express = require('express');
const isAuthenticated = require('./middlewares/isAuthenticated');
const isAdmin = require('./middlewares/isAdmin');
const isSeller = require('./middlewares/isSeller');
const isBuyer = require('./middlewares/isBuyer');
const mysqlConnection = require('./server');

// Create an instance of Express
const app = express();
/*
// Define routes and apply middleware
app.get('/admin/dashboard', isAuthenticated, isAdmin, (req, res) => {
  // Only admins can access this route
  res.json({ message: 'Admin dashboard' });
});

app.get('/seller/addproducts', isAuthenticated, isSeller, (req, res) => {
  // Only sellers can access this route
  res.json({ message: 'Seller products' });
});

app.get('/buyer/orders', isAuthenticated, isBuyer, (req, res) => {
  // Only buyers can access this route
  res.json({ message: 'Buyer orders' });
});
*/

//new ads

const router = express.Router();

// Route for adding a new ad
router.post('/ads', isAuthenticated, isSeller, async (req, res) => {
  try {
    const { title, description, price, category, images,
      video, } = req.body;

    // Validate input data
    if (!title || !description || !price || !category || !images ||
      !video) {
      return res.status(400).json({ message: 'All fields are required' });
    }

    // Insert the new ad into the database with status pending
    const newAd = {
      title,
      description,
      category,
      images,
      video,
      seller_id: req.user.id, // Assuming you have user information available in req.user
      status: 'pending'
    };

    const result = mysqlConnection.query('INSERT INTO products SET ?', newAd);
    const insertedId = result.insertId;

    res.status(201).json({ message: 'Ad submitted for approval', id: insertedId });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

// Route for admin to approve ads
router.put('/admin/ads/:id/approve', isAuthenticated, isAdmin, async (req, res) => {
  try {
    const adId = req.params.id;

    // Check if the ad exists
    const [existingAds] = mysqlConnection.query('SELECT * FROM ads WHERE id = ?', [adId]);
    if (existingAds.length === 0) {
      return res.status(404).json({ message: 'Ad not found' });
    }

    // Update ad status to approved
    mysqlConnection.query('UPDATE ads SET status = ? WHERE id = ?', ['approved', adId]);

    res.json({ message: 'Ad approved successfully' });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

// Route for admin to reject ads
router.put('/admin/ads/:id/reject', isAuthenticated, isAdmin, async (req, res) => {
  try {
    const adId = req.params.id;

    // Check if the ad exists
    const [existingAds] = mysqlConnection.query('SELECT * FROM products WHERE id = ?', [adId]);
    if (existingAds.length === 0) {
      return res.status(404).json({ message: 'Ad not found' });
    }

    // Update ad status to rejected
    mysqlConnection.query('UPDATE products SET status = ? WHERE id = ?', ['rejected', adId]);

    res.json({ message: 'Ad rejected successfully' });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

module.exports = router;
//save button

app.get('/post-ad', (req, res) => {
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


// Start the server
app.listen(3000, () => {
  console.log('Server is running on port 3000');
});