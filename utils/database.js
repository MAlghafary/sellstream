const mysql = require("mysql2");

const mysqlConnection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "sell",
  password: "",
  multipleStatements: true,
  authPlugins: {
    mysql_clear_password: () => () => Buffer.from("")
  }
});

mysqlConnection.connect((err) => {

  if (err) {
    console.error("Connection Failed: " + err.message);
    return;
  }
  console.log("Connected to MySQL database");
});

module.exports = mysqlConnection;