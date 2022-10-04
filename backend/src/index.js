const path = require('path')
const express = require('express')
const app = express()
const handlebar = require("express-handlebars")
const port = 3000

app.use(express.urlencoded({
  extended: true
}))
app.use(express.json())

// static files
app.use(express.static(path.join(__dirname, 'public')))

// views engine
app.engine('.hbs', handlebar.engine({
  extname: '.hbs'
}))
app.set('view engine', '.hbs')
app.set('views', path.join(__dirname, './views'))


//routes
const route = require('./routes/route');
route(app);

const mysql      = require('mysql');
// const connection = mysql.createConnection({
//   host     : 'sql6.freemysqlhosting.net',
//   user     : 'sql6523958',
//   password : 'at6iqdoAMyqhPB',
//   database : 'sql6523958'
// });
const connection = mysql.createConnection({
  host     : '127.0.0.1',
  port     : '3306',
  user     : 'root',
  password : '',
  database : 'bansach'
});

// const connection = mysql.createConnection({
//     host     : 'sql205.epizy.com',
//     port     : '3306',
//     user     : 'epiz_32717715',
//     password : 'at6iqdoAMyqhPB',
//     database : 'epiz_32717715_foodapp'
//   });
 
connection.connect(error =>{
  if(error) console.log(error)
});

connection.query('SELECT * FROM admin', function (error, results, fields) {
  if (error) throw error;
  console.log('The solution is: ', results[0]);
})

// run
app.listen(port, () => {
  console.log(`Example app listening on port http://localhost:${port}`)
})
