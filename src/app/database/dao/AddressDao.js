const connection = require('../AppDatabase')
const { Address } = require('../models')
const { Op } = require('sequelize')

function insert(address) {
	return Address.findOrCreate({
		where: {
			userId: address.userId,
		},
		defaults: {
			address: address.address,
		},
	})
}

async function update(address) {
	return await Address.update(
		{
			address: address.address,
		},
		{
			where: {
				id: address.id,
			},
		}
	)
}

async function search(keyword) {
	return await Address.findAll({
		where: {
			address: {
				[Op.substring]: keyword,
			},
		},
	})
}

function selectById(id) {
	return Address.findAll({
		where: {
			id: id,
		},
	})
}

async function deleteAddress(userId) {
	return await Address.destroy({
		where: {
			userId: userId,
		},
	})
}

function selectUserId(userId) {
	return Address.findAll({
		where: {
			userId: userId,
		},
	})
}

function create(address) {
	return Address.create(address)
}

module.exports = {
	insert,
	create,
	deleteAddress,
	update,
	search,
	selectById,
	selectUserId,
}
