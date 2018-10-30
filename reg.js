var express = require('express');
var router = express.Router();
var TITLE_REG = 'signup';

//router.get('/process/submit', function(req, res, next) {
//  res.render('reg',{title:TITLE_REG});
//});

function insert_mysql(req, res, data){
    let sql = "INSERT INTO user(account, userName, userEmail, password, repassword, gender, info, popval, money) VALUES(?,?,?,?,?,?,?,0,0)";
   
    try{
        req.con.query(sql, data, function (err, result) {
            if (err) {console.log(err);}
            console.log("1 record inserted");
            res.sendFile('/template/userpages/ac.html', {root : __dirname});
        });
    }catch(e){
        console.log(e);
    }
}

router.get('/submit', function(req, res, next) {
    var userAccount = req.query.id,
        userName = req.query.name,
        gender = req.query.gender,                  // not used yet
        constellation = req.query.constellation,    // not used yet
        birth = req.query.birth,                    // not used yet
        country = req.query.country,                // not used yet
        city = req.query.city,                      // not used yet
        userEmail = req.query.email,
        userPwd = req.query.pw,
        userRePwd = req.query.pwdretype;
    var info = {
        info : []
    }
    info.info.push({
        "constellation":constellation,
        "birth":birth,
        "country":country,
        "city":city
    });
    var Info = JSON.stringify(info);

    let sql_search = "SELECT * FROM user WHERE userName=? AND password=?";
    req.con.query(sql_search, [userName, userPwd], function(err, result){
      if (err) {console.log(err);}
      console.log(result);
      if(result.length == 0){
        insert_mysql(req, res, [userAccount,userName, userEmail, userPwd, userRePwd, gender, Info]);
      }else{
        res.send("You have been signed up before.");
      }
    });
});
module.exports = router;
