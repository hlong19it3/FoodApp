const { verify } = require("jsonwebtoken");
const { sequelize, User } = require("./../app/database/models");
require("dotenv").config();

const checkToken = async (req, res, next) => {
  console.log(req.body);
  const inputToken = req.headers["x-accesstoken"];
  try {
    const dataObj = verify(inputToken, process.env.JWT_SECRET);
    // find user in db
    const currentUser = await User.findOne({
      where: {
        id: dataObj.id,
      },
    });
    if (currentUser) {
      // save role of user
      req.user = currentUser;
      next();
      return;
    }
    // if user not exist
    return res.status(403).json({ msg: "Forbidden!" });
  } catch (error) {
    return res.status(401).json({ msg: "Token is not valid" });
  }

  // let authHeader = req.get("authorization");
  // if (authHeader) {
  //   const token = authHeader.split(" ")[1];
  //   verify(token, "shhhh", (err, decoded) => {
  //     if (err) {
  //       res.status(400).json({ msg: "Invalid token" });
  //     } else {
  //       next();
  //     }
  //   });
  // } else {
  //   res.status(400).json({ msg: "Access denied! Unauthorized user" });
  // }
};

const isAdmin = (req, res, next) => {
  const role = req.role;
  if (role == 1) {
    next();
    return;
  }
  return res.status(403).json({ msg: "This action required Admin role" });
};
module.exports = { checkToken, isAdmin };
