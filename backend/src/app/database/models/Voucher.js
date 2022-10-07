const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const Voucher = sequelize.define('Voucher', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: {
        type: DataTypes.STRING
    },
    type: {
        type: DataTypes.TINYINT
    },
    value: {
        type: DataTypes.FLOAT
    }
}, {
    timestamps: false
})

module.exports = Voucher
