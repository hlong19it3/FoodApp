const restaurantDao = require('../../database/dao/RestaurantDao')
const { isEmpty, isNotEmpty } = require('../../utils/checkUtils')

//

const create = async (req, res) => {
	const user = req.user
	const { name, address } = req.body
	const [restaurant, created] = await restaurantDao.insert({
		name: name,
		user_id: user.id,
		address: address,
	})
	res.status(200).json({
		created: created,
		restaurant: restaurant,
	})
}

const update = async (req, res) => {
	const restaurant = req.body.restaurant
	restaurantDao.update(restaurant).then(
		(value) => {
			if (value != 0) {
				res.status(200).json({
					message: 'Update success!',
				})
			} else {
				res.status(200).json({
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
}

const selectById = async (req, res) => {
	const id = req.params.id
	if (id) {
		const restaurant = await restaurantDao.selectById(id)
		if (isNotEmpty(restaurant)) {
			res.status(200).json({
				code: 1,
				message: 'Result',
				restaurant,
			})
		} else {
			res.status(200).json({
				code: 0,
				message: 'Does not exist',
				restaurant,
			})
		}
	}
}

const selectUserId = async (req, res) => {
	const id = req.params.id
	const restaurant = await restaurantDao.selectUserId(id)
	if (isNotEmpty(restaurant)) {
		res.status(200).json({
			code: 1,
			message: 'Result',
			restaurant,
		})
	} else {
		res.status(200).json({
			code: 0,
			message: 'Does not exist',
			restaurant,
		})
	}
}

const deleteRestaurant = async (req, res) => {
	const user_id = req.user.id
	restaurantDao.deleteRestaurant(user_id).then(
		(count) => {
			if (count > 0) {
				res.status(200).json({
					code: 1,
					message: 'Delete success!',
				})
			} else {
				res.status(200).json({
					code: 0,
					message: 'Your store could not be found!',
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

const search = (req, res) => {
	restaurantDao.search(req.params.keyword).then(
		(value) => {
			console.log(value)
			res.status(200).json({ value })
		},
		(err) => {
			console.log(err)
			res.status(500).json({
				message: 'Internal server error',
			})
		}
	)
}

module.exports = { create, update, selectById, selectUserId, deleteRestaurant, search }
