const { User } = require('../models')
const md5 = require('md5')
const { Op } = require('sequelize')

async function insert(user) {
	return await User.findOrCreate({
		where: {
			[Op.or]: [{ email: user.email }, { phone: user.phone }],
		},
		defaults: {
			role: 1,
			first_name: user.firstName,
			last_name: user.lastName,
			main_address: user.main_address || '',
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
//       first_name: firstName,
//       last_name: lastName,
//       main_address: mainAddress,
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

module.exports = { insert, findAll }
