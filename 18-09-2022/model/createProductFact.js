const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require("../utils/connectingToDatabase")
const Shop = require("../model/createShopDim");
const Product = require("../model/createProductDim")
const Category = require('../model/createCategoryDim')
const Time = require('../model/createTimeDim');


const product_fact = sequelize.define('product_fact', {
    product_id: {
        type: DataTypes.STRING,
        primaryKey: true
    },
    product_dim_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    shop_product_id: {
        type: DataTypes.STRING,
        allowNull: true
    },
    product_category_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    availability: {
        type: DataTypes.STRING,
        allowNull: true
    },
    price: {
        type: DataTypes.STRING,
        allowNull: true
    },
    currency: {
        type: DataTypes.STRING,
        allowNull: true
    },
    weight: {
        type: DataTypes.STRING,
        allowNull: true
    },
    shop_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    pieces: {
        type: DataTypes.STRING,
        allowNull: true
    },
    inventory: {
        type: DataTypes.STRING,
        allowNull: true
    },
    scraped_at: {
        type: DataTypes.DATE,
        allowNull: true
    },
    time_dim_id: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    batch_id: {
        type: DataTypes.INTEGER,
        allowNull: true
    }
});

Product.hasMany(product_fact, {
    foreignKey: 'product_dim_id'
});

Category.hasMany(product_fact, {
    foreignKey: 'product_category_id'
});

Shop.hasMany(product_fact, {
    foreignKey: 'shop_id'
});

Time.hasMany(product_fact, {
    foreignKey: 'time_dim_id'
});


module.exports = product_fact;