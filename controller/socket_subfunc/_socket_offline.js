module.exports = function(socket, io, onlineMembers, offlineMembers){
	if(socket.username != undefined){
		offlineMembers.push(socket.username);
    	console.log(socket.username);
	}
    onlineMembers.forEach(function(item, index, array){
	  if(item == socket.username){
	  	onlineMembers.splice(index, 1);
	  }
	});
	console.log("Online : " + onlineMembers.toString());
	console.log("Offline : " + offlineMembers.toString());

	io.emit("offline", socket.username);
}