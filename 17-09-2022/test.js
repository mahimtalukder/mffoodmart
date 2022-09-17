const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('./utils/connectingToDatabase');
const queryInterface = sequelize.getQueryInterface();
const Product = require('./model/createProductFact');
const Time_dim = require('./model/createTimeDim');

let update = (product) => new Promise(async (resolve, reject) => {
    if (product['scraped_at'] != null) {
        let scraped_date = new Date(product['scraped_at']);
        const updatedRows = await Product.findOne({ where: { product_id: product['product_id'] } });
        updatedRows['scraped_at_new'] = scraped_date;
        await updatedRows.save();
        resolve(updatedRows);

    } else {
        const scrapt = new Date('Tue, 13 Sep 2022 12:15:49 GMT');
        const updatedRows = await Product.findOne({ where: { product_id: product['product_id'] } });
        updatedRows['scraped_at_new'] = scrapt;
        await updatedRows.save();
        resolve(updatedRows);
    }
});


let update_price = (product) => new Promise(async (resolve, reject) => {
    console.log(product["product_id"]);
    let priceArr = product['price'].split(" ");;
    const updatedRows = await Product.findOne({ where: { product_id: product['product_id'] } });
    updatedRows['price'] = priceArr[1];
    await updatedRows.save();
    resolve(updatedRows);
});

let update_time_dim = (product) => new Promise(async (resolve, reject) => {
    let date = new Date(product['scraped_at']);
    let scraped_date = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
    const time_dim = await Time_dim.findOne({ where: { date_actual: scraped_date } });
    console.log(time_dim);
    const updatedRows = await Product.findOne({ where: { product_id: product['product_id'] } });
    updatedRows['time_dim_id'] = time_dim["date_dim_id"];
    await updatedRows.save();
    resolve(updatedRows);
});

(async () => {
    //task 1
    //queryInterface.addColumn('product_facts', 'time_dim_id', { type: DataTypes.INTEGER });



    // task 2
    //await Product.sync();
    Time_dim.sync();
    const product = await Product.findAll();
    for (let obj in product) {
        let currentPageData = await update_time_dim(product[obj]);
    }

    //task 3
    //queryInterface.removeColumn('product_facts', 'productDimProductID', { /* query options */ });
})();
