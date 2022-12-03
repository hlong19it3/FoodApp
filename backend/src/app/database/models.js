const { Sequelize, DataTypes, Model } = require('sequelize')
const sequelize = require('./AppDatabase')

const Address = sequelize.define(
	'address',
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		address: {
			type: DataTypes.STRING,
		},
	},
	{
		timestamps: false,
	}
)

const Category = sequelize.define(
	'category',
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		name: {
			type: DataTypes.STRING,
		},
		image: {
			type: DataTypes.STRING,
		},
	},
	{
		timestamps: false,
	}
)

const Food = sequelize.define(
	'foods',
	{
		// Model attributes are defined here
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		restaurantId: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		name: {
			type: DataTypes.STRING,
			allowNull: false,
		},
		price: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		details: {
			type: DataTypes.TEXT,
			defaultValue: '',
		},
		image: {
			type: DataTypes.STRING,
		},
		quantity: {
			type: DataTypes.INTEGER,
			defaultValue: 0,
		},
		sold: {
			type: DataTypes.INTEGER,
			defaultValue: 0,
		},
		startSell: {
			type: DataTypes.TIME,
		},
		endSell: {
			type: DataTypes.TIME,
		},
		categoryId: {
			type: DataTypes.INTEGER,
			allowNull: true,
		},
		rating: {
			type: DataTypes.DOUBLE,
			defaultValue: 5,
		},
		totalRating: {
			type: DataTypes.INTEGER,
			defaultValue: 0,
		},
	},
	{
		timestamps: false,
	}
)

const Menu = sequelize.define(
	'menu',
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		foodId: {
			type: DataTypes.STRING,
			defaultValue: '',
		},
		restaurantId: {
			type: DataTypes.INTEGER,
			allowNull: false,
		},
		price: {
			type: DataTypes.INTEGER,
		},
		description: {
			type: DataTypes.STRING,
		},
	},
	{
		timestamps: false,
	}
)

const OrderDetail = sequelize.define(
	'orderDetail',
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		foodId: {
			type: DataTypes.INTEGER,
		},
		orderId: {
			type: DataTypes.INTEGER,
		},
		quantity: {
			type: DataTypes.INTEGER,
		},
		amount: {
			type: DataTypes.INTEGER,
		},
	},
	{
		timestamps: true,
	}
)

const Order = sequelize.define(
	'order',
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		customerId: {
			type: DataTypes.INTEGER,
			allowNull: false,
		},
		restaurantId: {
			type: DataTypes.INTEGER,
			allowNull: false,
		},
		orderDate: {
			type: DataTypes.DATE,
			allowNull: false,
		},
		totalAmount: {
			type: DataTypes.INTEGER,
		},
		orderStatus: {
			type: DataTypes.INTEGER,
		},
		// createdAt: {
		//   type: DataTypes.DATE,
		//   defaultValue: DataTypes.NOW,
		// },
	},
	{
		timestamps: true,
	}
)

const Rating = sequelize.define(
	'rating',
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		customerId: {
			type: DataTypes.INTEGER,
		},
		orderId: {
			type: DataTypes.INTEGER,
		},
		score: {
			type: DataTypes.INTEGER,
		},
	},
	{
		timestamps: false,
	}
)

const Restaurant = sequelize.define(
	'restaurant',
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		name: {
			type: DataTypes.STRING,
		},
		userId: {
			type: DataTypes.INTEGER,
		},
		address: {
			type: DataTypes.STRING,
		},
		rating: {
			type: DataTypes.FLOAT,
			defaultValue: 0,
		},
	},
	{
		timestamps: false,
	}
)

const User = sequelize.define(
	'user',
	{
		// Model attributes are defined here
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		role: {
			type: DataTypes.INTEGER,
			defaultValue: 1,
		},
		firstName: {
			type: DataTypes.STRING,
			allowNull: false,
		},
		lastName: {
			type: DataTypes.STRING,
			allowNull: false,
		},
		mainAddress: {
			type: DataTypes.STRING,
		},
		birthday: {
			type: DataTypes.DATEONLY,
		},
		gender: {
			type: DataTypes.TINYINT,
			defaultValue: 1,
		},
		email: {
			type: DataTypes.STRING,
		},
		phone: {
			type: DataTypes.STRING,
			defaultValue: '',
		},
		password: {
			type: DataTypes.STRING,
			allowNull: false,
		},
		status: {
			type: DataTypes.TINYINT,
			defaultValue: 0,
		},
		// registrationTime: {
		//   type: DataTypes.DATE,
		// },
		lastAction: {
			type: DataTypes.DATE,
			defaultValue: DataTypes.NOW,
		},
		lat: {
			type: DataTypes.FLOAT,
			defaultValue: 0,
		},
		lg: {
			type: DataTypes.FLOAT,
			defaultValue: 0,
		},
		avatar: {
			type: DataTypes.STRING,
			defaultValue: 'https://avatars.githubusercontent.com/u/56586682?v=4',
		},
		refreshToken: {
			type: DataTypes.STRING(2000),
			defaultValue: '',
		},
		// createdAt: {
		//   type: DataTypes.DATE,
		//   defaultValue: DataTypes.NOW,
		// },
	},
	{
		timestamps: true,
	}
)

const Voucher = sequelize.define(
	'voucher',
	{
		id: {
			type: DataTypes.INTEGER,
			autoIncrement: true,
			primaryKey: true,
		},
		restaurantId: {
			type: DataTypes.INTEGER,
		},
		name: {
			type: DataTypes.STRING,
		},
		type: {
			type: DataTypes.TINYINT,
		},
		value: {
			type: DataTypes.FLOAT,
		},
	},
	{
		timestamps: false,
	}
)

User.hasOne(Address, {
	foreignKey: 'userId',
})

User.hasMany(Order, {
	foreignKey: 'userId',
})

User.hasOne(Restaurant, {
	foreignKey: 'userId',
})

User.hasMany(Rating, {
	foreignKey: 'userId',
})

Order.hasMany(OrderDetail, {
	foreignKey: 'orderId',
})

Order.hasOne(Rating, {
	foreignKey: 'orderId',
})

Food.hasMany(OrderDetail, {
	foreignKey: 'foodId',
})

Category.hasMany(Food, {
	foreignKey: 'categoryId',
})

Restaurant.hasOne(Menu, {
	foreignKey: 'restaurantId',
})

// Restaurant.hasMany(Food, {
// 	foreignKey: 'restaurantId',
// })

Restaurant.hasMany(Order, {
	foreignKey: 'restaurantId',
})

Restaurant.hasMany(Voucher, {
	foreignKey: 'restaurantId',
})

// Sync all tables in database
// sequelize.sync({ force: true });

module.exports = {
	sequelize,
	Address,
	Category,
	Food,
	Menu,
	OrderDetail,
	Order,
	Rating,
	Restaurant,
	User,
	Voucher,
}
