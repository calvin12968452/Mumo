var fs = require('fs');
const Base64 = require('js-base64').Base64;
const createFiles = require('./createFiles.js');

module.exports = function(user_A, user_B, msg, root_dir){

	const dir = root_dir + "/chat_log/";

	const filename = createFiles(Base64.encode(user_A), Base64.encode(user_B), dir);
	console.log("save to filename : " + filename);

    fs.readFile(filename, 'utf8', function(err, data){
	    if(err){
	    	console.log(err);
	    }else{
	    	try{
	    		var result = JSON.parse(data);
		    	console.log("saved msg : " + data.toString());
			    result.chat_log.push({
			        "user":user_A,
			        "msg":msg,
			        "photo":"",
			        "vocal":"",
			        "video":"",
			        "file":"",
			        "time":"",
			        "other data":"",
			    });
			    var json = JSON.stringify(result);
			    console.log("new saved msg : " + json);
			    fs.writeFile(filename, json, 'utf8', function(err, result){
			    	if(err) console.log(err);
			    });
	    	}catch(e){
	    		console.log(e);
	    		console.log(data.toString());
	    	}
		}
	});

}