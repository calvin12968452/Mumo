var mysql = require('mysql');

var DB_NAME = 'mumo';

var pool  = mysql.createPool({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : "mumo",
    server   : "localhost\\SQLEXPRESS"  //這邊要注意一下!!
});

function User(user){
    this.username = user.username;
    this.userpass = user.userpass;
    this.userrepass = user.userrepass;
    this.useremail = user.useremail;
    this.usergender = user.usergemder;
};

User.prototype.save = function save(callback) {
    var user = {
        username: this.username,
        userpass: this.userpass,
        userrepass: this.userpass,
        useremail: this.useremail,
        usergender: this.usergender
    };

    var cmd = "INSERT INTO user(uid, account, password, repassword, gender, info, popval, money) VALUES(0,?,?,?,0,0,0,0)";

    connection.query(cmd, [user.username, user.userpass, user.userrepass, user.useremail, user.usergender], function (err,result) {
        if (err) {
            return;
        }

        connection.release();
        callback(err,result);                     
    });       
};
