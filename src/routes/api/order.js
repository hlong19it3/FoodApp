const express = require('express')
const router = express.Router()
const orderController = require('../../app/controllers/api/OrderController')

const { checkToken } = require('../../auth/token_validation')
const {
  isRestaurantOwner,
  isUser,
  isShipper,
} = require('../../app/middleware/role')

router.post('/create', checkToken, isUser, orderController.create)
// router.post('/update', checkToken, orderController.update)
router.post(
  '/restaurant-receive',
  checkToken,
  isRestaurantOwner,
  orderController.restaurantReceiveOrder
)
router.post(
  '/shipper-receive',
  checkToken,
  isShipper,
  orderController.shipperReceiveOrder
)
router.post(
  '/shipping',
  checkToken,
  isRestaurantOwner,
  orderController.shipping
)
router.post('/delivered', checkToken, isShipper, orderController.delivered)
//
// router.post(
// 	'/select-by-restaurant-id',
// 	checkToken,
// 	isRestaurantOwner,
// 	orderController.selectByRestaurantId
// )
// router.post('/select-by-user-id', checkToken, isUser, orderController.selectByUserId)
router.get('/', checkToken, orderController.select)

module.exports = router
