const connection = require('../AppDatabase')
const Address = require('../models/Address')

async function insert(address){
    await Address.create(address)
}
async function create(address){
    await Address.create(address)
}

module.exports = {insert, create}
