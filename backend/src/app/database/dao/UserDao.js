const connection = require("../AppDatabase");
const [User] = require("../models");

async function insert(user) {
  await User.create(user);
}
async function findAll() {
  await User.findAll();
}

module.exports = { insert, findAll };
