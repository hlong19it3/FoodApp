const express = require('express')
const router = express.Router()

const { checkToken } = require('../../auth/token_validation')
const restaurantController = require('../../app/controllers/api/RestaurantController')
const { route } = require('express/lib/application')
const { isRestaurantOwner } = require('../../app/middleware/role')

// router
router.post('/create', checkToken, isRestaurantOwner, restaurantController.create)
router.post('/update', checkToken, restaurantController.update)
router.get('/select-by-id', checkToken, restaurantController.selectById)
router.get('/select-by-user-id', checkToken, restaurantController.selectUserId)
router.get('/delete', checkToken, restaurantController.deleteRestaurant)
router.get('/search', checkToken, restaurantController.search)

module.exports = router
