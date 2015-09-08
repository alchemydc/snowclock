#!/opt/local/bin/node

var apikey = 'hack538.kcah124';
var request = require('request');
var fs = require('fs');

//var regions = 'usa';
//var regions = 'canada';
//var regions = 'europe';
var regions = 'southern_hemisphere'

var regions = 'usa, canada, europe, southern_hemisphere'

//request("http://feeds.snocountry.com/getResortList.php?apiKey=" + apikey + "&regions=" + regions + "&resortType=alpine&output=json").pipe(fs.createWriteStream("../databases/" + regions + '_resorts.json'))
request("http://feeds.snocountry.com/getResortList.php?apiKey=" + apikey + "&regions=" + regions + "&resortType=alpine&output=json").pipe(fs.createWriteStream("../databases/all_resorts.json"))



