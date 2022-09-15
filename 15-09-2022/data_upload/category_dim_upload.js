const Category = require("../model/createCategoryDim");
const data = require('../data');


(async () => {
    await Category.sync();
    for (let catagory in data) {
        let catagory_created = Category.build({ 
            category_name: catagory
        });
        await catagory_created.save();
    }
})();


