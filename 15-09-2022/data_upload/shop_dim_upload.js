const Shop = require("../model/createShopDim");

const mffoodmart = Shop.build(
    {
        shop_name: "mffoodmart",
        branc_name: "1"
    }
);

(async () => {
    await Shop.sync();
    await mffoodmart.save();
})();