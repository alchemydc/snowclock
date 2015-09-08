#!/opt/local/bin/node

var fs = require('fs');
var json2csv = require('json2csv');

var json = fs.readFileSync('../databases/us_resorts_details2.json').toString();

console.log(json)

json2csv({data: json, fields: ['resortName', 'state', 'country']}, function(err, csv) {
    if (err) console.log(err);
    console.log(csv);
});

