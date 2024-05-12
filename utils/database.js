const mysql = require("mysql2");

const mysqlConnection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "sellstrem",
  password: "dalia1122002",
  multipleStatements: true,
  authPlugins: {
    mysql_clear_password: () => () => Buffer.from("dalia1122002")
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