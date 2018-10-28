var fs = require('fs');
const Base64 = require('js-base64').Base64;

// {
//     "chat log":[{
//             "user":"KW",
//             "msg":"444+",
//             "photo":"4944",
//             "vocal":"6595+",
//             "video":"58464",
//             "file":"54855",
//             "time":"648646",
//             "other data":"4684654"
//         },{
//             "user":"MJ",
//             "msg":"444+",
//             "photo":"4944",
//             "vocal":"6595+",
//             "video":"58464",
//             "file":"54855",
//             "time":"648646",
//             "other data":"4684654"
//         }
//     ]

// }

module.exports = function(user_A, user_B, root_dir, callback){
	const dir = root_dir + "/chat_log/";
	const fileType = ".json";
	var filename = Base64.encode(user_A) + Base64.encode(user_B) + fileType;
	console.log("get from filename : " + filename);

	fs.readFile(dir + filename, 'utf8', function(err, data){
		if(err){
			filename = Base64.encode(user_B) + Base64.encode(user_A) + fileType;
			console.log("get from filename : " + filename);
			fs.readFile(dir + filename, 'utf8', function(err, data){
				if(err) callback("");
				callback(data);
			});
		}else{
			callback(data);
		}
	});
}