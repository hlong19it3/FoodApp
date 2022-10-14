const { sequelize, User } = require("../../database/models");
const { sign } = require("jsonwebtoken");

class LoginController {
  async login(req, res) {
    const { email, password } = req.body;

    //check data
    const userCollection = await User.findAll({
      where: {
        email: `${email}`,
        password: `${password}`,
      },
    });
    //login
    if (userCollection && userCollection.length > 0) {
      userCollection.password = undefined;
      const accessToken = sign({ userCollection: userCollection }, "shhhh", {
        expiresIn: "2 days",
      });
      return res
        .status(200)
        .json({ msg: "Login successfully", token: accessToken });
    }
    res.status(400).json({ msg: "Login failed!" });
  }
  async showUsers(req, res) {
    const userCollection = await User.findAll({});
    res.json(userCollection);
  }
}

module.exports = new LoginController();
