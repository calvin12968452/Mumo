var express = require('express');
var router = express.Router();
var TITLE_REG = 'signup';

//router.get('/process/submit', function(req, res, next) {
//  res.render('reg',{title:TITLE_REG});
//});

router.get('/process/submit', function(req, res, next) {
    var userAccount = req.query.id,
        userName = req.query.name,
        userEmail = req.query.email,
        userPwd = req.query.pw,
        userRePwd = req.query.pwdretype;    
 
    let sql = "INSERT INTO user(account,userName, userEmail, password, repassword, gender, info, popval, money) VALUES(?,?,?,?,?,0,0,0,0)";
   
    req.con.query(sql, [userAccount,userName, userEmail, userPwd, userRePwd], function (err, result) {
        if (err) throw err;
        console.log("1 record inserted");
    });
    res.send("success!");
});
module.exports = router;
