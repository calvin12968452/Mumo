const express = require('express');
const passport = require('passport');
var app = express();
var http = require("http").Server(app);
var io = require('socket.io')(http);
var ls = require('local-storage');    // <-- local storage, can be changed to your database. hint : mongoose
// useage：ls.get('ls-name')

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
var chat = require('./controller/chatroom.js');

chat(io);
imp_passport(ls, passport);   // <-- implement the passport method
Route(app, express, ls, passport);     // <-- implement the routing setting


// var server = app.listen(3000, function(){
//   console.log(textFg.FgGreen, "\n[ Info ] ", textStyle.Reset, "Server is online!\n");
// })
http.listen(process.env.PORT || 3000, function(){
    console.log(textFg.FgGreen, "\n[ Info ] ", textStyle.Reset, "Server is online!\n online at port 3000");
});
