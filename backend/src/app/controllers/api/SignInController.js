const { sequelize, User } = require("../../database/models");
const { sign } = require("jsonwebtoken");
const md5 = require("md5");

//Generate accessToken and refreshToken
const generateToken = (payload) => {
  const {
    role,
    first_name,
    last_name,
    main_address,
    birthday,
    gender,
    email,
    phone,
    status,
    avatar,
  } = payload;
  const accessToken = sign(
    {
      role,
      first_name,
      last_name,
      main_address,
      birthday,
      gender,
      email,
      phone,
      status,
      avatar,
    },
    "shhhh",
    {
      expiresIn: "24h",
    }
  );
  const refreshToken = sign({ email }, "refresh", {
    expiresIn: "2 days",
  });
  return { accessToken, refreshToken };
};

//Update and Save refreshToken to database
const updateRefreshToken = async (email, refreshToken) => {
  const userCollection = await User.findAll({
    where: {
      email: `${email}`,
    },
  });
  // console.log(userCollection);
  if (userCollection && userCollection.length > 0) {
    User.update(
      { refresh_token: refreshToken },
      {
        where: {
          email: email,
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
  const userCollection = await User.findOne({
    where: {
      email: `${email}`,
      password: `${encryptedPassword}`,
    },
  });
  //login
  if (userCollection) {
    // userCollection.password = undefined;

    const tokens = generateToken(userCollection);
    updateRefreshToken(userCollection.email, tokens.refreshToken);
    // console.log(tokens.accessToken);
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
