const { verify } = require("jsonwebtoken");
const { User } = require("../../database/models");
const connection = require("./../../database/AppDatabase");
const { checkToken } = require("../../../auth/token_validation");
// const { updateProfile } = require("./../../database/dao/UserDao");

const myProfile = async (req, res) => {
  const currentUserId = req.user.id;
  const user = await User.findAll({
    attributes: [
      "first_name",
      "last_name",
      "main_address",
      "birthday",
      "gender",
      "email",
      "phone",
      "lat",
      "lg",
      "avatar",
    ],
    where: {
      id: currentUserId,
    },
  });
  if (user.length > 0) {
    return res.status(200).json(user);
  } else {
    res.status(400).json({ msg: "Error" });
  }
};

const updateProfile = async (req, res) => {
  const currentUserId = req.user.id;
  const {
    firstName,
    lastName,
    mainAddress,
    birthday,
    gender,
    email,
    phone,
    password,
  } = req.body;
  try {
    await User.update(
      {
        first_name: firstName,
        last_name: lastName,
        main_address: mainAddress,
        birthday: birthday,
        gender: gender,
        email: email,
        phone: phone,
        password: password,
      },
      {
        where: {
          id: currentUserId,
        },
      }
    );
    res.status(200).json({ msg: "User has been updated successfully!" });
  } catch (error) {
    res.status(500).json({ msg: "Server error" });
  }
};

module.exports = { myProfile, updateProfile };
