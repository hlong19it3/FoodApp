const restaurantDao = require('../../database/dao/RestaurantDao')

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
		console.log(id)
	}
}

const selectUserId = async (req, res) => {
	const id = req.params.id
	if (typeof id === 'number' && Math.floor(id) === id) {
	}
}

module.exports = { create, update, selectById, selectUserId }
