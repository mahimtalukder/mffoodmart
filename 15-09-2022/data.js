const fs = require('fs');

let data = fs.readFileSync('./dataOf13-09-2022.json');
data = JSON.parse(data);
module.exports = data;