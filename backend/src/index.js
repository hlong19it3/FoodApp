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

// const {insert} = require('./app/database/dao/FoodDao')
// insert()

// run
app.listen(port, () => {
  console.log(`Example app listening on port http://localhost:${port}`)
})
