const connection = require('../AppDatabase')
const [Rating] = require('../models')

async function insert(rating){
    await Rating.create(rating)
}

module.exports = {insert}
