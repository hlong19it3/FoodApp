const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const Food = sequelize.define('foods',{
  // Model attributes are defined here
  id:{
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  restaurant_id: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  price: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  details: {
    type: DataTypes.STRING,
    allowNull: true
  },
  image: {
    type: DataTypes.STRING
  },
  quantity: {
    type: DataTypes.INTEGER
  },
  start_sell: {
    type: DataTypes.TIME
  },
  end_sell: {
    type: DataTypes.TIME
  },
  category_id: {
    type: DataTypes.INTEGER,
    allowNull: true
  }
}, {
  timestamps: false
});

module.exports = Food
