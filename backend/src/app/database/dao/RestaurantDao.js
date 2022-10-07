const connection = require('../AppDatabase')
const Restaurant = require('../models/Restaurant')

async function insert(restaurant){
    await OrderDetail.create(restaurant)
}

module.exports = {insert}
