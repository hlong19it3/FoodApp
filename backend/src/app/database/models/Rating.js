const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const Rating = sequelize.define('Rating', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    customer_id: {
        type: DataTypes.INTEGER
    },
    order_id: {
        type: DataTypes.INTEGER
    },
    score: {
        type: DataTypes.INTEGER
    }
}, {
    timestamps: false
})

module.exports = Rating
