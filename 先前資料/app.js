var express = require('express');
var app = express(); //產生 Express Application 物件
var path = require('path');
var mysql = require('mysql');
var routes = require('routes');
var bodyPraser = require('body-parser');
var fs = require('fs');
var reg = require('./routes/reg')
var passport = require('passport');
var pass = require('./passport.js');
pass(passport);
app.use(passport.initialize());
app.use(passport.session());
var http = require("http");
var io = require('socket.io')();


//當新的使用者連接進來的時候
io.sockets.on('connection', function(socket){

  //新user
  socket.on('new',function(msg){
      socket.username = msg;
      console.log("new user:"+msg+" logged.");
      io.emit('add',{
          username: socket.username
      });
  });

  //監聽新訊息事件
  socket.on('sendMsg', function(msg){

      console.log(socket.username+": "+msg);

        //發佈新訊息
      io.emit('getMsg', {
          username:socket.username,
          msg:msg
      });
  });

  //left
  socket.on('disconnect',function(){
      console.log(socket.username+" left.");
      io.emit('left',{
          username:socket.username
      });
  });

});


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
  server:"localhost\\SQLEXPRESS",   //這邊要注意一下!! <------ //注意殺虫??!!!!!
  database:"mumo"
});

//DB
//coonect to db
con.connect(function(err){
  if(err) {
    console.log("database connection failed");
    return ;
  }
  console.log ("database connection succeed");
});

//db state
app.use(function(req, res, next){
  req.con = con;
  next();
});

app.use('/', reg);


//lets css work  -> https://stackoverflow.com/questions/24582338/how-can-i-include-css-files-using-node-express-and-ejs
app.use('/css',express.static('css'));

app.get('/', function(req, res) {  //當連線到跟目錄的時候跳出以下訊息
  res.sendFile(__dirname + '/yp/homepage.html');
});

app.get('/profile',function(req, res){
  res.sendFile(__dirname + '/fuckthisshit/ras 2/index.html');
});

// google login route
app.get('/oauth', passport.authenticate('google_token', {scope : ['profile', 'email']}));

// google login successfully then callback to the route
app.get('/oauth/callback', passport.authenticate('google_token', {successRedirect: '/profile', failureRedirect: '/'}));

// fb login route
app.get('/fb', passport.authenticate('fb_token', { authType: 'rerequest', scope: ['user_friends', 'manage_pages'] }));

// fb login successfully then callback to the route
app.get('/fb/callback', passport.authenticate('fb_token', {successRedirect: '/profile', failureRedirect: '/'}));

//route
app.get('/normal',function(req, res){
  res.sendFile(__dirname + '/template/normal/normal.html');
});

app.get('/vendor',function(req, res){
  res.sendFile(__dirname + '/template/businesspage/vendor.html');
});

app.get('/signup',function(req, res){
  res.sendFile(__dirname + '/yp/signup.html');
});

//let manager konws that server is working
app.listen(3000, function(){
  console.log("伺服器已經啟動在 http://localhost:3000/");
});












app.get('/test', function(req, res, next){
  var db = req.config;
  var data = "";
  try{
    db.query('SELECT * FROM user', function(err, rows){
      if(err)
        console.log(err);
      var data = rows;
      res.render('test',{title:"use infor",data: data});
    });
  }catch(err){
    console.log(err);
  }
});


/*
app.post('/file_server', function(req, res){
  console.log('Form (from querystring): ' + req.query.form);
  console.log('Name (from visible form field): ' + req.body.name);
  console.log('Email (from visible form field): ' + req.body.email);
  res.redirect(303, '/');
});
=======
>>>>>>> 177374753246831a627b40d5f0f3d3ec726b1313


<<<<<<< HEAD
*/
module.exports = router;
