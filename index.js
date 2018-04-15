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
var users = require('./apis/users_api');
var userCreds = require('./apis/userCreds_api');
var roster = require('./apis/roster_api');
var bids = require('./apis/bids_api');

app.use('/teams', teams);
app.use('/users', users);
app.use('/userCreds', userCreds);
app.use('/roster', roster);
app.use('/bids', bids);

const port = 4000;

app.listen(port, function() {
    console.log('Listening on port: ' + port);
})