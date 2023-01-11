const express = require('express')
const router = express.Router()

// import sub route
const defaultRoute = require('./default')
const restaurantRoute = require('./restaurant')
const menuRoute = require('./menu')
const addressRoute = require('./address')
const foodRoute = require('./food')
const categoryRoute = require('./category')
const orderRoute = require('./order')

router.use('/restaurant', restaurantRoute)
router.use('/menu', menuRoute)
router.use('/address', addressRoute)
router.use('/food', foodRoute)
router.use('/category', categoryRoute)
router.use('/order', orderRoute)
router.use('/', defaultRoute)

module.exports = router
