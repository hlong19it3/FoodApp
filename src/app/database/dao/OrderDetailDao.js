const { orderStatus, statusCode } = require('../../common/constants')
const { Order, OrderDetail, Food } = require('../models')
const orderDao = require('./OrderDao')

async function insert(order, listOfOrder) {
	try {
		for (const i in listOfOrder) {
			const food = await Food.findOne({
				where: {
					id: listOfOrder[i].foodId,
				},
			})

			if (food && food.restaurantId == order.restaurantId) {
				await OrderDetail.create({
					foodId: food.id,
					orderId: order.id,
					quantity: listOfOrder[i].quantity,
					amount: food.price * listOfOrder[i].quantity,
				})
			}
		}
		return await OrderDetail.sum('amount', { where: { orderId: order.id } })
	} catch (error) {
		console.log(error)
		return 0
	}
}

module.exports = { insert }
