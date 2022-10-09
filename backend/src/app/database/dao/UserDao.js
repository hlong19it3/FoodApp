const connection = require('../AppDatabase')
const [User] = require('../models')

async function insert(user){
    await User.create(user)
}

module.exports = {insert}
