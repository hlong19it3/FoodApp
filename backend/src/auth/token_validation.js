const { verify } = require("jsonwebtoken");

const checkToken = (req, res, next) => {
  let token = req.get("authorization");
  if (token) {
    token = token.slice(7);
    verify(token, "shhhh", (err, decoded) => {
      if (err) {
        res.json({ msg: "Invalid token" });
      } else {
        next();
      }
    });
  } else {
    res.json({ msg: "Access denied! Unauthorized user" });
  }
};
module.exports = checkToken;
