var fs = require('fs');

module.exports = function(user_A, user_B, dir){

	const fileType = ".json";
	var filename = user_A + user_B + fileType;
	var fd = dir + filename;
	var filename2 = user_B + user_A + fileType;
	var fd2 = dir + filename2;
	var file = "";

	var result = {
        chat_log:[]
    };
    var json = JSON.stringify(result);

	if(fs.existsSync(fd) != true && fs.existsSync(fd2) != true){
		fs.writeFile(fd, json, 'utf8', function(err, result){
			if(err) console.log(err);
		});
	    file = fd;
	}else{
		if(fs.existsSync(fd) == true){ file = fd; }
		else{ file = fd2; }
	}
	return file;
}