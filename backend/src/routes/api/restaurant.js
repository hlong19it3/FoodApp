const express = require("express");
const router = express.Router();

const { checkToken, isAdmin } = require("../../auth/token_validation");
const restaurantController = require("../../app/controllers/api/RestaurantController");

router.post("/create");

module.exports = router;
