const foodDao = require('../../database/dao/FoodDao')
const restaurantDao = require('../../database/dao/RestaurantDao')
const { isEmpty, isNotEmpty } = require('../../utils/checkUtils')
const { statusCode } = require('../../common/constants')
const format = require('dateformat')

const create = async (req, res) => {
	const { name, price, details, quantity, category_id, start_sell, end_sell } = req.body
	console.log(req.file)
	// const date = Date.parse('1/1/2000 ' + food.start_sell)
	// console.log(format(date, 'HH:mm:ss'))
	if (name && price) {
		await restaurantDao.selectUserId(req.user.id).then(
			async (restaurant) => {
				if (isNotEmpty(restaurant)) {
					var image = ''
					if (req.file) {
						image = './img/foods/' + req.file.filename
						console.log(image)
					}

					await foodDao
						.insert({
							name: name,
							restaurant_id: restaurant.id,
							price: price,
							details: details,
							quantity: quantity,
							category_id: category_id,
							start_sell: start_sell,
							end_sell: end_sell,
							image: image,
						})
						.then(
							(value) => {
								const [newFood, created] = value
								res.status(statusCode.OK).json({
									food: newFood,
									created,
								})
							},
							(err) => {
								console.log(err)
								res.status(statusCode.SERVER_ERROR).json({
									message: 'Internal server error',
								})
							}
						)
				} else {
					res.status(statusCode.BAD_REQUEST).json({
						message: 'Bad Request2',
					})
				}
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
	} else {
		res.status(statusCode.BAD_REQUEST).json({
			message: 'Bad Request1',
		})
	}
}

const update = async (req, res) => {
	const { id, name, price, details, quantity, category_id, start_sell, end_sell } = req.body
	if (name && price) {
		await restaurantDao.selectUserId(req.user.id).then(
			async (restaurant) => {
				if (isNotEmpty(restaurant)) {
					var image = ''
					if (req.file) {
						image = './img/foods/' + req.file.filename
						console.log(image)
					}

					await foodDao
						.update({
							id: id,
							name: name,
							restaurant_id: restaurant.id,
							price: price,
							details: details,
							quantity: quantity,
							category_id: category_id,
							start_sell: start_sell,
							end_sell: end_sell,
							image: image,
						})
						.then(
							(value) => {
								if (value > 0) {
									res.status(statusCode.OK).json({
										message: 'Update success!',
									})
								} else {
									res.status(statusCode.BAD_REQUEST).json({
										message: 'Update failed!',
									})
								}
							},
							(err) => {
								console.log(err)
								res.status(statusCode.SERVER_ERROR).json({
									message: 'Internal server error',
								})
							}
						)
				} else {
					res.status(statusCode.BAD_REQUEST).json({
						message: 'Bad Request2',
					})
				}
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
	} else {
		res.status(statusCode.BAD_REQUEST).json({
			message: 'Bad Request1',
		})
	}
}

const selectById = async (req, res) => {
	const id = req.query.id
	if (id) {
		await foodDao.selectById(id).then(
			(value) => {
				res.status(statusCode.OK).json({
					food: value,
				})
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
	} else {
		res.status(statusCode.BAD_REQUEST).json({
			message: 'Bad Request',
		})
	}
}

const selectByRestaurantId = async (req, res) => {
	const id = req.query.id
	if (id) {
		await foodDao.selectByRestaurantId(id).then(
			(value) => {
				res.status(statusCode.OK).json({
					value,
				})
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
	} else {
		res.status(statusCode.BAD_REQUEST).json({
			message: 'Bad Request',
		})
	}
}

const deleteFood = async (req, res) => {
	const id = req.query.id
	if (id) {
		await foodDao.deleteFood(id).then(
			(count) => {
				if (count > 0) {
					res.status(statusCode.OK).json({
						message: 'Delete success',
					})
				} else {
					res.status(statusCode.BAD_REQUEST).json({
						message: 'Bad Request',
					})
				}
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
	} else {
		res.status(statusCode.BAD_REQUEST).json({
			message: 'Bad Request',
		})
	}
}

const search = async (req, res) => {
	const keyword = req.query.keyword
	if (keyword) {
		foodDao.search(keyword).then(
			(value) => {
				res.status(statusCode.OK).json({
					value,
				})
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
	} else {
		res.status(statusCode.BAD_REQUEST).json({
			message: 'Bad Request',
		})
	}
}

// TODO
/*
bestseller
new dish
near you
*/

module.exports = { create, update, selectById, selectByRestaurantId, deleteFood, search }
