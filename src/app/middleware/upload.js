const multer = require('multer')

const storageFood = multer.diskStorage({
	destination: function (req, file, cb) {
		cb(null, './src/public/img/foods')
	},
	filename: function (req, file, cb) {
		const ext = file.originalname.split('.').slice(-1)[0]
		cb(null, 'food_' + Date.now() + '.' + ext)
	},
})

const storageCategory = multer.diskStorage({
	destination: function (req, file, cb) {
		cb(null, './src/public/img/categogy')
	},
	filename: function (req, file, cb) {
		const ext = file.originalname.split('.').slice(-1)[0]
		cb(null, 'categogy_' + Date.now() + '.' + ext)
	},
})

const uploadFood = multer({ storage: storageFood })
const uploadCategory = multer({ storage: storageCategory })
module.exports = { uploadFood, uploadCategory }
