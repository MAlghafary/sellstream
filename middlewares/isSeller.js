
// isSeller middleware
const isSeller = (req, res, next) => {
  // Check if the user is a seller
  if (req.user && req.user.role === 'seller') {
    return next();
  } else {
    return res.status(403).json({ message: 'Forbidden' });
  }
};

module.exports = isSeller;
