const connection = require("../AppDatabase");
const { Address } = require("../models");
const { Op } = require("sequelize");

function insert(address) {
  return Address.findOrCreate({
    where: {
      user_id: address.user_id,
    },
    defaults: {
      address: address.address,
    },
  });
}

async function update(address) {
  return await Address.update(
    {
      address: address.address,
    },
    {
      where: {
        id: address.id,
      },
    }
  );
}

async function search(keyword) {
  return await Address.findAll({
    where: {
      address: {
        [Op.substring]: keyword,
      },
    },
  });
}

function selectById(id) {
  return Address.findAll({
    where: {
      id: id,
    },
  });
}

async function deleteAddress(user_id) {
  return await Address.destroy({
    where: {
      user_id: user_id,
    },
  });
}

function selectUserId(user_id) {
  return Address.findAll({
    where: {
      user_id: user_id,
    },
  });
}

function create(address) {
  return Address.create(address);
}

module.exports = {
  insert,
  create,
  deleteAddress,
  update,
  search,
  selectById,
  selectUserId,
};
