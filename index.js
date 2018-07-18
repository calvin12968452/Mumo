

//此為路由文件
var express = require('express');
var app = express(); //產生 Express Application 物件
app.get('/', function(req, res) {  //當連線到跟目錄的時候跳出以下訊息
    res.send('hello <h>world</h>');
});
app.listen(3000, function(){
    console.log("伺服器已經啟動在 http://localhost:3000/");
});
