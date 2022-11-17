const express = require('express')
const router = express.Router()

const { checkToken } = require('../../auth/token_validation')
const menuController = require('../../app/controllers/api/MenuController')
const { isRestaurantOwner } = require('../../app/middleware/role')

router.post('/create', checkToken, isRestaurantOwner, menuController.create)
router.post('/update', checkToken, isRestaurantOwner, menuController.update)
router.get('/select-by-id', checkToken, menuController.selectById)
router.get('/select-by-restaurant-id', checkToken, menuController.selectByRestaurantId)
router.get('/delete', checkToken, isRestaurantOwner, menuController.deleteMenu)

module.exports = router
