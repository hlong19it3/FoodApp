const { sequelize, User } = require("../../database/models");
const md5 = require("md5");

const signUp = async (req, res) => {
  const {
    email,
    role,
    firstName,
    lastName,
    address,
    birthday,
    gender,
    phone,
    password,
    status,
    lastAction,
    lat,
    lg,
    avatar,
    refreshToken,
  } = req.body;

  const userCollection = await User.findOne({ where: { email: `${email}` } });

  if (userCollection !== null) {
    return res.status(400).json({ msg: "This email has been used!" });
  }
  const encryptedPassword = md5(password);
  console.log(encryptedPassword);
  User.create({
    role: `${role}`,
    first_name: `${firstName}`,
    last_name: `${lastName}`,
    main_address: `${address}`,
    birthday: `${birthday}`,
    gender: `${gender}`,
    email: `${email}`,
    phone: `${phone}`,
    password: `${encryptedPassword}`,
    status: `${status}`,
    last_action: `${lastAction}`,
    lat: `${lat}`,
    lg: `${lg}`,
    avatar: `${avatar}`,
  });
  res.status(200).json({ msg: "Your account has been created successfully!" });
};

module.exports = { signUp };
