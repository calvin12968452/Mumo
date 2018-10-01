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
  // app.get('/', function(req, res){    // <-- home page
  //   res.render('HomeScreen', { root: __dirname, google_user: ls.get('google_user'), fb_user: ls.get('fb_user') });
  //   ls.set('google_user', null);
  //   ls.set('fb_user', null);
  // });
  app.get('/', function(req, res) {  //當連線到跟目錄的時候跳出以下訊息
    res.sendFile('D:/文件/Mumo/yp/homepage.html');
  });

  app.get('/profile',function(req, res){
    res.sendFile('D:/文件/Mumo/fuckthisshit/ras 2/index.html');
  });

  // app.get('/profile', function(req, res){   // <-- logined page
  //   res.render('component\\profile.ejs', { google_user: ls.get('google_user'), fb_user: ls.get('fb_user') });
  // });

  //route
  app.get('/normal',function(req, res){
    res.sendFile('D:/文件/Mumo/template/normal/normal.html');
  });

  app.get('/vendor',function(req, res){
    res.sendFile('D:/文件/Mumo/yp/vendor.html');
  });

  app.get('/signup',function(req, res){
    res.sendFile('D:/文件/Mumo/yp/signup.html');
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
