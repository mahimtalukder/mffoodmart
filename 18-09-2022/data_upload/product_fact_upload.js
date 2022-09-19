const Product = require("../model/createProductDim");
const Shop = require("../model/createShopDim")
const ProductFact = require("../model/createProductFact");
const ProductCategory = require("../model/createCategoryDim")
const Time_dim = require('../model/createTimeDim');
const data = require('../data');


let product_fact_module = (async () => {
    await ProductFact.sync();
    const { count, rows } = await ProductFact.findAndCountAll();
    let product_count = count;
    for (let allcatagory in data) {
        for (let product in data[allcatagory]) {
            product = data[allcatagory][product];
            for (let i in product['catagory']) {
                const productCategory = await ProductCategory.findOne({ where: { category_name: product['catagory'][i] } });
                const shop = await Shop.findOne({ where: { shop_name: 'mffoodmart' } });
                const product_dim = await Product.findOne({ where: { product_name: product['name'] } });
                console.log(product['catagory'][i])
                console.log(productCategory['category_id']);

                let priceArr = product["price"].split(" ");

                
                let date = new Date(product['scraped_at']);
                let scraped_date = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
                const time_dim = await Time_dim.findOne({ where: { date_actual: scraped_date } });


                const new_fact = ProductFact.build(
                    {
                        product_id: shop["shop_name"] + product_count,
                        product_dim_id: product_dim["product_id"],
                        shop_product_id: product["shop_product_id"],
                        product_category_id: productCategory['category_id'],
                        availability: product["availability"],
                        price: priceArr[1],
                        currency: product["currency"],
                        weight: product["discription"],
                        shop_id: shop["shop_id"],
                        scraped_at: product["scraped_at"],
                        time_dim_id: time_dim["date_dim_id"]
                    }
                );
                product_count++;
                await new_fact.save();
            }


        }


    }

})();



module.exports = product_fact_module;



