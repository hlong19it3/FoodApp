const connection = require('../AppDatabase')
const { Category } = require('../models')

const insert = async (category) => {
	return await Category.findOrCreate({
		where: {
			name: category.name,
			image: category.image
		},
	})
}

const update = async (category) => {
	return await Category.update(
		{
			type: category.name,
		},
		{
			where: {
				id: category.id,
			},
		}
	)
}

const deleteCategory = async (id) => {
	return await Category.destroy({
		where: {
			id: id,
		},
	})
}

const selectById = async (id) => {
	return await Category.findAll({
		where: {
			id: id,
		},
	})
}

const selectAll = async () => {
	return await Category.findAll()
}

module.exports = { insert, update, deleteCategory, selectById, selectAll }
