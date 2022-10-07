const connection = require('../AppDatabase')
const Rating = require('../models/Rating')

async function insert(rating){
    await OrderDetail.create(rating)
}

module.exports = {insert}
