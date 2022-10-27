const { sequelize, User } = require("../../database/models");
const { updateRefreshToken } = require("./SignInController");

const signOut = async (req, res) => {
  //delete cookies in front-end
};

module.exports = { signOut };
