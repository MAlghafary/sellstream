const isAdmin = (req, res, next) => {
    // Check if the user is an admin
    if (req.user && req.user.role === 'admin') {
      return next(); // User is an admin, proceed to the next middleware
    } else {
      return res.status(403).json({ message: 'Forbidden' });
    }
  };
  
  module.exports = isAdmin ;
