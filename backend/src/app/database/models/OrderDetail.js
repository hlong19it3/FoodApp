const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const OrderDetail = sequelize.define('order_detail', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    food_id: {
        type: DataTypes.INTEGER
    },
    order_id: {
        type: DataTypes.INTEGER
    },
    quantity: {
        type: DataTypes.INTEGER
    },
    amount: {
        type: DataTypes.INTEGER
    },
    created_at: {
        type: DataTypes.DATE, 
    defaultValue: DataTypes.NOW
    }
}, {
    timestamps: false
})

module.exports = OrderDetail
