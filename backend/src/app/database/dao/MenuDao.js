const connection = require('../AppDatabase')
const Menu = require('../models/Menus')

async function insert(menu){
    
    await Menu.create(menu)
}

module.exports = {insert}
