const menuDao = require('../../database/dao/MenuDao')
const restaurantDao = require('../../database/dao/RestaurantDao')
const { isEmpty, isNotEmpty } = require('../../utils/checkUtils')
const { statusCode } = require('../../common/constants')

const create = async (req, res) => {
	const user = req.user
	const restaurant = await restaurantDao.selectUserId(user.id)
	if (isEmpty(restaurant)) {
		res.status(statusCode.BAD_REQUEST).json({
			message: 'Restaurant registration is required before performing this function',
		})
	} else {
		const description = req.body.description
		const [menu, created] = await menuDao.insert({
			restaurantId: restaurant.id,
			description: description,
		})
		res.status(statusCode.OK).json({
			created: created,
			menu,
		})
	}
}

const update = async (req, res) => {
	const menu = req.body.menu
	restaurantDao.selectUserId(req.user.id).then(
		(value) => {
			if (isNotEmpty(value)) {
				console.log(value.id)
				menuDao.update(value.id, menu).then(
					(count) => {
						if (count != 0) {
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
					message: 'Restaurant registration is required before performing this function',
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
}

const selectById = async (req, res) => {
	const id = req.query.id
	if (id) {
		await menuDao.selectById(id).then(
			(menu) => {
				res.status(statusCode.OK).json({
					menu,
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
			message: 'parameter id is empty',
		})
	}
}

const selectByRestaurantId = async (req, res) => {
	const restaurantId = req.query.restaurantId
	if (restaurantId) {
		menuDao.selectByRestaurantId(restaurantId).then(
			(menu) => {
				res.status(statusCode.OK).json({
					menu,
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
			message: 'parameter restaurantId is empty',
		})
	}
}

const deleteMenu = async (req, res) => {
	const id = req.query.id
	if (id) {
		const user = req.user
		restaurantDao.selectUserId(user.id).then(
			(value) => {
				if (isNotEmpty(value)) {
					console.log(value.id)
					menuDao.deleteMenu(id).then(
						(count) => {
							if (count != 0) {
								res.status(statusCode.OK).json({
									message: 'Delete success!',
								})
							} else {
								res.status(statusCode.BAD_REQUEST).json({
									message: 'Delete failed!',
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
						message: 'Restaurant registration is required before performing this function',
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
			message: 'parameter id is empty',
		})
		return
	}
}

module.exports = { create, update, selectById, selectByRestaurantId, deleteMenu }
