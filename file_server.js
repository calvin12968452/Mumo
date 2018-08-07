var express = require('express');
var app = express(); //產生 Express Application 物件
var path = require('path');
var mysql = require('mysql');
var routes = require('routes');

//var users = require('./routes/users');


app.use('/template',function(req, res, next){
  console.log(req,url);
  next();
} );
//lets css work
app.use('/css',express.static('css'));

app.get('/', function(req, res) {  //當連線到跟目錄的時候跳出以下訊息
  res.sendFile(__dirname + '/template/homepage/homepage.html');
  
});

//route
app.get('/normal',function(req, res){
  res.sendFile(__dirname + '/template/normal/normal.html');
});

app.get('/vendor',function(req, res){
  res.sendFile(__dirname + '/template/businesspage/vendor.html');
});


app.get('/signup',function(req, res){
  res.sendFile(__dirname + '/template/signup/signup.html');
});

//let manager konws that server is working
app.listen(8080, function(){
  console.log("伺服器已經啟動在 http://localhost:8080/");
});



// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');



//DB 

//db state
app.use(function(req, res, next){
  req.config = config;
  next();
})

//config for db
var config = mysql.createConnection({
  host: "localhost",
  user:"root",
  password:"",
  server:"localhost\\SQLEXPRESS",   //這邊要注意一下!!
  database:"mumo"
});

//coonect to db
config.connect(function(err){
  if(err) {
    console.log("connecting error");
    return ;
  }
  console.log ("connecting success");
});

app.get('/test', function(req, res, next){
  var db = req.config;
  var data = "";

  db.query('SELECT * FROM user', function(err, rows){
    if(err)
      console.log(err);
    var data = rows;
    res.render('test',{title:"use infor",data: data});
  });
});