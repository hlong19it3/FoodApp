const connection = require('../AppDatabase')
const [Restaurant] = require('../models')

async function insert(restaurant){
    await Restaurant.create(restaurant)
}

module.exports = {insert}
