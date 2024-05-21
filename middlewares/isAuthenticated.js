const jwt = require('jsonwebtoken');

const isAuthenticated = (req, res, next) => {
  // Check if the user is logged in (e.g., by verifying the presence of a JWT token)
  const token = req.headers.authorization;
  if (!token) {
    return res.status(401).json({ message: 'Unauthorized' });
  }

  // Verify the token 
  try {
    const decoded = jwt.verify(token, '%AZZ)oYObUuxw}eN!Iv&T$!|`>?4Q~');
    console.log(decoded)
    req.user = decoded;
    next();
  } catch (error) {
    console.log(error)
    return res.status(401).json({ message: 'Unauthorized' });
  }
};
module.exports = isAuthenticated;
