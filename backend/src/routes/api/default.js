const express = require("express");
const router = express.Router();

// import controller
const controller = require("../../app/controllers/api/ExampleController");
const signinController = require("../../app/controllers/api/SignInController");
const signUpController = require("../../app/controllers/api/SignUpController");
const getTokenController = require("../../app/controllers/api/GetTokenController");
const signOutController = require("../../app/controllers/api/SignOutController");
const profileController = require("../../app/controllers/api/ProfileController");
const { checkToken, isAdmin } = require("../../auth/token_validation");

router.post("/auth/login", signinController.login);
router.post("/auth/token", getTokenController.getToken);
router.post("/signup", signUpController.signUp);

router.get("/auth/profile", checkToken, profileController.myProfile);
router.put("/auth/update-profile", checkToken, profileController.updateProfile);

router.post("/auth/signout", checkToken, signOutController.signOut);
// test middleware for role Admin and User
router.get("/auth/users", checkToken, isAdmin, signinController.showUsers);

router.get("/", controller.index);
router.get("/init", controller.initDatabase);

module.exports = router;
