const { sequelize, User } = require("../../database/models");
const { sign } = require("jsonwebtoken");

// const generateToken = (payload) => {
//   const accessToken = sign(payload, "shhhh", {
//     expiresIn: "20s",
//   });
//   const refreshToken = sign(payload, "refresh", {
//     expiresIn: "2 days",
//   });

//   return { accessToken, refreshToken };
// };

const updateRefreshToken = async (email, refreshToken) => {
  const userCollection = await User.findAll({
    where: {
      email: `${email}`,
      // password: `${password}`,
    },
  });
  console.log(userCollection);
  if (userCollection && userCollection.length > 0) {
    console.log("da vo");
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

      // const tokens = generateToken(userCollection);
      const accessToken = sign({ userCollection: userCollection }, "shhhh", {
        expiresIn: "20s",
      });
      const refreshToken = sign({ userCollection: userCollection }, "refresh", {
        expiresIn: "2 days",
      });
      updateRefreshToken(email, refreshToken);
      console.log("hmm");
      return res.status(200).json({
        msg: "Login successfully",
        accessToken: accessToken,
        refreshToken: refreshToken,
      });
    }
    res.status(400).json({ msg: "Login failed!" });
  }
  async showUsers(req, res) {
    const userCollection = await User.findAll({});
    res.json(userCollection);
  }
}

module.exports = new LoginController();
