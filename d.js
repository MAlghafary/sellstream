const express = require("express");
const app = express();
app.get('/', (req, res) => {
  res.send('hi dalia');

});

app.listen(3000, function () {
  console.log('port saart');
});





