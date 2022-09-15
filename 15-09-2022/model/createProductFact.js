const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require("../utils/connectingToDatabase")
const Shop = require("../model/createShopDim");
const Product = require("../model/createProductDim")
const Category = require('../model/createCategoryDim')


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
        type: DataTypes.STRING,
        allowNull: true
    },
});

Product.hasMany(product_fact, {
    foreignKey: 'product_dim_id'
});
product_fact.belongsTo(Product);

Category.hasMany(product_fact, {
    foreignKey: 'product_category_id'
});
product_fact.belongsTo(Category);

Shop.hasMany(product_fact, {
    foreignKey: 'shop_id'
});
product_fact.belongsTo(Shop);




module.exports = product_fact;