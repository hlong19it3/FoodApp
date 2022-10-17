const express = require("express");
const router = express.Router();

// import controller
const controller = require("../../app/controllers/api/ExampleController");
const loginController = require("../../app/controllers/api/LoginController");
const signUpController = require("../../app/controllers/api/SignUpController");
const getTokenController = require("../../app/controllers/api/GetTokenController");
const checkToken = require("../../auth/token_validation");

router.get("/auth/users", checkToken, loginController.showUsers);
router.post("/auth/login", loginController.login);
router.post("/auth/token", getTokenController.getToken);
router.post("/signup", signUpController.signUp);

router.get("/", controller.index);
router.get("/init", controller.initDatabase);

module.exports = router;
