var onlineMembers = [];
var offlineMembers = [];

const _socket_online = require('./socket_subfunc/_socket_online.js');
const _socket_offline = require('./socket_subfunc/_socket_offline.js');
const _socket_msg = require('./socket_subfunc/_socket_msg.js');
const get_log = require('./get_log.js');

module.exports = function(io, dir){

	io.on('connection', (socket) => {
	 
	 	socket.on("online", function(data){
	 		socket.username = data.username;
	 		_socket_online(socket, io, dir, onlineMembers, offlineMembers);
	 	});

	 	socket.on('config', function(data){
	 		socket.friend_name = data.friend_name;
	 		socket.username = data.username;
			get_log(socket.username, socket.friend_name, dir, function(data){
			    if(data != "" && data != undefined){
			        var result = JSON.parse(data);
			        console.log(result);
			        io.emit("chat_logger", data);
			    }
			});
	 	});

	 	socket.on("msg", function(data){
	 		socket.friend_name = data.friend_name;
	 		socket.username = data.username;
	 		_socket_msg(socket, io, data.msg, dir);
	 	});
	 
	 	socket.on('disconnect', function(){
	 		_socket_offline(socket, io, onlineMembers, offlineMembers);
	 	});
	});
	
}