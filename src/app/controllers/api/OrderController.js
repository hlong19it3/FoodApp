const orderDao = require('../../database/dao/OrderDao')
const userDao = require('../../database/dao/UserDao')
const orderDetailDao = require('../../database/dao/OrderDetailDao')
const { isEmpty, isNotEmpty } = require('../../utils/checkUtils')
const {
  statusCode,
  orderStatus,
  userStatus,
  role,
} = require('../../common/constants')

class OrderController {
  async create(req, res) {
    const user = req.user
    const { restaurantId, listOfOrder, address, voucher } = req.body
    if ((restaurantId, listOfOrder)) {
      orderDao
        .insert({
          customerId: user.id,
          address: address,
          restaurantId: restaurantId,
        })
        .then(
          (value) => {
            orderDetailDao
              .insert(value.dataValues, listOfOrder)
              .then(async (totalAmount) => {
                if (totalAmount && totalAmount > 0) {
                  value.dataValues.totalAmount = totalAmount
                  value.dataValues.orderStatus = orderStatus.WAITING
                  await orderDao.update(value.dataValues)
                  await orderDao.selectById(value.dataValues.id).then(
                    (order) => {
                      res.status(statusCode.OK).json(order)
                    },
                    (err) => {
                      console.log(err)
                      res.status(statusCode.SERVER_ERROR).json({
                        message: 'Internal server error',
                      })
                    }
                  )
                } else {
                  orderDao.deleteOrder(value.dataValues.id)
                  res.status(statusCode.BAD_REQUEST).json({
                    message: 'Bad Request',
                  })
                }
              })
          },
          (err) => {
            console.log(err)
            res.status(statusCode.SERVER_ERROR).json({
              message: 'Internal server error',
            })
          }
        )
    }
  }

  // async update(req, res) { }

  async restaurantReceiveOrder(req, res) {
    const user = req.user
    const { orderId } = req.body
    if (orderId) {
      orderDao.selectById(orderId).then(
        (order) => {
          if (
            order &&
            order.restaurant.userId == user.id &&
            order.orderStatus == orderStatus.WAITING
          ) {
            order.orderStatus = orderStatus.RESTAURANT_CONFIRM
            orderDao.update(order).then(
              (updated) => {
                res.status(statusCode.OK).json({ message: 'Update success' })
              },
              (err) => {
                console.log(err)
                res.status(statusCode.SERVER_ERROR).json({
                  message: 'Internal server error',
                })
              }
            )
          } else {
            //bad request
            res.status(statusCode.BAD_REQUEST).json({
              message: 'Bad Request1',
            })
          }
        },
        (error) => {
          console.log(error)
          res.status(statusCode.SERVER_ERROR).json({
            message: 'Internal server error',
          })
        }
      )
    } else {
      res.status(statusCode.BAD_REQUEST).json({
        message: 'Bad Request',
      })
    }
  }

  async shipperReceiveOrder(req, res) {
    const user = req.user
    const { orderId } = req.body
    if (orderId && user.status == userStatus.ONLINE) {
      orderDao.selectById(orderId).then(
        (order) => {
          if (order && order.orderStatus == orderStatus.RESTAURANT_CONFIRM) {
            order.orderStatus = orderStatus.SHIPPER_CONFIRM
            order.shipperId = user.id
            orderDao.update(order).then(
              (updated) => {
                if (updated > 0) {
                  user.status = userStatus.BUSY
                  userDao.updateStatus(user)
                  res.status(statusCode.OK).json({ message: 'Update success' })
                }
              },
              (err) => {
                console.log(err)
                res.status(statusCode.SERVER_ERROR).json({
                  message: 'Internal server error',
                })
              }
            )
          } else {
            //bad request
            res.status(statusCode.BAD_REQUEST).json({
              message: 'Bad Request',
            })
          }
        },
        (error) => {
          console.log(error)
          res.status(statusCode.SERVER_ERROR).json({
            message: 'Internal server error',
          })
        }
      )
    } else {
      res.status(statusCode.BAD_REQUEST).json({
        message: 'Bad Request',
      })
    }
  }

