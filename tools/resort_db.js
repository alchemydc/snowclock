#!/opt/local/bin/node

// this doesn't write to a file, so redirect stdout to get what we need for the iOS app
// e.g. ./resort_db.js > us_resorts_basics.json

var fs = require('fs');
var _ = require("underscore");

var request = require('request')
//var regions = 'canada'
var regions = 'us'

var data = fs.readFileSync("../databases/" + regions + '_resorts_details.json').toString();
var resorts = JSON.parse(data);
var output = [];

//console.log(resorts)

//var ids = ''


resorts.items.forEach(function(resort, index) {

    //console.log(index)
    //console.log(resort);
    var n_resort = {}
    //console.log("Resort: " + resort.resortName)
    n_resort.resortName = resort.resortName

    //console.log("ID: "+ resort.id)
    n_resort.id = resort.id

    //console.log("Latitude: " + resort.latitude)
    n_resort.latitude = resort.latitude

    //console.log("Longitude: " + resort.longitude)
    n_resort.longitude = resort.longitude


    //console.log("State: " + resort.state)
    n_resort.state = resort.state


    //console.log("Country: " + resort.country)
    n_resort.country = resort.country

    //console.log("Vert: " + resort.verticalDrop)
    n_resort.verticalDrop = resort.verticalDrop

    //console.log(JSON.stringify(n_resort) + ',')
    //console.log(n_resort + ',')

    output.push(n_resort)

});

console.log(JSON.stringify(output))

