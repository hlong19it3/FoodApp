const express = require('express');
const router = express.Router();

// import controller
const controller = require('../../app/controllers/web/ExampleController')

router.get('/', controller.index)

module.exports = router