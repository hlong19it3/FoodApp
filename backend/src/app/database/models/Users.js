const { Sequelize, DataTypes, Model } = require('sequelize');
const sequelize = require('../AppDatabase')

const User = sequelize.define('User',{
  // Model attributes are defined here
  id:{
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  role: {
    type: DataTypes.INTEGER
  },
  first_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  last_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  address: {
    type: DataTypes.STRING
  },
  birthday: {
    type: DataTypes.DATEONLY
  },
  gender: {
    type: DataTypes.TINYINT
  },
  email: {
    type: DataTypes.STRING
  },
  phone: {
    type: DataTypes.STRING
  },
  password: {
    type: DataTypes.STRING
  },
  status:{
    type: DataTypes.TINYINT
  },
  registration_time: {
    type: DataTypes.DATE
  },
  last_action: {
    type: DataTypes.DATE
  },
  lat: {
    type: DataTypes.FLOAT
  },
  lg: {
    type: DataTypes.FLOAT
  },
  avatar: {
    type: DataTypes.STRING
  },
  // created_at: { 
  //   type: DataTypes.DATE, 
  //   defaultValue: DataTypes.NOW 
  // }
}, {
  timestamps: false
});

module.exports = User
