const multer = require('multer')

const storage = multer.diskStorage({
	destination: function (req, file, cb) {
		cb(null, './src/public/img/foods')
	},
	filename: function (req, file, cb) {
		const ext = file.originalname.split('.').slice(-1)[0]
		cb(null, 'food_' + Date.now() + '.' + ext)
	},
})

const upload = multer({ storage: storage })
module.exports = { upload, storage }
