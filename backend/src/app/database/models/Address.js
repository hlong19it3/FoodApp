const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const Address = sequelize.define('address', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    customer_id: {
        type: DataTypes.INTEGER
    },
    address: {
        type: DataTypes.STRING
    }
}, {
    timestamps: false
})

module.exports = Address
