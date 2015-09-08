#!/opt/local/bin/node

var fs = require('fs');
var request = require('request')
//var regions = 'canada'


var data = fs.readFileSync('../databases/all.json').toString();
var resorts = JSON.parse(data);

console.log(resorts)

//var ids = ''

resorts.items.forEach(function(resort) {
 // console.log(resort);
    console.log("Resort: " + resort.resortName)
    console.log("ID: "+ resort.id)
    console.log("Latitude: "+ resort.latitude)
    console.log("Longitude: "+ resort.longitude)

  //  ids += resort.id + ",";
});

//console.log(ids)



