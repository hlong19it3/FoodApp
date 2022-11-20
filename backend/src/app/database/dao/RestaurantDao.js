const connection = require('../AppDatabase')
const { Restaurant } = require('../models')
const { Op } = require('sequelize')

const insert = async (restaurant) => {
	return await Restaurant.findOrCreate({
		where: { user_id: restaurant.user_id },
		defaults: {
			name: restaurant.name,
			address: restaurant.address,
		},
	})
}

const update = async (restaurant, user_id) => {
	return await Restaurant.update(
		{
			name: restaurant.name,
			address: restaurant.address,
		},
		{
			where: {
				user_id: user_id,
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

const selectUserId = async (user_id) => {
	return Restaurant.findOne({
		where: {
			user_id: user_id,
		},
		raw: true,
	})
}

const deleteRestaurant = async (user_id) => {
	return await Restaurant.destroy({
		where: {
			user_id: user_id,
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
