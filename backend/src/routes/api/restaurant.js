const express = require('express')
const router = express.Router()

const { checkToken, isAdmin } = require('../../auth/token_validation')
const restaurantController = require('../../app/controllers/api/RestaurantController')

router.post('/create', checkToken, restaurantController.create)
router.post('/update', restaurantController.update)
router.get('/select-by-id/:id', restaurantController.selectById)
router.get('/select-by-user-id/:id', restaurantController.selectUserId)

module.exports = router
