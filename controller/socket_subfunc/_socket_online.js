module.exports = function(socket, io, dir, onlineMembers, offlineMembers){
	onlineMembers.push(socket.username);

	offlineMembers.forEach(function(item, index, array){
	  if(item == socket.username){
	  	offlineMembers.splice(index, 1);
	  }
	});
    
	console.log("Online : " + onlineMembers.toString());
	console.log("Offline : " + offlineMembers.toString());
	io.emit("online", {
        username : socket.username,
        onlineMembers : onlineMembers,
        offlineMembers : offlineMembers
    });
}