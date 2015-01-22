var express = require('express');
var app = express();
var server = require('http').createServer(app);
var path = require('path');
var fs = require('fs');
var url = require('url');
var bodyParser = require('body-parser');
var port = process.env.PORT || 3000

var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/stopAIDSapp');
var db = mongoose.connection;
mongoose.set('debug', true);
var Question = require('./models/Question');
var question;
question = new Question({boby: 'I am the first question'});
question2 = new Question({boby: 'I am the second question'})
question.save()
question2.save()


app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.set('views', __dirname + '/../frontend/public');
app.set('view engine', 'html');
app.engine('html', require('ejs').renderFile);
app.use(express.static(path.join(__dirname + "./../frontend/public")));


Question.findOne({"boby" : "I am the second question"}, function(err, theQuestion){
	if(err) return console.log(err);
	console.log("success", theQuestion)
})

db.on('error', console.error.bind(console, 'connection error:'));
db.once('open', function (callback) {
  console.log('The database is connected!')
});


app.get('/', function(req, res) {
  res.render('index.html');
});


app.get('/questions', function(req, res){
	res.render('questions.html')
});


server.listen(port, function() {
  console.log('Im an express server listening at port',port);
});

