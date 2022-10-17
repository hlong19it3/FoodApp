const { sequelize, User } = require("../../database/models");
const { sign } = require("jsonwebtoken");
const md5 = require("md5");

//Generate accessToken and refreshToken
const generateToken = (payload) => {
  const { email, password } = payload;
  const accessToken = sign({ email, password }, "shhhh", {
    expiresIn: "24h",
  });
  const refreshToken = sign({ email, password }, "refresh", {
    expiresIn: "2 days",
  });
  return { accessToken, refreshToken };
};

//Update refreshToken
const updateRefreshToken = async (email, encryptedPassword, refreshToken) => {
  const userCollection = await User.findAll({
    where: {
      email: `${email}`,
      password: `${encryptedPassword}`,
    },
  });
  // console.log(userCollection);
  if (userCollection && userCollection.length > 0) {
    User.update(
      { refresh_token: refreshToken },
      {
        where: {
          email: email,
          password: encryptedPassword,
        },
      }
    );
  }
  return userCollection;
};

//Login
const login = async (req, res) => {
  const { email, password } = req.body;
  const encryptedPassword = md5(password);
  //check data
  const userCollection = await User.findAll({
    where: {
      email: `${email}`,
      password: `${encryptedPassword}`,
    },
  });
  //login
  if (userCollection && userCollection.length > 0) {
    // userCollection.password = undefined;

    const tokens = generateToken(userCollection);
    updateRefreshToken(email, encryptedPassword, tokens.refreshToken);
    return res.status(200).json({
      msg: "Login successfully",
      tokens,
    });
  }
  res.status(400).json({ msg: "Login failed!" });
};
const showUsers = async (req, res) => {
  const userCollection = await User.findAll({});
  res.json(userCollection);
};

module.exports = { updateRefreshToken, generateToken, login, showUsers };
