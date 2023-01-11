const foodDao = require('../../database/dao/FoodDao')
const restaurantDao = require('../../database/dao/RestaurantDao')
const { isEmpty, isNotEmpty } = require('../../utils/checkUtils')
const { statusCode } = require('../../common/constants')
const format = require('dateformat')
const file = require('../../utils/fileUtils')

const getAll = async (req, res) => {
	await foodDao.getAll().then(
		(value) => {
			res.status(statusCode.OK).json(value)
		},
		(err) => {
			console.log(err)
			res.status(statusCode.SERVER_ERROR).json({
				message: 'Internal server error',
			})
		}
	)
}

const create = async (req, res) => {
	const { name, price, details, quantity, categoryId, startSell, endSell } = req.body
	console.log(req.file)
	var image = req.image

	// const date = Date.parse('1/1/2000 ' + food.startSell)
	// console.log(format(date, 'HH:mm:ss'))
	if (name && price && categoryId) {
		await restaurantDao.selectUserId(req.user.id).then(
			async (restaurant) => {
				if (isNotEmpty(restaurant)) {
					await foodDao
						.insert({
							name: name,
							restaurantId: restaurant.id,
							price: price,
							details: details,
							quantity: quantity,
							categoryId: categoryId,
							startSell: startSell,
							endSell: endSell,
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
	const { id, name, price, details, quantity, categoryId, startSell, endSell } = req.body
	if (name && price) {
		await restaurantDao.selectUserId(req.user.id).then(
			async (restaurant) => {
				if (isNotEmpty(restaurant)) {
					var image = req.image

					await foodDao
						.update({
							id: id,
							name: name,
							restaurantId: restaurant.id,
							price: price,
							details: details,
							quantity: quantity,
							categoryId: categoryId,
							startSell: startSell,
							endSell: endSell,
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
				res.status(statusCode.OK).json(value)
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
const selectByCategoryId = async (req, res) => {
	const id = req.query.id
	if (id) {
		await foodDao.selectByCategoryId(id).then(
			(value) => {
				res.status(statusCode.OK).json(value)
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
		const food = foodDao.selectById(id)
		await foodDao.deleteFood(id).then(
			(count) => {
				if (count > 0) {
					food.then((value) => {
						file.deleteFile(value.image)
					})
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

const select = async (req, res) => {
	const user = req.body
	const { id, name, categoryId, restaurantId, foodIds } = req.query

	if (foodIds) {
		foodDao.selectByListId(foodIds).then(
			(listFood) => {
				res.status(statusCode.OK).json(listFood)
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
		return
	}

	if (id) {
		foodDao.selectById(id).then(
			(food) => {
				res.status(statusCode.OK).json([food])
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
		return
	}
	if (name) {
		foodDao.search(name).then(
			(foods) => {
				console.log(foods)
				res.status(statusCode.OK).json(foods)
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
		return
	}
	if (categoryId) {
		foodDao.selectByCategoryId(categoryId).then(
			(foods) => {
				res.status(statusCode.OK).json(foods)
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
		return
	}
	if (restaurantId) {
		foodDao.selectByRestaurantId(restaurantId).then(
			(foods) => {
				res.status(statusCode.OK).json(foods)
			},
			(err) => {
				console.log(err)
				res.status(statusCode.SERVER_ERROR).json({
					message: 'Internal server error',
				})
			}
		)
		return
	}
	foodDao.getAll().then(
		(foods) => {
			res.status(statusCode.OK).json(foods)
		},
		(err) => {
			console.log(err)
			res.status(statusCode.SERVER_ERROR).json({
				message: 'Internal server error',
			})
		}
	)
}

// TODO
/*
bestseller
new dish
near you
*/

module.exports = {
	create,
	update,
	selectById,
	selectByRestaurantId,
	selectByCategoryId,
	deleteFood,
	search,
	getAll,
	select,
}
