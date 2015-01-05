var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
  res.render('index', { title: 'Musik Online' });
});

router.get('/songs', function(req, res) {
  res.set('Content-Type', 'application/json');
  res.send({"songs": [
    {"name": "Fix You", "singer": "Cold Play"},
    {"name": "Blank Space", "singer": "Taylor Swift"},
    {"name": "Because of You", "singer": "Kelly Clarkson"}
  ]
  });
});

router.get('/mysongs', function(req, res) {
  res.render('mysongs', {title: 'My favorite song',songs: [
    {"name": "Fix You", "singer": "Cold Play"},
    {"name": "Blank Space", "singer": "Taylor Swift"},
    {"name": "Because of You", "singer": "Kelly Clarkson"}
  ]});
});

module.exports = router;
