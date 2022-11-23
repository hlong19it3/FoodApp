const addressDao = require("../../database/dao/AddressDao");
const { isEmpty, isNotEmpty } = require("../../utils/checkUtils");
const create = async (req, res) => {
  const user = req.user;
  const { newAddress } = req.body;

  try {
    const [address, created] = await addressDao.insert({
      user_id: user.id,
      address: newAddress,
    });
    res.status(200).json({
      code: 1,
      created: created,
      address: address,
    });
  } catch (error) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

const update = async (req, res) => {
  const address = req.body.address;
  addressDao.update(address).then(
    (value) => {
      console.log(value);
      if (value != 0) {
        res.status(200).json({
          message: "Update success!",
        });
      } else {
        res.status(200).json({
          message: "Update failed!",
        });
      }
    },
    (err) => {
      console.log(err);
      res.status(500).json({
        message: "Internal server error",
      });
    }
  );
};

const selectUserId = async (req, res) => {
  const id = req.params.id;
  const address = await addressDao.selectUserId(id);
  if (isNotEmpty(address)) {
    res.status(200).json({
      code: 1,
      message: "Result",
      address,
    });
  } else {
    res.status(200).json({
      code: 0,
      message: "Does not exist",
      address,
    });
  }
};

const search = (req, res) => {
  addressDao.search(req.query.keyword).then(
    (value) => {
      console.log(value);
      res.status(200).json({ value });
    },
    (err) => {
      console.log(err);
      res.status(500).json({
        message: "Internal server error",
      });
    }
  );
};

const selectById = async (req, res) => {
  const id = req.params.id || req.query.id;
  if (id) {
    const address = await addressDao.selectById(id);
    if (isNotEmpty(address)) {
      res.status(200).json({
        code: 1,
        message: "Result",
        address,
      });
    } else {
      res.status(200).json({
        code: 0,
        message: "Does not exist",
        address,
      });
    }
  }
};

const deleteAddress = async (req, res) => {
  const user_id = req.user.id;
  addressDao.deleteAddress(user_id).then(
    (count) => {
      if (count > 0) {
        res.status(200).json({
          code: 1,
          message: "Delete success!",
        });
      } else {
        res.status(400).json({
          code: 0,
          message: "Couldn't find your address!",
        });
      }
    },
    (err) => {
      console.log(err);
      res.status(500).json({
        message: "Internal server error",
      });
    }
  );
};

module.exports = {
  create,
  deleteAddress,
  update,
  search,
  selectById,
  selectUserId,
};
