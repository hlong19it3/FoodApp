const connection = require('../AppDatabase')
const Category = require('../models/Categories')

async function insert(category){
    
    await Category.create(category)
}


module.exports = {insert}
