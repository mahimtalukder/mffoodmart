const { Sequelize } = require('sequelize');
const sequelize = require("../utils/connectingToDatabase");
const Category = require("./createCategoryDim");
const Product_dim = require("./createProductDim");

const product_categories = sequelize.define('product_categories', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    category_dims_id: {
        type: Sequelize.INTEGER,
        references: {
            model: Category,
            key: 'category_id'
        }
    },
    product_dim_id: {
        type: Sequelize.INTEGER,
        references: {
            model: Product_dim,
            key: 'product_id'
        }
    }
});




module.exports = product_categories;