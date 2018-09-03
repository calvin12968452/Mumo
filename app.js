var express = require('express');
var app = express(); //產生 Express Application 物件
var path = require('path');
var mysql = require('mysql');
var routes = require('routes');
var bodyPraser = require('body-parser');
var fs = require('fs');
var reg = require('./routes/reg');
var http = require('http').Server(app);
var io = require('socket.io')(http);

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//method
var router = express.Router();
app.use(bodyPraser.urlencoded({extended:true}));

app.use('/template',function(req, res, next){
  console.log(req,url);
  next();
} );


//config for db
var con = mysql.createConnection({
  host: "localhost",
  user:"root",
  password:"",
  server:"localhost\\SQLEXPRESS",   //這邊要注意一下!!
  database:"mumo"
});

//DB 
//coonect to db
con.connect(function(err){
  if(err) {
    console.log("connecting error");
    return ;
  }
  console.log ("connecting success");
});

//db state
app.use(function(req, res, next){
  req.con = con;
  next();
});

app.use('/', reg);


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

app.get('/chatroom',function(req, res){
  res.sendFile(__dirname + '/chatroom.html');
});

//let manager konws that server is working
app.listen(8080, function(){
  console.log("伺服器已經啟動在 http://localhost:8080/");
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


/*
app.post('/file_server', function(req, res){
  console.log('Form (from querystring): ' + req.query.form);
  console.log('Name (from visible form field): ' + req.body.name);
  console.log('Email (from visible form field): ' + req.body.email);
  res.redirect(303, '/');
});

app.get('/process/submit', function(req, res, next){});

app.post('/process/submit', function(req, res, next){
  var user = req.body.user
  console.log('user (from visible form field): ' + user);
  console.log('email (from visible form field): ' + req.body.email);
  console.log('password (from visible form field): ' + req.body.psw);
  res.render('list',{output: req.body.user});
});

*/
module.exports = router;