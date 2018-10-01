var express = require('express');
var router = express.Router();
var TITLE_REG = 'signup';

router.get('/process/submit', function(req, res, next) {
  res.render('reg',{title:TITLE_REG});
});

router.post('/process/submit', function(req, res, next) {
    var userName = req.body.user,
        userEmail = req.body.email,
        userPwd = req.body.psw,
        userRePwd = req.body.pswrepeat;    
 
    let sql = "INSERT INTO user(account, password, repassword, gender, info, popval, money) VALUES(?,?,?,0,0,0,0)";
   
    req.con.query(sql, [userName, userEmail, userPwd, userRePwd], function (err, result) {
        if (err) throw err;
        console.log("1 record inserted");
    });
    res.send("success!");
});
module.exports = router;
