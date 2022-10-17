const { sequelize, User } = require("../../database/models");
const { verify } = require("jsonwebtoken");
const { generateToken, updateRefreshToken } = require("./LoginController");

const getToken = async (req, res) => {
  const refreshToken = req.body.refreshToken;
  const user = await User.findOne({
    where: {
      refresh_token: `${refreshToken}`,
    },
  });

  if (!refreshToken) return res.status(401);

  if (!user) return res.status(403);

  try {
    verify(refreshToken, "refresh");
    const tokens = generateToken(user);
    updateRefreshToken(user.email, user.password, tokens.refreshToken);
    res.json(tokens);
  } catch (error) {
    console.log(error);
    res.status(403);
  }
};
module.exports = { getToken };
