const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const Category = sequelize.define('Category',{
    id:{
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    type: {
      type: DataTypes.STRING
    }
  }, {
    timestamps: false
  });
  
  module.exports = Category
