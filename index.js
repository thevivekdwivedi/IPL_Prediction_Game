var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var app = express();

//setup body-parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

var teams = require('./apis/teams_api');

app.use('/teams', teams);

const port = 4000;

app.listen(port, function() {
    console.log('Listening on port: ' + port);
})