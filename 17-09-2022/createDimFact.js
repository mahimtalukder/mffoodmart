const sequelize = require('./utils/connectingToDatabase')


// const product_dim = require('./model/createProductDim')
// const category_dim = require('./model/createCategoryDim')
// const shop_dim = require('./model/createShopDim')
const product_fact = require('./model/createProductFact')
//const time_dim = require('./model/createTimeDim')



//sequelize.sync({ force: true })