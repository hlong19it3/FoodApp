const express = require("express");
const router = express.Router();

// import controller
const controller = require("../../app/controllers/api/ExampleController");
const signinController = require("../../app/controllers/api/SignInController");
const signUpController = require("../../app/controllers/api/SignUpController");
const signOutController = require("../../app/controllers/api/SignOutController");
const getTokenController = require("../../app/controllers/api/GetTokenController");
const checkToken = require("../../auth/token_validation");

router.get("/auth/users", checkToken, signinController.showUsers);
router.post("/auth/login", signinController.login);
router.post("/auth/token", getTokenController.getToken);
router.post("/signup", signUpController.signUp);
router.post("/auth/signout", checkToken, signOutController.signOut);

router.get("/", controller.index);
router.get("/init", controller.initDatabase);

module.exports = router;
