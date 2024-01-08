// db.js
var mysql = require("mysql");
var pool = mysql.createPool({
  host: "121.229.99.43",
  user: "root",
  password: "wtywfy5618754",
  database: "icloudmanager",
});
function query(sql) {
  return new Promise((resolve, reject) => {
    pool.getConnection(function (err, connection) {
      connection.query(sql, function (err, result) {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
        connection.release();
      });
    });
  });
}
exports.query = query;
