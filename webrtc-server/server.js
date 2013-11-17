var port = 8080;

var http = require("http");
var holla = require('holla');
var server = http.createServer().listen(port);
var rtc = holla.createServer(server);

console.log("Port: " + port);