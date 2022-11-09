const { where } = require("sequelize");
const connection = require("../AppDatabase");
const { User } = require("../models");

async function insert(user) {
  await User.create(user);
}
async function findAll() {
  await User.findAll();
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

module.exports = { insert, findAll };
