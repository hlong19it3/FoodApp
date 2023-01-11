const fs = require('fs')

const deleteFile = (path) => {
	const link = '../../public' + path
	console.log(link)
	if (fs.existsSync(link)) fs.unlink(link)
}

module.exports = { deleteFile }
