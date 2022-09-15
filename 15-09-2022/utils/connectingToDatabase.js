const { Sequelize } = require('sequelize');


const sequelize = new Sequelize('scraping_db', 'mahim', '1465', {
    host: 'localhost',
    dialect: 'postgres'
});


module.exports = sequelize;
