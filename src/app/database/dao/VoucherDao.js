const connection = require('../AppDatabase')
const { Voucher } = require('../models')

async function insert(voucher) {
	await Voucher.create(voucher)
}

module.exports = { insert }
