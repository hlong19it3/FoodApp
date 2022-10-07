
class ExampleController {
    // functions

    index(req, res) {
        const addressDao = require('../../../app/database/dao/AddressDao')
        const exJson = {
            customer_id: 2,
            address: "Ha Tinh"
        }
        addressDao.create(exJson)
        res.send(exJson);
    }
}

module.exports = new ExampleController;