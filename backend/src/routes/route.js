const express = require('express');
const router = express.Router();
const api = require('./api')
const webRoute = require('./web')

var bodyParser = require('body-parser')

// create application/json parser
var jsonParser = bodyParser.json()

function route(app){
 
    // api route
    app.use('/api', api)

    // web route
    app.use("/", webRoute)
}

module.exports = route;
