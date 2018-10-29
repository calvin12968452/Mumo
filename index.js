const express = require('express');
const passport = require('passport');
var mysql = require('mysql');
var path = require('path');
var reg = require('./reg');
var app = express();
var http = require("http").Server(app);
var io = require('socket.io')(http);
var ls = require('local-storage');    // <-- local storage, can be changed to your database. hint : mongoose
// useage：ls.get('ls-name')
var mysql = require ('mysql');

// ====================================
// colorful console in terminal =======
// ====================================
const {
  textStyle,
  textFg,
  textBg
} = require('./module/color.js');

var imp_passport = require('./controller/passport.js');
var Route = require('./route.js');
var chat = require('./controller/socket.js');
//var db_connect = require('./sql/dbMYSQL.js');



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
    console.log("           database connecting error");
    return ;
  }
  console.log ("           database connecting success");
});

//db state
app.use(function(req, res, next){
  req.con = con;
  next();
});

//tino's suck chatroom
var io = require('socket.io').listen(http);

io.sockets.on('connection', function(socket){
  console.log("[ socket io ]: connected");
  // listen on the event : new user
  socket.on('new',function(msg){
      socket.username = msg;
      console.log("[ new user ]: " + msg);
      io.sockets.emit('add',{
        username: socket.username
      });
  });

  //listen on the event : send messages
  socket.on('sendMsg', function(msg){
    console.log("[ message ]: " + msg + ", from " + socket.username);
    // response with the event and the params
    io.sockets.emit('getMsg', {
      username:socket.username,
      msg:msg
    });
  });

  // listen on the event : user offline
  socket.on('disconnect',function(){
    console.log("[ offline ]: " + socket.username + " left. :(");
    io.sockets.emit('left',{
      username:socket.username
    });
  });
});




app.use('/', reg);
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

chat(io, __dirname);
imp_passport(ls, passport, con);   // <-- implement the passport method
Route(app, express, ls, passport);     // <-- implement the routing setting


// var server = app.listen(3000, function(){
//   console.log(textFg.FgGreen, "\n[ Info ] ", textStyle.Reset, "Server is online!\n");
// })
http.listen(process.env.PORT || 3000, function(){
    console.log(textFg.FgGreen, "\n[ Info ] ", textStyle.Reset, "Server is online!\n           online at port 3000");
});
