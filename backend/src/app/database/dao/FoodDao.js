const connection = require('../AppDatabase')
const Food = require('../models/Foods')

async function insert(food){
    
    await Food.create(food)
}

module.exports = {insert}
