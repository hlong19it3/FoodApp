const express = require("express");
const router = express.Router();

// import sub route
const defaultRoute = require("./default");

router.use("/", defaultRoute);

module.exports = router;
