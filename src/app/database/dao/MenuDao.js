const connection = require('../AppDatabase')
const { Menu } = require('../models')
const { Op } = require('sequelize')

async function insert(menu) {
	return await Menu.findOrCreate({
		where: {
			restaurantId: menu.restaurantId,
		},
		defaults: {
			foodId: '',
			description: menu.description,
		},
	})
}

const update = async (id, menu) => {
	return await Menu.update(
		{
			foodId: menu.foodId,
			description: menu.description,
		},
		{
			where: {
				restaurantId: id,
			},
		}
	)
}

const selectById = async (id) => {
	return await Menu.findAll({
		where: {
			id: id,
		},
	})
}

const selectByRestaurantId = async (restaurantId) => {
	return await Menu.findAll({
		where: {
			restaurantId,
		},
	})
}

const deleteMenu = async (id) => {
	return await Menu.destroy({
		where: {
			id: id,
		},
	})
}

module.exports = { insert, update, selectById, selectByRestaurantId, deleteMenu }
