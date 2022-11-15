const express = require('express')
const router = express.Router()

const { checkToken, isAdmin } = require('../../auth/token_validation')
const restaurantController = require('../../app/controllers/api/RestaurantController')
const { route } = require('express/lib/application')

router.post('/create', checkToken, restaurantController.create)
router.post('/update', checkToken, restaurantController.update)
router.get('/select-by-id/:id', checkToken, restaurantController.selectById)
router.get('/select-by-user-id/:id', checkToken, restaurantController.selectUserId)
router.get('/delete', checkToken, restaurantController.deleteRestaurant)
router.get('/search/:keyword', checkToken, restaurantController.search)

module.exports = router
