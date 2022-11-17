const menuDao = require('../../database/dao/MenuDao')
const restaurantDao = require('../../database/dao/RestaurantDao')
const { isEmpty, isNotEmpty } = require('../../utils/checkUtils')

const create = async (req, res) => {
	const user = req.user
	const restaurant = await restaurantDao.selectUserId(user.id)
	if (isEmpty(restaurant)) {
		res.status(200).json({
			code: 0,
			message: 'Restaurant registration is required before performing this function',
		})
	} else {
		const description = req.body.description
		const [menu, created] = await menuDao.insert({
			restaurant_id: restaurant.id,
			description: description,
		})
		res.status(200).json({
			code: 1,
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
							res.status(200).json({
								code: 1,
								message: 'Update success!',
							})
						} else {
							res.status(200).json({
								code: 0,
								message: 'Update failed!',
							})
						}
					},
					(err) => {
						console.log(err)
						res.status(500).json({
							message: 'Internal server error',
						})
					}
				)
			} else {
				res.status(200).json({
					code: 0,
					message: 'Restaurant registration is required before performing this function',
				})
			}
		},
		(err) => {
			console.log(err)
			res.status(500).json({
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
				res.status(200).json({
					code: 1,
					menu,
				})
			},
			(err) => {
				console.log(err)
				res.status(500).json({
					message: 'Internal server error',
				})
			}
		)
	} else {
		res.status(200).json({
			code: 1,
			message: 'parameter id is empty',
		})
	}
}

const selectByRestaurantId = async (req, res) => {
	const restaurant_id = req.query.restaurant_id
	if (restaurant_id) {
		menuDao.selectByRestaurantId(restaurant_id).then(
			(menu) => {
				res.status(200).json({
					code: 1,
					menu,
				})
			},
			(err) => {
				console.log(err)
				res.status(500).json({
					message: 'Internal server error',
				})
			}
		)
	} else {
		res.status(200).json({
			code: 1,
			message: 'parameter restaurant_id is empty',
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
								res.status(200).json({
									code: 1,
									message: 'Delete success!',
								})
							} else {
								res.status(200).json({
									code: 0,
									message: 'Delete failed!',
								})
							}
						},
						(err) => {
							console.log(err)
							res.status(500).json({
								message: 'Internal server error',
							})
						}
					)
				} else {
					res.status(200).json({
						code: 0,
						message:
							'Restaurant registration is required before performing this function',
					})
				}
			},
			(err) => {
				console.log(err)
				res.status(500).json({
					message: 'Internal server error',
				})
			}
		)
	} else {
		res.status(200).json({
			code: 0,
			message: 'parameter id is empty',
		})
		return
	}
}

module.exports = { create, update, selectById, selectByRestaurantId, deleteMenu }
