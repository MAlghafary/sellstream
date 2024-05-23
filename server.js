const express = require("express");
const bodyParser = require("body-parser");
const qbRoutes = require("./routes/qb");
const products = require("./componant/products.js")
const wishlist = require("./componant/wishlist.js")
const contactus = require("./componant/contactus.js")
const cart = require("./componant/cart.js")
const login = require("./componant/login.js")
const register = require("./componant/register.js")
const ads = require("./componant/ads.js")
const home = require("./componant/home.js")
const checkout = require("./componant/checkout.js")
const dashboard = require("./componant/dashboard.js")
const cors = require('cors');



const app = express();
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session);



//session
const sessionStore = new MySQLStore({
  host: 'localhost',
  user: 'root',
  database: 'sell',
  password: '',
  clearExpired: true,
  checkExpirationInterval: 900000,
  expiration: 86400000
});

app.use(session({
  secret: 'daligjgjf',
  resave: false,
  saveUninitialized: true,
  store: sessionStore
}));
// Middleware

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.urlencoded({ extended: true }));

// Routes

app.use('/products', products)
app.use('/wishlist', wishlist)
app.use('/contactus', contactus)
app.use('/cart', cart)
app.use('/login', login) // Done 
app.use('/register', register) // Done 
app.use('/ads', ads)
app.use('/home', home)
app.use('/checkout', checkout)
app.use('/dashboard', dashboard)


app.get('/', (req, res) => {
  res.send('hi dalia');
});






const PORT = process.env.PORT || 6001;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});


