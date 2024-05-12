const isBuyer= (req, res, next) => {
    // Check if the user is a seller
    if (req.user && req.user.role === 'buyer') {
      return next(); 
    } else {
      return res.status(403).json({ message: 'Forbidden' });
    }
  };
  module.exports = isBuyer;
