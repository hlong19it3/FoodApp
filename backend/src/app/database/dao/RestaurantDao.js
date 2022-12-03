const connection = require('../AppDatabase')
const { Restaurant } = require('../models')
const { Op } = require('sequelize')

const insert = async (restaurant) => {
	return await Restaurant.findOrCreate({
		where: { userId: restaurant.userId },
		defaults: {
			name: restaurant.name,
			address: restaurant.address,
		},
	})
}

const update = async (restaurant, userId) => {
	return await Restaurant.update(
		{
			name: restaurant.name,
			address: restaurant.address,
		},
		{
			where: {
				userId: userId,
			},
		}
	)
}

const selectById = async (id) => {
	return await Restaurant.findAll({
		where: {
			id: id,
		},
	})
}

const selectUserId = async (userId) => {
	return Restaurant.findOne({
		where: {
			userId: userId,
		},
		raw: true,
	})
}

const deleteRestaurant = async (userId) => {
	return await Restaurant.destroy({
		where: {
			userId: userId,
		},
	})
}

const search = async (keyword) => {
	return await Restaurant.findAll({
		where: {
			name: {
				[Op.substring]: keyword,
			},
		},
	})
}

module.exports = { insert, update, selectById, selectUserId, deleteRestaurant, search }
