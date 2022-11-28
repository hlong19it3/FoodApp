const categoryDao = require('../../database/dao/CategoryDao')
const { isEmpty, isNotEmpty } = require('../../utils/checkUtils')
const { statusCode } = require('../../common/constants')
const e = require('express')

const create = async (req, res) => {
	const type = req.body.type
	if (type) {
		await categoryDao.insert(type).then(
			(value) => {
				const [category, created] = value
				res.status(statusCode.OK).json({ category, created })
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

const update = async (req, res) => {
	const { id, type } = req.body
	if (id && type) {
		await categoryDao
			.update({
				id,
				type,
			})
			.then(
				(count) => {
					res.status(statusCode.OK).json({
						count,
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

const deleteCategory = async (req, res) => {
	const id = req.query.id
	if (id) {
		await categoryDao.deleteCategory(id).then(
			(count) => {
				res.status(statusCode.OK).json({
					count,
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

const selectById = async (req, res) => {
	const id = req.query.id
	if (id) {
		await categoryDao.selectById(id).then(
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

const selectAll = async (req, res) => {
	await categoryDao.selectAll().then(
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
}

module.exports = { create, update, deleteCategory, selectById, selectAll }
