const mysqlConnection = require('../utils/database.js');
const bcrypt = require('bcrypt');

class User {
  constructor(user) {
    this.userId = user.user_id;
    this.email = user.email;
    this.password = user.password;
    this.userType = user.user_type;
  }

  static findByEmail(email, callback) {
    mysqlConnection.query('SELECT * FROM users WHERE email = ?', [email], (err, results) => {
      if (err) {
        return callback(err, null);
      }
      if (results.length > 0) {
        callback(null, new User(results[0]));
      } else {
        callback(null, null);
      }
    });
  }

  verifyPassword(password, callback) {
    bcrypt.compare(password, this.password, (err, result) => {
      if (err) {
        return callback(err);
      }
      callback(null, result);
    });
  }
}

module.exports = User;
