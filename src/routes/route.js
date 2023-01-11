const express = require('express')
const router = express.Router()
const api = require('./api')
const webRoute = require('./web')

function route(app) {
	// api route
	app.use('/api', api)

	// web route
	app.use('/', webRoute)
}

module.exports = route
