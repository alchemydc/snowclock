#!/opt/local/bin/node

//var apikey = 'hack538.kcah124';
var apikey = 'SnoCountry.example';
var apikey = 'treeline432.inter572'

var request = require('request');

var ids = '303001,303005,303007,303011,303014,303023,209004,916004,801007';

// http://feeds.snocountry.com/getResortList.php?apiKey=SnoCountry.example&states=vt&resortType=alpine&output=json

request("http://feeds.snocountry.com/conditions.php?apiKey=" + apikey + "&ids=" + ids, function (error, response, body) {

  if (!error && response.statusCode == 200) {
    //console.log(body) // Print the body of the response.
    var result = JSON.parse(body)
    console.log(result)
    //console.log(result.items[0].forecastWeather)
    /* var result2 = result.items[0]
    longitude = result2.longitude
    latitude = result2.latitude
    name = result2.resortName
    console.log("name: " + name)
    console.log("latitude: " + latitude)
    console.log("longitude: " + longitude) */
  }
})

