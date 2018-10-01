const {
  textStyle,
  textFg,
  textBg
} = require('../module/color.js');

module.exports = function(io){

  //當新的使用者連接進來的時候
  io.sockets.on('connection', function(socket){

    //新user
    socket.on('new',function(msg){
        socket.username = msg;
        console.log(textFg.FgGreen, "\n[ chatroom ] - New User : ", textStyle.Reset, msg);
        io.emit('add',{
            username: socket.username
        });
    });

    //監聽新訊息事件
    socket.on('sendMsg', function(msg){

        console.log(textFg.FgGreen, "\n[ chatroom ] - " + socket.username + " : ", textStyle.Reset, msg);

          //發佈新訊息
        io.emit('getMsg', {
            username:socket.username,
            msg:msg
        });
    });

    //left
    socket.on('disconnect',function(){
        console.log(socket.username+" left.");
        console.log(textFg.FgGreen, "\n[ chatroom ] - " + socket.username + " : ", textStyle.Reset, " left.");
        io.emit('left',{
            username:socket.username
        });
    });

  });
}
