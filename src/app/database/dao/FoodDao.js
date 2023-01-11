const { Food, Category, Restaurant } = require('../models')
const { Op } = require('sequelize')

async function getAll() {
	return await Food.findAll({ include: [Category, Restaurant] })
}

async function insert(food) {
	return await Food.findOrCreate({
		where: {
			restaurantId: food.restaurantId,
			name: food.name,
		},
		defaults: {
			price: food.price,
			details: food.details,
			image: food.image,
			quatity: food.quatity,
			sold: food.sold,
			startSell: food.startSell,
			endSell: food.endSell,
			categoryId: food.categoryId,
			totalRating: 0,
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
			startSell: food.startSell,
			endSell: food.endSell,
			categoryId: food.categoryId,
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
		include: [Category, Restaurant],
	})
}

async function selectByRestaurantId(restaurantId) {
	return await Food.findAll({
		where: {
			restaurantId: restaurantId,
		},
		include: [Category, Restaurant],
	})
}
async function selectByCategoryId(categoryId) {
	return await Food.findAll({
		where: {
			categoryId: categoryId,
		},
		include: [Category, Restaurant],
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
		include: [Category, Restaurant],
	})
}

async function selectByListId(foodIds) {
	console.log(foodIds)
	return await Food.findAll({
		where: {
			id: JSON.parse(foodIds),
		},
	})
}

module.exports = {
	getAll,
	insert,
	update,
	selectById,
	selectByRestaurantId,
	selectByCategoryId,
	deleteFood,
	search,
	selectByListId,
}
