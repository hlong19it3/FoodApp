const connection = require('../AppDatabase')
const { Restaurant } = require('../models')

function insert(restaurant) {
	return Restaurant.findOrCreate({
		where: { user_id: restaurant.user_id },
		defaults: {
			name: restaurant.name,
			address: restaurant.address,
		},
	})
}

async function update(restaurant) {
	return await Restaurant.update(
		{
			name: restaurant.name,
			address: restaurant.address,
		},
		{
			where: {
				id: restaurant.id,
			},
		}
	)
}

module.exports = { insert, update }
