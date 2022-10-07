const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const Order = sequelize.define('Order',{
  id:{
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  customer_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  restaurant_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  order_date: {
    type: DataTypes.DATE,
    allowNull: false
  },
  total_amount: {
    type: DataTypes.INTEGER
  },
  order_status: {
    type: DataTypes.INTEGER
  },
  created_at: { 
    type: DataTypes.DATE, 
    defaultValue: DataTypes.NOW 
  }
}, {
  timestamps: false
});

module.exports = Order
