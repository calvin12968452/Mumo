var express = require('express'),
    app = express(),
    router = express.Router(),
    User = require('../models/users'),
    crypto = require('crypto'),
    TITLE_REG = 'signup';

router.get('/process/submit', function(req, res) {
  res.render('reg',{title:TITLE_REG});
});

router.post('/process/submit', function(req, res) {
    var userName = req.body['user'],
        userEmail = req.body['email'],
        userPwd = req.body['psw'],
        userRePwd = req.body['psw-repeat'],     
        md5 = crypto.createHash('md5');
   
        userPwd = md5.update(userPwd).digest('hex');
  
    var newUser = new User({
        username: userName,
        userpass: userPwd,
        userrepass: userRePwd,
        useremail:  userEmail,
        usergender:  user.usergemder
    });
});
module.exports = router;