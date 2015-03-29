#!/usr/bin/env node

/**
 * Created by Ludaa on 27/03/15.
 */
/*jslint node:true */
"use strict";

//var app = require('express').createServer(),
//    io = require('socket.io')(app),
//    path = require('path'),
//    favicon = require('serve-favicon'),
//    logger = require('morgan'),
//    cookieParser = require('cookie-parser'),
//    bodyParser = require('body-parser'),
//    serveStatic = require('serve-static'),
//    http = require('http');

//var app = express.createServer();

// view engine setup
//app.set('views', path.join(__dirname, 'views'));
//app.set('view engine', 'jade');

// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
//app.use(logger('dev'));
//app.use(bodyParser.json());
//app.use(bodyParser.urlencoded({extended: false}));
//app.use(cookieParser());
//app.use(serveStatic('public/static', {'index': ['default.html', 'default.htm']}));
//app.use(express.static(path.join(__dirname, 'public')));

// Load routes
//require('./config/routes')(app);

//module.exports = app;


/**
 * Get port from environment and store in Express.
 */

//var port = '3000';
//app.set('port', port);
//app.listen(app.get('port'));

//var server = app.listen(app.get('port'), function () {
//    if (server) {
//        log(null, 'Express server listening on port '.green + server.address().port);
//        // connect websockets
//        return sockets(server);
//    }
//    log("Express server not connected");
//});


var express = require('express'),
    app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io')(server);


var path = require('path'),
    favicon = require('serve-favicon'),
    logger = require('morgan'),
    cookieParser = require('cookie-parser'),
    bodyParser = require('body-parser'),
    serveStatic = require('serve-static'),
    History = require('./models/History'),
    Mailgun = require('mailgun-js');

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use(serveStatic('public/static', {'index': ['default.html', 'default.htm']}));
app.use(express.static(path.join(__dirname, 'public')));

server.listen(3000);

//require('./config/routes')(app);

/* GET history page. */
app.get('/', function (req, res, next) {
    res.render('history', {title: 'Landing community page'});
});

/* GET history graph page. */
app.get('/history/graph', function (req, res, next) {
    res.render('graph');
});

/* GET history page. */
app.get('/history/create', function (req, res, next) {
    res.render('history', {
        history: JSON.stringify(points) // Pass current state to client side
    });
});

/* POST history. */
app.post('/history/create', function (req, res, next) {

    if (parseInt(req.body.glycemie, 10) >= 10) {
        setTimeout(function () {

            var api_key = 'key-4fa91a6168a7cb1b50bf3d56640789c9';

            var domain = 'sandbox3fe0d2ae3766434586acb2d64b19c437.mailgun.org';

            var from_who = 'contact@mydpartner.com';

            var path = require("path");
            var fp = path.join(__dirname, '/public/images/report.png');
            //Settings
            var mailgun = new Mailgun({apiKey: api_key, domain: domain});

            var data = {
                from: from_who,
                to: "ludovic.zamord@gmail.com",
                subject: 'Anomalie détectée',
                text: 'Christopher a décider de partager avec vous son rapport diabetique car une anomalie a été detecté avec un taux de 10mg de sucre par litre de sang.' +
                'N\'hesitez pas a prendre contact avec votre filleul si besoin.',
                attachment: fp
            };
            //Sending the email with attachment
            mailgun.messages().send(data, function (error, body) {
                console.log("apres sending");
                if (error) {
                    console.log("HERE");
                    console.log(error);
                    res.render('error', {error: error});
                }
                else {

                    console.log("attachment sent", fp);
                    res.send();
                }
            });
        }, 20);
    }
    else {
        var data = req.body.type,
            value = req.body.value;


        // Construct a new history object
        var history = {
            type: data,
            value: value
        };
    }
    io.emit('history', req.body);
});


//app.use('/history', history);


//app.get('/', function (req, res) {
//    res.send('OK');
//});
//
//io.on('connection', function (socket) {
//    socket.emit('news', { hello: 'world' });
//    socket.on('my other event', function (data) {
//        console.log(data);
//    });
//});