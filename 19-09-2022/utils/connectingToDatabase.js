const { Sequelize } = require('sequelize');


const sequelize = new Sequelize('mffoodmartdw', 'postgres', 'AgentKtinformatikDB12290!', {
    host: 'dev.commerce.clickspikes.com',
    port: 5592,
    dialect: 'postgres'
});

// const sequelize = new Sequelize('scraping_db', 'mahim', '1465', {
//     host: 'localhost',
//     port: 5432,
//     dialect: 'postgres'
// });


module.exports = sequelize;
