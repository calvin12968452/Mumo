// ==== [TBD] ====
// 1.socket io
// 2.connect
// 3.online
// 4.msg
// 5.offline

var socket = io();
//var urlParams = new URLSearchParams(window.location.search);
//var name = urlParams.get('userName');
var localData = localStorage.getItem('userData');
localData = JSON.parse(localData);
var name = localData.userName;
var friend_name = "";
console.log(name);

function get_userID(id){
friend_name = id;
socket.emit('config', {'username' : name, 'friend_name' : friend_name});
}

function get_transmit_msg(msg){
socket.emit('msg', {'username' : name, 'friend_name' : friend_name, 'msg' : msg});
}

function empty_members(){
  del_user();
}

function append_members(list, sign){
  list.forEach(function(item, index, array){
    add_user(item, sign);
  });
}

socket.emit('online', {'username': name});
replace_friend_name(name);

socket.on('chat_logger', function(data){
reset_chat();
var msg = JSON.parse(data);
  console.log("chat log : " + msg);
var chat_length = msg.chat_log.length;
var i = 0;
  console.log("chat_length : " + chat_length);
for(i = 0 ; i < chat_length ; i++){
      if(msg.chat_log[i].user == name){
        chat_logger(0, msg.chat_log[i].msg);
      }else{
        chat_logger(1, msg.chat_log[i].msg);
      }
  }
});

socket.on('msg', function(data){
  var msg = JSON.parse(data);
  console.log("msg user : " + msg.chat_log[0].user);
  console.log("name : " + name);
  console.log("friend_name : " + friend_name);
  if(msg.chat_log[0].user != name) { add_receive_html(msg.chat_log[0].msg); } 
});

socket.on('online',function(data){
  var username = data.username, i = 0;
  var online_members = data.onlineMembers;
  var offline_members = data.offlineMembers;

  console.log("Online : " + online_members.toString());
  console.log("Offline : " + offline_members.toString());

  empty_members();

  append_members(online_members, "success");
  append_members(offline_members, "secondary");
});

socket.on('offline',function(data){
  socket.emit("disconnect", name);
});