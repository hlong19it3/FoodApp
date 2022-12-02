const { Food } = require('../models')
const { Op } = require('sequelize')

async function getAll() {
  return await Food.findAll({})
}

async function insert(food) {
  return await Food.findOrCreate({
    where: {
      restaurantId: food.restaurantId,
      name: food.name,
    },
    defaults: {
      price: food.price,
      details: food.details,
      image: food.image,
      quatity: food.quatity,
      sold: food.sold,
      startSell: food.startSell,
      endSell: food.endSell,
      categoryId: food.categoryId,
    },
  })
}

async function update(food) {
  return await Food.update(
    {
      name: food.name,
      price: food.price,
      details: food.details,
      image: food.image,
      quatity: food.quatity,
      sold: food.sold,
      startSell: food.startSell,
      endSell: food.endSell,
      categoryId: food.categoryId,
    },
    {
      where: {
        id: food.id,
      },
    }
  )
}

async function selectById(id) {
  return await Food.findOne({
    where: {
      id: id,
    },
  })
}

async function selectByRestaurantId(restaurantId) {
  return await Food.findAll({
    where: {
      restaurantId: restaurantId,
    },
  })
}
async function selectByCategoryId(categoryId) {
  return await Food.findAll({
    where: {
      categoryId: categoryId,
    },
  })
}

async function deleteFood(id) {
  return await Food.destroy({
    where: {
      id: id,
    },
  })
}

async function search(keyword) {
  return await Food.findAll({
    where: {
      name: {
        [Op.substring]: keyword,
      },
    },
  })
}

module.exports = {
  getAll,
  insert,
  update,
  selectById,
  selectByRestaurantId,
  selectByCategoryId,
  deleteFood,
  search,
}
