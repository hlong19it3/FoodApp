const connection = require('../AppDatabase')
const { Menu } = require('../models')
const { Op } = require('sequelize')

async function insert(menu) {
	return await Menu.findOrCreate({
		where: {
			restaurant_id: menu.restaurant_id,
		},
		defaults: {
			food_id: '',
			description: menu.description,
		},
	})
}

const update = async (id, menu) => {
	return await Menu.update(
		{
			food_id: menu.food_id,
			description: menu.description,
		},
		{
			where: {
				restaurant_id: id,
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

const selectByRestaurantId = async (restaurant_id) => {
	return await Menu.findAll({
		where: {
			restaurant_id,
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
