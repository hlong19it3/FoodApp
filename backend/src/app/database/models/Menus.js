const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const Menu = sequelize.define('Menu',{
  id:{
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  food_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  restaurant_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  price: {
    type: DataTypes.INTEGER
  },
  description: {
    type: DataTypes.STRING
  }
}, {
  timestamps: false
});

module.exports = Menu
