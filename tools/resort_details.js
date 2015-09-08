#!/opt/local/bin/node

var apikey = 'hack538.kcah124';
var fs = require('fs');
var request = require('request')
//var regions = 'canada'
//var regions = 'europe'
//var regions = 'southern_hemisphere'

var regions = 'all'


var data = fs.readFileSync("../databases/" + regions + '_resorts.json').toString();
var resorts = JSON.parse(data);

//console.log(resorts)

var ids = ''

resorts.items.forEach(function(resort) {
    //console.log(resort);
    //console.log("Resort: " + resort.resortName)
    //console.log("ID: "+ resort.id)
    ids += resort.id + ",";
});

console.log("Requesting details for resort ids: " + ids)

4request("http://feeds.snocountry.com/conditions.php?apiKey=" + apikey + "&ids=" + ids).pipe(fs.createWriteStream("../databases/" + regions + '_resorts_details.json'))
