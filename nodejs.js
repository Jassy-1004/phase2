const express = require('express');
const app = express();
const url = require('url');

app.use('', express.static(__dirname + '/public'));
app.use(express.urlencoded({extended:true}));

app.set('view engine', 'ejs');


//user side 
// need
// dont forget to npm install mysql2
var mysql = require('mysql2');

// change credentials and db
global.conn = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "password0",
	database: "phase2database",
	port: 3000
});


app.get('/', function(req,res) {
	res.render('login.ejs');// shows login page 
});

app.get('/login', function(req,res) {
	res.render('login.ejs');// shows login page 
});

app.get('/aboutus', function(req,res) {
	res.render('aboutus.ejs');// shows aboutus page 
});


app.get('/contactus', function(req,res) {
	res.render('contactus.ejs');// shows contactus page 
});

app.get('/contactus_loggedin', function(req,res) {
	res.render('contactus_loggedin.ejs');// shows contactus_loggedin page 
});

app.get('/registration', function(req,res) {
	res.render('registration.ejs');// shows registration page 
});

app.get('/read', function(req,res) {
	
	var queryObject = url.parse(req.url,true).query;

	conn.connect(function(err) {
		if (err) throw err;
		conn.query(`
			SELECT 
			articles.article_id AS articleID,
			articles.title AS title,
			CONCAT(firstname, " " ,lastname) AS authors,
			articles.date AS dates,
			articles.category AS category,
			articles.lead_description AS descriptions,
			articles.body AS body
			FROM articles
			INNER JOIN user_details ON articles.author=user_details.username
			WHERE article_id=${queryObject.id};

			`, function (err, result) {
			if (err) throw err;
		res.render('read.ejs', {readArticle:result});// shows read page 
		});
	});
	return conn;
});


app.get('/user_main_loggedin', function(req,res) {
	conn.connect(function(err) {
		if (err) throw err;
		conn.query(`
			SELECT 
			articles.article_id AS articleID,
			articles.title AS title,
			CONCAT(firstname, " " ,lastname) AS authors,
			articles.date AS dates,
			articles.lead_description AS descriptions,
			articles.category AS category
			 FROM articles
			INNER JOIN user_details ON articles.author=user_details.username;
			`, function (err, result) {
			if (err) throw err;
			res.render('user_main_loggedin.ejs', {usermain:result});// shows landing page  and passes data from backend
		});
	});
	return conn;
});


//admin side 
app.get('/admin_aboutus_loggedin', function(req,res) {
	res.render('admin/admin_aboutus_loggedin.ejs');// shows admin about us page 
});

app.get('/editarticle', function(req,res) {
	res.render('admin/editarticle.ejs');// shows edit page 
});

app.get('/admin_main_loggedin', function(req,res) {
	res.render('admin/admin_main_loggedin.ejs');// shows admin landing page 
});

app.get('/myarticles', function(req,res) {
	res.render('admin/myarticles.ejs');// shows all articles written by admin
});

app.get('/upload', function(req,res) {
	res.render('admin/upload.ejs');// allows admin to upload
});

app.post('/submit_article', function(req,res) {
	var queryObject = url.parse(req.url,true).query;
	console.log(req.body);
	conn.connect(function(err) {
		if (err) throw err;
		conn.query(`
			INSERT INTO  
			articles (title, author, category, date, lead_description, body)
			VALUES
			('${req.body.headline}', '${req.body.byline}', '${req.body.category}', 
			'${req.body.datewritten}', '${req.body.lead}', '${req.body.body}');
			`, function (err, result) {
			if (err) throw err;
		});
	});	
	return conn;
});

app.get('/viewarticle', function(req,res) {
	res.render('admin/viewarticle.ejs');// views a particular thing
});

app.get('/admin', function(req,res) {
	res.render('admin/login.ejs');// views a particular thing
});

const port = '3000';

app.listen(port, function(){
  console.log("Server is running at localhost port: "+ port);
});