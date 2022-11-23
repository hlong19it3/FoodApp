const express = require('express')
const router = express.Router()

const { checkToken } = require('../../auth/token_validation')
const categoryController = require('../../app/controllers/api/CategoryController')
const { isAdmin } = require('../../app/middleware/role')

router.post('/create', checkToken, isAdmin, categoryController.create)
router.post('/update', checkToken, isAdmin, categoryController.update)
router.get('/delete', checkToken, isAdmin, categoryController.deleteCategory)
router.get('/select-by_id', categoryController.selectById)
router.get('/select-all', categoryController.selectAll)

module.exports = router
