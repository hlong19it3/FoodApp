const connection = require('../AppDatabase')
const { Order } = require('../models')

async function insert(order) {
	await Order.create(order)
}

module.exports = { insert }
