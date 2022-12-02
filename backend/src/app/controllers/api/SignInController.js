const { sequelize, User } = require('../../database/models')
const { sign } = require('jsonwebtoken')
const md5 = require('md5')
require('dotenv').config()
const { statusCode } = require('../../common/constants')

//Generate accessToken and refreshToken
const generateToken = (payload) => {
	const {
		id,
		role,
		firstName,
		lastName,
		mainAddress,
		birthday,
		gender,
		email,
		phone,
		status,
		avatar,
	} = payload
	const accessToken = sign(
		{
			id,
			role,
			firstName,
			lastName,
			mainAddress,
			birthday,
			gender,
			email,
			phone,
			status,
			avatar,
		},
		process.env.JWT_SECRET,
		{
			expiresIn: '24h',
		}
	)
	const refreshToken = sign({ email }, process.env.JWT_REFRESH_SECRET, {
		expiresIn: '2 days',
	})
	return { accessToken, refreshToken }
}

//Update and Save refreshToken to database
const updateRefreshToken = async (email, refreshToken) => {
	const userCollection = await User.findAll({
		where: {
			email: `${email}`,
		},
	})
	// console.log(userCollection);
	if (userCollection && userCollection.length > 0) {
		User.update(
			{ refresh_token: refreshToken },
			{
				where: {
					email: email,
				},
			}
		)
	}
	return userCollection
}

//Login
const login = async (req, res) => {
	const { email, password } = req.body
	// const encryptedPassword = md5(password);
	//check data
	if (email && password) {
		const userCollection = await User.findOne({
			where: {
				email: email,
				password: md5(password),
			},
		})
		//login
		if (userCollection) {
			// userCollection.password = undefined;

			const tokens = generateToken(userCollection)
			updateRefreshToken(userCollection.email, tokens.refreshToken)
			// console.log(tokens.accessToken);
			return res.status(200).json({
				msg: 'Login successfully',
				tokens,
			})
		}
		res.status(400).json({ msg: 'Login failed!' })
	} else {
		res.status(statusCode.BAD_REQUEST).json({
			msg: 'Bad request',
		})
	}
}
const showUsers = async (req, res) => {
	const userCollection = await User.findAll({})
	res.json(userCollection)
}

module.exports = { updateRefreshToken, generateToken, login, showUsers }
