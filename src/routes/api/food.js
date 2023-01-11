const express = require('express')
const router = express.Router()

const { checkToken } = require('../../auth/token_validation')
const foodController = require('../../app/controllers/api/FoodController')
const { isRestaurantOwner } = require('../../app/middleware/role')
const { uploadFood } = require('../../app/middleware/upload')

router.get('/all', checkToken, foodController.getAll)
router.get('/detail', checkToken, foodController.getAll)
router.get('/select-by-category-id', checkToken, foodController.selectByCategoryId)
router.post(
	'/create',
	checkToken,
	isRestaurantOwner,
	foodController.create
)
router.post(
	'/update',
	checkToken,
	isRestaurantOwner,
	foodController.update
)
router.get('/select-by-id', checkToken, foodController.selectById)
router.get('/select-by-restaurant-id', checkToken, foodController.selectByRestaurantId)
router.get('/delete', checkToken, isRestaurantOwner, foodController.deleteFood)
router.get('/search', checkToken, foodController.search)
router.get('/', checkToken, foodController.select)

module.exports = router
