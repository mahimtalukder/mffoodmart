const Product = require("../model/createProductDim");
const Shop = require("../model/createShopDim")
const ProductFact = require("../model/createProductFact");
const ProductCategory = require("../model/createCategoryDim")
const data = require('../data');


(async () => {
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
                let now = new Date();
                const new_fact = ProductFact.build(
                    {
                        product_id: shop["shop_name"] + product_count,
                        product_dim_id: product_dim["product_id"],
                        shop_product_id: product["shop_product_id"],
                        product_category_id: productCategory['category_id'],
                        availability: product["availability"],
                        price: product["price"],
                        currency: product["currency"],
                        weight: product["discription"],
                        shop_id: shop["shop_id"],
                        scraped_at: product["scraped_at"],

                    }
                );
                product_count++;
                await new_fact.save();
            }


        }


    }

})();



