const { sequelize, User } = require('../../database/models')
const userDao = require('../../database/dao/UserDao')
const { statusCode } = require('../../common/constants')

const signUp = async (req, res) => {
	const { email, role, firstName, lastName, address, birthday, gender, phone, password } = req.body
	if (firstName && lastName && gender && email && password && phone) {
		await userDao
			.insert({
				firstName,
				lastName,
				gender,
				email,
				password,
				phone,
				address,
				birthday,
				role,
			})
			.then(
				(value) => {
					const [created] = value
					console.log(value)
					if (created) {
						res.status(statusCode.OK).json({ msg: 'Your account has been created successfully!' })
						return
					} else {
						res.status(statusCode.BAD_REQUEST).json({ msg: 'This email has been used!' })
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
		res.status(statusCode.BAD_REQUEST).json({ msg: 'This email has been used!' })
	}
}

module.exports = { signUp }
