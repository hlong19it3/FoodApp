const express = require("express");
const router = express.Router();

// import sub route
const defaultRoute = require("./default");
const restaurantRoute = require("./restaurant")

router.use("/restaurant", restaurantRoute)
router.use("/", defaultRoute);

module.exports = router;
