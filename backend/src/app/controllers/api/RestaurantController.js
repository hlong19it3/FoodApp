const restaurantDao = require('../../database/dao/RestaurantDao')
const { isEmpty, isNotEmpty } = require('../../utils/checkUtils')
const { statusCode } = require('../../common/constants')

//

const create = async (req, res) => {
	const user = req.user
	const { name, address } = req.body
	if (name && address) {
		const [newrestaurant, created] = await restaurantDao.insert({
			name: name,
			userId: user.id,
			address: address,
		})
		res.status(statusCode.OK).json({
			created: created,
			restaurant: newrestaurant,
		})
	} else {
		res.status(statusCode.BAD_REQUEST).json({
			message: 'Bad Request',
		})
	}
}

const update = async (req, res) => {
	const { name, address } = req.body
	restaurantDao.update({ name, address }, req.user.id).then(
		(value) => {
			if (value != 0) {
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
}

const selectById = async (req, res) => {
	const id = req.query.id
	if (id) {
		await restaurantDao.selectById(id).then(
			(restaurant) => {
				if (isNotEmpty(restaurant)) {
					res.status(statusCode.OK).json({
						message: 'Result',
						restaurant,
					})
				} else {
					res.status(statusCode.BAD_REQUEST).json({
						message: 'Does not exist',
						restaurant,
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
	}
}

const selectUserId = async (req, res) => {
	const id = req.query.userId
	if (id) {
		await restaurantDao.selectUserId(id).then(
			(restaurant) => {
				if (restaurant && isNotEmpty(restaurant)) {
					res.status(statusCode.OK).json({
						message: 'Result',
						restaurant,
					})
				} else {
					res.status(statusCode.BAD_REQUEST).json({
						message: 'Does not exist',
						restaurant,
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
			code: 1,
			message: 'parameter userId is empty',
		})
	}
}

const deleteRestaurant = async (req, res) => {
	const userId = req.user.id
	restaurantDao.deleteRestaurant(userId).then(
		(count) => {
			if (count > 0) {
				res.status(statusCode.OK).json({
					message: 'Delete success!',
				})
			} else {
				res.status(statusCode.BAD_REQUEST).json({
					message: 'Your store could not be found!',
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

const search = async (req, res) => {
	console.log(req.query.keyword)
	restaurantDao.search(req.query.keyword).then(
		(value) => {
			res.status(statusCode.OK).json({ value })
		},
		(err) => {
			console.log(err)
			res.status(statusCode.SERVER_ERROR).json({
				message: 'Internal server error',
			})
		}
	)
}

module.exports = { create, update, selectById, selectUserId, deleteRestaurant, search }
