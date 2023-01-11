const { User } = require('../models')
const md5 = require('md5')
const { Op } = require('sequelize')

async function insert(user) {
	console.log(user)
	return await User.findOrCreate({
		where: {
			[Op.or]: [{ email: user.email }, { phone: user.phone }],
		},
		defaults: {
			role: 1,
			firstName: user.firstName,
			lastName: user.lastName,
			mainAddress: user.address || '',
			birthday: user.birthday,
			gender: user.gender,
			email: user.email,
			password: md5(user.password),
		},
	})
}
async function findAll() {
	await User.findAll()
}

async function updateStatus(user) {
	return await User.update(
		{
			status: user.status,
		},
		{
			where: {
				id: user.id,
			},
		}
	)
}

// async function updateProfile() {
//   // const {
//   //   firstName,
//   //   lastName,
//   //   mainAddress,
//   //   birthday,
//   //   gender,
//   //   email,
//   //   phone,
//   //   password,
//   // } = req.body;
//   await User.update(
//     {
//       firstName: firstName,
//       lastName: lastName,
//       mainAddress: mainAddress,
//       birthday: birthday,
//       gender: gender,
//       email: email,
//       phone: phone,
//       password: password,
//     },
//     {
//       where: {
//         id: req.user.id,
//       },
//     }
//   );
// }

module.exports = { insert, findAll, updateStatus }
