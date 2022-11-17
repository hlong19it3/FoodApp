const express = require("express");
const router = express.Router();

// import sub route
const defaultRoute = require("./default");
const restaurantRoute = require("./restaurant");
const addressRoute = require("./address");

router.use("/restaurant", restaurantRoute);
router.use("/address", addressRoute);
router.use("/", defaultRoute);

module.exports = router;