  async shipping(req, res) {
    const user = req.user
    const { orderId } = req.body
    if (orderId) {
      orderDao.selectById(orderId).then(
        (order) => {
          if (
            order &&
            order.restaurant.userId == user.id &&
            order.orderStatus == orderStatus.SHIPPER_CONFIRM
          ) {
            order.orderStatus = orderStatus.SHIPPING
            orderDao.update(order).then(
              (updated) => {
                res.status(statusCode.OK).json({ message: 'Update success' })
              },
              (err) => {
                console.log(err)
                res.status(statusCode.SERVER_ERROR).json({
                  message: 'Internal server error',
                })
              }
            )
          } else {
            //bad request
            res.status(statusCode.BAD_REQUEST).json({
              message: 'Bad Request1',
            })
          }
        },
        (error) => {
          console.log(error)
          res.status(statusCode.SERVER_ERROR).json({
            message: 'Internal server error',
          })
        }
      )
    } else {
      res.status(statusCode.BAD_REQUEST).json({
        message: 'Bad Request',
      })
    }
  }

  async delivered(req, res) {
    const user = req.user
    const { orderId } = req.body
    if (orderId && user.status == userStatus.BUSY) {
      orderDao.selectById(orderId).then(
        (order) => {
          if (order && order.orderStatus == orderStatus.SHIPPING) {
            order.orderStatus = orderStatus.RECEIVED
            orderDao.update(order).then(
              (updated) => {
                if (updated > 0) {
                  user.status = userStatus.ONLINE
                  userDao.updateStatus(user)
                  res.status(statusCode.OK).json({ message: 'Update success' })
                }
              },
              (err) => {
                console.log(err)
                res.status(statusCode.SERVER_ERROR).json({
                  message: 'Internal server error',
                })
              }
            )
          } else {
            //bad request
            res.status(statusCode.BAD_REQUEST).json({
              message: 'Bad Request',
            })
          }
        },
        (error) => {
          console.log(error)
          res.status(statusCode.SERVER_ERROR).json({
            message: 'Internal server error',
          })
        }
      )
    } else {
      res.status(statusCode.BAD_REQUEST).json({
        message: 'Bad Request',
      })
    }
  }

  async select(req, res) {
    const user = req.user
    const { id } = req.query
    if (id) {
      orderDao.selectById(id).then(
        (order) => {
          res.status(statusCode.OK).json([order])
        },
        (err) => {
          console.log(err)
          res.status(statusCode.SERVER_ERROR).json({
            message: 'Internal server error',
          })
        }
      )
      return
    }
    if (user.role == role.USER) {
      orderDao.selectByUserId(user.id).then(
        (orders) => {
          res.status(statusCode.OK).json(orders)
        },
        (err) => {
          console.log(err)
          res.status(statusCode.SERVER_ERROR).json({
            message: 'Internal server error',
          })
        }
      )
      return
    }
    if (user.role == role.RESTAURANT_OWNER) {
      orderDao.selectByRestaurantId(user.id).then(
        (orders) => {
          res.status(statusCode.OK).json(orders)
        },
        (err) => {
          console.log(err)
          res.status(statusCode.SERVER_ERROR).json({
            message: 'Internal server error',
          })
        }
      )
      return
    }
    if (user.role == role.SHIPPER) {
      orderDao.selectByShipper(user.id).then(
        (orders) => {
          res.status(statusCode.OK).json(orders)
        },
        (err) => {
          console.log(err)
          res.status(statusCode.SERVER_ERROR).json({
            message: 'Internal server error',
          })
        }
      )
      return
    }
    if (user.role == role.ADMIN) {
      orderDao.selectAll().then(
        (orders) => {
          res.status(statusCode.OK).json(orders)
        },
        (err) => {
          console.log(err)
          res.status(statusCode.SERVER_ERROR).json({
            message: 'Internal server error',
          })
        }
      )
      return
    }
    res.status(statusCode.BAD_REQUEST).json({
      message: 'Bad Request',
    })
  }

  // async selectById(req, res) { }

  // async selectByRestaurantId(req, res) { }

  // async selectByUserId(req, res) { }

  // async selectOrderWaitingByUser(req, res) { }

  // async selectOrderCookingByUser(req, res) { }

  // async selectOrderShippingByUser(req, res) { }

  // async selectOrderReceivedByUser(req, res) { }

  // async selectOrderRatedByUser(req, res) { }

  // async selectOrderWaitingByRestaurant(req, res) { }

  // async selectOrderCookingByRestaurant(req, res) { }

  // async selectOrderShippingByRestaurant(req, res) { }

  // async selectOrderReceivedByRestaurant(req, res) { }

  // async selectOrderRatedByRestaurant(req, res) { }
}

module.exports = new OrderController()
