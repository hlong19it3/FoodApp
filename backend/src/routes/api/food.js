const express = require('express')
const router = express.Router()

const { checkToken } = require('../../auth/token_validation')
const foodController = require('../../app/controllers/api/FoodController')
const { isRestaurantOwner } = require('../../app/middleware/role')
const { upload, storage } = require('../../app/middleware/upload')

router.post('/create', checkToken, isRestaurantOwner, upload.single('image'), foodController.create)
router.post('/update', checkToken, isRestaurantOwner, upload.single('image'), foodController.update)
router.get('/select-by-id', checkToken, foodController.selectById)
router.get('/select-by-restaurant-id', checkToken, foodController.selectByRestaurantId)
router.get('/delete', checkToken, isRestaurantOwner, foodController.deleteFood)
router.get('/search', checkToken, foodController.search)

module.exports = router
