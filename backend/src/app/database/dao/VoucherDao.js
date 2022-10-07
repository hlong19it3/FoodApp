const connection = require('../AppDatabase')
const Voucher = require('../models/Voucher')

async function insert(voucher){
    await OrderDetail.create(voucher)
}

module.exports = {insert}
