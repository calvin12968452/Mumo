const BodyParser = require('body-parser');
// ====================================
// colorful console in terminal =======
// ====================================
const {
  textStyle,
  textFg,
  textBg
} = require('./module/color.js');

module.exports = function(app, express, ls, passport){

  // ====================================
  // routing setting ====================
  // ====================================
  app.set('view engine','ejs');
  app.use(BodyParser.urlencoded({ extended: true }));
  app.use(BodyParser.json());
  app.use(passport.initialize());
  app.use(passport.session());

  app.use('/css',express.static('css'));
  app.use('/js',express.static('js'));

  // ====================================
  // set the route ======================
  // ====================================
  app.get('/', function(req, res) {  //當連線到  "根"   目錄的時候跳出以下訊息  不要隨意亂修改已經改好的東西
    res.sendFile(__dirname + '/template/homepage/homepage.html');
  });

  app.get('/shop', function(req, res) {
    res.sendFile(__dirname + '/template/userpages/shop.html');
  });

  app.get('/ac',function(req, res){
    res.sendFile(__dirname + '/template/userpages/ac.html');
  });

  app.get('/setting',function(req, res){
      var usrname = req.query.name;
      var id = req.query.id;
      var psw = req.query.pw;
      var gender = req.query.gender;
      var birth = req.query.birth;
      var constellation = req.query.constellation;
      var country = req.query.country;
      var city = req.query.city;
      var photo = req.query.photo;

      sql = "UPDATE user SET photo=? WHERE userName=?";
      req.con.query(sql, [photo, usrname], function(err, result){
        if (err) {console.log(err);}
        console.log(result);


        const query_string = "?name="+usrname+"&id="+id+"&pw="+psw+"&gender="+gender+
          "&birth="+birth+"&constellation="+constellation+"&country="+country+"&city="+city+"&photo="+photo;
        res.redirect('/ac'+query_string);
      });

    });

  app.get('/friends',function(req, res){
    res.sendFile(__dirname + '/template/userpages/Friends.html');
  });

  app.get('/group',function(req, res){
    res.sendFile(__dirname + '/template/userpages/group.html');
  });

  app.get('/group1',function(req, res){
    res.sendFile(__dirname + '/template/userpages/group1.html');
  });

  app.get('/Jennie',function(req, res){
    res.sendFile(__dirname + '/template/userpages/Jennie.html');
  });

  app.get('/message',function(req, res){
    res.sendFile(__dirname + '/template/userpages/message.html');
  });

  app.get('/message0',function(req, res){
    res.sendFile(__dirname + '/template/userpages/message0.html');
  });

  app.get('/news',function(req, res){
    res.sendFile(__dirname + '/template/userpages/news.html');
  });

  app.get('/question',function(req, res){
    res.sendFile(__dirname + '/template/userpages/question.html');
  });

  app.get('/coupon',function(req, res){
    res.sendFile(__dirname + '/template/userpages/coupon.html');
  });

  app.get('/userpage',function(req, res){
    res.sendFile(__dirname + '/template/userpages/userpage.html');
  });

  //route
  app.get('/normal',function(req, res){
    res.sendFile(__dirname + '/template/normal/normal.html');
  });

  app.get('/vendor',function(req, res){
    res.sendFile(__dirname + '/template/businesspage/vendor.html');
  });

  app.get('/signup',function(req, res){
    res.sendFile(__dirname + '/template/signup/signup.html');
  });

  app.get('/date',function(req, res){
    res.sendFile(__dirname + '/template/date/date.html');
  })

  app.get('/date_user',function(req, res){
    res.sendFile(__dirname + '/template/userpages/date_user/date_user.html');
  })

  app.get('/chat',function(req, res){
    res.sendFile(__dirname + '/template/userpages/chat.html');
  });

  app.get('/chatroom',function(req, res){
    res.sendFile(__dirname + '/template/userpages/chatroom.html');
  });

  app.get('/findfriend',function(req, res){
    res.sendFile(__dirname + '/template/userpages/finfriend.html');
  });


  app.get('/multichat',function(req, res){
    res.sendFile(__dirname + '/template/userpages/chatroom.html');
  });

  /*app.get('/friends',function(req, res){
    res.sendFile(__dirname + '/template/userpages/friends.html');
  });*/

  app.get('/user_vendor',function(req, res){
    res.sendFile(__dirname + '/template/businesspage/user_vendor.html');
  });

  app.get('/normal',function(req, res){
    res.sendFile(__dirname + '/template/normal/normal.html');
  });
  // google login route
  app.get('/oauth', passport.authenticate('google_token', {scope : ['profile', 'email']}));

  // google login successfully then callback to the route
  app.get('/oauth/callback', passport.authenticate('google_token', {successRedirect: '/ac', failureRedirect: '/'}));
  // successRedirect route should be /chat?userName=userName and the userName should come from passport.js
  // fb login route
  app.get('/fb', passport.authenticate('fb_token', { authType: 'rerequest', scope: ['user_friends', 'manage_pages'] }));

  // fb login successfully then callback to the route
  app.get('/fb/callback', passport.authenticate('fb_token', {successRedirect: '/ac', failureRedirect: '/'}));
  // so as to google login

  app.get('/sql_login', function(req, res, next){
    var usrname = req.query.name,
        psw = req.query.pw;
    // console.log("usrname : " + usrname);
    // console.log("psw : " + psw);

    let sql = "SELECT * FROM user WHERE userName=? AND password=?";
    req.con.query(sql, [usrname, psw], function(err, result){
      if (err) {console.log(err);}
      console.log(result);

      var info = JSON.parse(result[0].info);
      var id = result[0].account;
      var gender = result[0].gender;
      var birth = info.info[0].birth;
      var constellation = info.info[0].constellation;
      var country = info.info[0].country;
      var city = info.info[0].city;

      // console.log("id : " + res.query.id);
      // console.log("name : " + res.query.name);
      // console.log("pw : " + res.query.pw);
      // console.log("gender : " + res.query.gender);
      // console.log("birth : " + res.query.birth);
      // console.log("constellation : " + res.query.constellation);
      // console.log("country : " + res.query.country);
      // console.log("city : " + res.query.city);

      // console.log(res.query);

      // res.set({
      //   "query":{
      //     "id":result[0].account,
      //     "gender":result[0].gender,
      //     "birth":info.info[0].birth,
      //     "constellation":info.info[0].constellation,
      //     "country":info.info[0].country,
      //     "city":info.info[0].city
      //   }
      // });

      if(result.length != 0){
        // res.sendFile('/template/userpages/ac.html', {root : __dirname});
        const query_string = "?name="+usrname+"&id="+id+"&pw="+psw+"&gender="+gender+
          "&birth="+birth+"&constellation="+constellation+"&country="+country+"&city="+city;
        res.redirect('/ac'+query_string);
      }else{
        res.send("You haven't signed up yet. Please sign up first!");
      }
    });
  });

}
