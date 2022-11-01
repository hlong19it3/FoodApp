const { verify } = require("jsonwebtoken");
const { User } = require("../../database/models");
const { checkToken } = require("../../../auth/token_validation");

const myProfile = async (req, res) => {
  const inputToken = req.headers["x-accesstoken"];
  // verify token
  const dataObj = verify(inputToken, process.env.JWT_SECRET);
  const id = dataObj.id;
  // show info of current user by id
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
      id: id,
    },
  });
  if (user.length > 0) {
    return res.status(200).json(user);
  } else {
    res.status(400).json("Err");
  }
};

module.exports = { myProfile };
