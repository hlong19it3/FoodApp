const connection = require('../AppDatabase')
const { Restaurant } = require('../models')
const { Op } = require('sequelize')

function insert(restaurant) {
	return Restaurant.findOrCreate({
		where: { user_id: restaurant.user_id },
		defaults: {
			name: restaurant.name,
			address: restaurant.address,
		},
	})
}

async function update(restaurant) {
	return await Restaurant.update(
		{
			name: restaurant.name,
			address: restaurant.address,
		},
		{
			where: {
				id: restaurant.id,
			},
		}
	)
}

function selectById(id) {
	return Restaurant.findAll({
		where: {
			id: id,
		},
	})
}

function selectUserId(user_id) {
	return Restaurant.findOne({
		where: {
			user_id: user_id,
		},
		raw: true,
	})
}

async function deleteRestaurant(user_id) {
	return await Restaurant.destroy({
		where: {
			user_id: user_id,
		},
	})
}

async function search(keyword) {
	return await Restaurant.findAll({
		where: {
			name: {
				[Op.substring]: keyword,
			},
		},
	})
}

module.exports = { insert, update, selectById, selectUserId, deleteRestaurant, search }
