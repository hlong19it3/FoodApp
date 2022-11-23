const connection = require('../AppDatabase')
const { OrderDetail } = require('../models')

async function insert(orderDetail) {
	await OrderDetail.create(orderDetail)
}

module.exports = { insert }
