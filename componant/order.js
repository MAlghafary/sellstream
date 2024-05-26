const express = require('express');
const router = express.Router();
const Order = require('../models/Order');
const isAuthenticated = require('../middlewares/isAuthenticated');

// Create a new order from cart items
router.post('/',isAuthenticated, (req, res) => {
  const {
    firstName,
    lastName,
    streetAddress,
    city,
    email,
    phone,
    notes,
    cartItems
  } = req.body;

  // Map cart items to order items format and calculate total amount
  const items = cartItems.map(cartItem => ({
    product_id: cartItem.id,
    quantity: cartItem.quantity,
    unit_price: parseFloat(cartItem.price),
    total_price: parseFloat((cartItem.price - (cartItem.price * (cartItem.discount/100))) * cartItem.quantity )
  }));

  const total_amount = items.reduce((total, item) => total + item.total_price, 0);

  // Create a new order
  const order = new Order(
    null,
    req.user.userId,
    firstName,
    lastName,
    streetAddress,
    city,
    email,
    phone,
    notes,
    'pending', // status set to 'pending'
    total_amount,
    new Date(), // order_date_time set to now
    items
  );

  // Save the order
  order.save((err, savedOrder) => {
    if (err) {
      res.status(500).json({ error: 'Failed to create order' });
    } else {
      res.status(201).json({ message: 'Order created successfully', order: savedOrder });
    }
  });
});

module.exports = router;
