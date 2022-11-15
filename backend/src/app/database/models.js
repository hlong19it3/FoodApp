const { Sequelize, DataTypes, Model } = require("sequelize");
const sequelize = require("./AppDatabase");

const Address = sequelize.define(
  "address",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    customer_id: {
      type: DataTypes.INTEGER,
    },
    address: {
      type: DataTypes.STRING,
    },
  },
  {
    timestamps: false,
  }
);

const Category = sequelize.define(
  "Category",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    type: {
      type: DataTypes.STRING,
    },
  },
  {
    timestamps: false,
  }
);

const Food = sequelize.define(
  "foods",
  {
    // Model attributes are defined here
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    restaurant_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    price: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    details: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    image: {
      type: DataTypes.STRING,
    },
    quantity: {
      type: DataTypes.INTEGER,
    },
    start_sell: {
      type: DataTypes.TIME,
    },
    end_sell: {
      type: DataTypes.TIME,
    },
    category_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  },
  {
    timestamps: false,
  }
);

const Menu = sequelize.define(
  "Menu",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    food_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    restaurant_id: {
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
);

const OrderDetail = sequelize.define(
  "order_detail",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    food_id: {
      type: DataTypes.INTEGER,
    },
    order_id: {
      type: DataTypes.INTEGER,
    },
    quantity: {
      type: DataTypes.INTEGER,
    },
    amount: {
      type: DataTypes.INTEGER,
    },
    // created_at: {
    //   type: DataTypes.DATE,
    //   defaultValue: DataTypes.NOW,
    // },
  },
  {
    timestamps: true,
  }
);

const Order = sequelize.define(
  "Order",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    customer_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    restaurant_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    order_date: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    total_amount: {
      type: DataTypes.INTEGER,
    },
    order_status: {
      type: DataTypes.INTEGER,
    },
    // created_at: {
    //   type: DataTypes.DATE,
    //   defaultValue: DataTypes.NOW,
    // },
  },
  {
    timestamps: true,
  }
);

const Rating = sequelize.define(
  "Rating",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    customer_id: {
      type: DataTypes.INTEGER,
    },
    order_id: {
      type: DataTypes.INTEGER,
    },
    score: {
      type: DataTypes.INTEGER,
    },
  },
  {
    timestamps: false,
  }
);

const Restaurant = sequelize.define(
  "Restaurant",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
    },
    user_id: {
      type: DataTypes.INTEGER,
    },
    address: {
      type: DataTypes.STRING,
    },
    rating: {
      type: DataTypes.FLOAT,
      defaultValue: 0
    },
  },
  {
    timestamps: false,
  }
);

const User = sequelize.define(
  "User",
  {
    // Model attributes are defined here
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    role: {
      type: DataTypes.INTEGER,
    },
    first_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    last_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    main_address: {
      type: DataTypes.STRING,
    },
    birthday: {
      type: DataTypes.DATEONLY,
    },
    gender: {
      type: DataTypes.TINYINT,
    },
    email: {
      type: DataTypes.STRING,
    },
    phone: {
      type: DataTypes.STRING,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    status: {
      type: DataTypes.TINYINT,
    },
    // registration_time: {
    //   type: DataTypes.DATE,
    // },
    last_action: {
      type: DataTypes.DATE,
    },
    lat: {
      type: DataTypes.FLOAT,
    },
    lg: {
      type: DataTypes.FLOAT,
    },
    avatar: {
      type: DataTypes.STRING,
    },
    refresh_token: {
      type: DataTypes.STRING(2000),
      allowNull: true,
    },
    // created_at: {
    //   type: DataTypes.DATE,
    //   defaultValue: DataTypes.NOW,
    // },
  },
  {
    timestamps: true,
  }
);

const Voucher = sequelize.define(
  "Voucher",
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    restaurant_id: {
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
);

User.hasOne(Address, {
  foreignKey: "user_id",
});

User.hasMany(Order, {
  foreignKey: "user_id",
});

User.hasOne(Restaurant, {
  foreignKey: "user_id",
});

User.hasMany(Rating, {
  foreignKey: "user_id",
});

Order.hasMany(OrderDetail, {
  foreignKey: "order_id",
});

Order.hasOne(Rating, {
  foreignKey: "order_id",
});

Food.hasMany(OrderDetail, {
  foreignKey: "food_id",
});

Category.hasMany(Food, {
  foreignKey: "category_id",
});

Restaurant.hasOne(Menu, {
  foreignKey: "restaurant_id",
});

Restaurant.hasMany(Order, {
  foreignKey: "restaurant_id",
});

Restaurant.hasMany(Voucher, {
  foreignKey: "restaurant_id",
});

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
};
