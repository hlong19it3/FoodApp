const { Food } = require('../models')
const { Op } = require('sequelize')

async function insert(food) {
	return await Food.findOrCreate({
		where: {
			restaurant_id: food.restaurant_id,
			name: food.name,
		},
		defaults: {
			price: food.price,
			details: food.details,
			image: food.image,
			quatity: food.quatity,
			sold: food.sold,
			start_sell: food.start_sell,
			end_sell: food.end_sell,
			category_id: food.category_id,
		},
	})
}

async function update(food) {
	return await Food.update(
		{
			name: food.name,
			price: food.price,
			details: food.details,
			image: food.image,
			quatity: food.quatity,
			sold: food.sold,
			start_sell: food.start_sell,
			end_sell: food.end_sell,
			category_id: food.category_id,
		},
		{
			where: {
				id: food.id,
			},
		}
	)
}

async function selectById(id) {
	return await Food.findOne({
		where: {
			id: id,
		},
	})
}

async function selectByRestaurantId(restaurantId) {
	return await Food.findAll({
		where: {
			restaurant_id: restaurantId,
		},
	})
}

async function deleteFood(id) {
	return await Food.destroy({
		where: {
			id: id,
		},
	})
}

async function search(keyword) {
	return await Food.findAll({
		where: {
			name: {
				[Op.substring]: keyword,
			},
		},
	})
}

module.exports = { insert, update, selectById, selectByRestaurantId, deleteFood, search }
