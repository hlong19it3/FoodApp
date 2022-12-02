const { statusCode } = require('../../common/constants')
const { User } = require('../../database/models')
const { checkToken } = require('../../../auth/token_validation')
// const { updateProfile } = require("./../../database/dao/UserDao");

const myProfile = async (req, res) => {
	const currentUserId = req.user.id
	const user = await User.findAll({
		attributes: [
			'firstName',
			'lastName',
			'mainAddress',
			'birthday',
			'gender',
			'email',
			'phone',
			'lat',
			'lg',
			'avatar',
		],
		where: {
			id: currentUserId,
		},
	})
	if (user.length > 0) {
		return res.status(200).json(user)
	} else {
		res.status(400).json({ msg: 'Error' })
	}
}

const currentUser = async (req, res) => {
	const currentUserId = req.user.id
	const user = await User.findAll({
		attributes: [
			'lastName',
			'email',
			'avatar',
		],
		where: {
			id: currentUserId,
		},
	})
	if (user.length > 0) {
		return res.status(200).json(user[0])
	} else {
		res.status(400).json({ msg: 'Error' })
	}
}
const updateProfile = async (req, res) => {
	const currentUserId = req.user.id
	const { firstName, lastName, mainAddress, birthday, gender, email, phone, password } = req.body
	try {
		if (firstName && lastName && mainAddress && birthday && gender && email && phone) {
			await User.update(
				{
					firstName: firstName,
					lastName: lastName,
					mainAddress: mainAddress,
					birthday: birthday,
					gender: gender,
					email: email,
					phone: phone,
					password: password,
				},
				{
					where: {
						id: currentUserId,
					},
				}
			)
			res.status(200).json({ msg: 'User has been updated successfully!' })
		} else {
			res.status(statusCode.BAD_REQUEST).json({
				msg: 'Bad request',
			})
		}
	} catch (error) {
		res.status(500).json({ msg: 'Server error' })
	}
}

module.exports = { myProfile, updateProfile, currentUser }
