var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
    res.sendFile(__dirname + '/chatroom.html');
});

//當新的使用者連接進來的時候
io.on('connection', function(socket){

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

//指定port
http.listen(process.env.PORT || 3000, function(){
    console.log('listening on *:3000');
});