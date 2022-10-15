const { verify } = require("jsonwebtoken");

const checkToken = (req, res, next) => {
  let authHeader = req.get("authorization");
  if (authHeader) {
    const token = authHeader.split(" ")[1];
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
