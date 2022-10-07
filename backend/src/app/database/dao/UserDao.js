const connection = require('../AppDatabase')
const User = require('../models/Users')

async function insert(user){
/*
user data example
    { 
        role: 1,
        first_name: 'thai',
        last_name: 'Phuoc',
        address: 'qiqwie',
        birthday: '2016-01-01',
        gender: 1,
        email: "thaiphuoc",
        phone: '01923021843',
        password: 'njkedsliugfdehif',
        status: 1,
        registration_time: '2016-01-01 20:12:12',
        last_action: '2022-01-01 20:12:12',
        lat: 1.2,
        lg: 11,
        avatar: 'fiugwgrfiuwe'
    }
*/
    await User.create(user)
}

module.exports = {insert}
