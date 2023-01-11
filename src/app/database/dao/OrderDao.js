const connection = require('../AppDatabase')
const { Order, OrderDetail, Restaurant, Food } = require('../models')

const insert = async (order) => {
	return await Order.create(order)
}

const update = async (order) => {
	return await Order.update(
		{
			totalAmount: order.totalAmount,
			orderStatus: order.orderStatus,
		},
		{
			where: {
				id: order.id,
			},
		}
	)
}

const deleteOrder = async (id) => {
	return await Order.destroy({
		where: {
			id: id,
		},
	})
}

const selectById = async (id) => {
	return await Order.findOne({
		where: {
			id: id,
		},
		include: [
			{
				model: OrderDetail,
				include: Food,
			},
			Restaurant,
		],
	})
}

const selectByUserId = async (id) => {
	return await Order.findAll({
		where: {
			customerId: id,
		},
		include: [
			{
				model: OrderDetail,
				include: Food,
			},
			Restaurant,
		],
	})
}

const selectByRestaurantId = async (id) => {
	return await Order.findAll({
		include: [
			{
				model: OrderDetail,
				include: Food,
			},
			{
				model: Restaurant,
				where: { userId: id },
				required: true,
			},
		],
	})
}

const selectByShipper = async (id) => {
	return await Order.findAll({
		where: {
			shipperId: id,
		},
		include: [
			{
				model: OrderDetail,
				include: Food,
			},
			Restaurant,
		],
	})
}

const selectAll = async () => {
	return await Order.findAll({
		include: [
			{
				model: OrderDetail,
				include: Food,
			},
			Restaurant,
		],
	})
}

module.exports = {
	insert,
	update,
	deleteOrder,
	selectById,
	selectByUserId,
	selectByRestaurantId,
	selectByShipper,
	selectAll,
}
