class ExampleController {
	// functions

	initDatabase(req, res) {
		const { sequelize } = require('../../database/models')
		sequelize.sync({ force: true })
		console.log(Date.now().toString())
		res.send('done')
	}

	index(req, res) {
		const dao = require('../../../app/database/dao/VoucherDao')
		const exJson = {
			name: '10/10',
			type: 1,
			value: 10000,
		}
		// dao.insert(exJson)
		res.send(exJson)
	}
}

module.exports = new ExampleController()
