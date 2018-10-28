const save_log = require('../save_log.js');

module.exports = function(socket, io, msg, dir){
	var result = {
        chat_log:[]
    };
    result.chat_log.push({
        "user":socket.username,
        "msg":msg,
        "photo":"",
        "vocal":"",
        "video":"",
        "file":"",
        "time":"",
        "other data":"",
    });
    var json = JSON.stringify(result);
    io.emit("msg", json);
    save_log(socket.username, socket.friend_name, msg, dir);
    console.log("transmitted msg : " + json);
}