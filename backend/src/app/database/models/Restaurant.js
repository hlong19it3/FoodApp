const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const Restaurant = sequelize.define('Restaurant', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING
    },
    voucher_id: {
        type: DataTypes.INTEGER
    },
    address: {
        type: DataTypes.STRING
    },
    rating: {
        type: DataTypes.FLOAT
    }
}, {
    timestamps: false
})

module.exports = Restaurant
