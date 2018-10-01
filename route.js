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

  // ====================================
  // set the route ======================
  // ====================================
  app.get('/', function(req, res) {  //當連線到跟目錄的時候跳出以下訊息
    res.sendFile(__dirname + '/template/homepage/homepage.html');
  });

  app.get('/ac',function(req, res){
    res.sendFile(__dirname + '/template/userpages/ac.html');
  });

  app.get('/profile',function(req, res){
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

  app.get('/chat',function(req, res){
    res.sendFile(__dirname + '/template/userpages/chatroom.html');
  });

  // google login route
  app.get('/oauth', passport.authenticate('google_token', {scope : ['profile', 'email']}));

  // google login successfully then callback to the route
  app.get('/oauth/callback', passport.authenticate('google_token', {successRedirect: '/profile', failureRedirect: '/'}));

  // fb login route
  app.get('/fb', passport.authenticate('fb_token', { authType: 'rerequest', scope: ['user_friends', 'manage_pages'] }));

  // fb login successfully then callback to the route
  app.get('/fb/callback', passport.authenticate('fb_token', {successRedirect: '/profile', failureRedirect: '/'}));
}
