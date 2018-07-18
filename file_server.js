var http = require('http');
var fs = require('fs');
var url = require('url');
var adr = 'http://localhost:8080/';
var q = url.parse(adr, true);

console.log(q.host); //returns 'localhost:8080'
console.log(q.pathname); //returns '/default.htm'

var express = require('express');
var app = express(); //產生 Express Application 物件
const hostname = '127.0.0.1';
const port = 8080;
app.get('/', function(req, res) {  //當連線到跟目錄的時候跳出以下訊息
    res.send('hello <h>world</h>');
});
app.listen(8080, function(){
    console.log("伺服器已經啟動在 http://localhost:8080/");
});

/*
//if not found page else deplay page
http.createServer(function (req, res) {
  var q = url.parse(req.url, true);
  var filename = "." + q.pathname;
  fs.readFile(filename, function(err, data) {
    if (err) {
      res.writeHead(404, {'Content-Type': 'text/html'});
      return res.end("404 Not Found");
    } 
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    return res.end();
  });
}).listen(8080); 
*/
