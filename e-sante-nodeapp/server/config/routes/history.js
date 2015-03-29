/**
 * Created by Ludaa on 27/03/15.
 */
/*jslint node:true */
"use strict";

var express = require('express');
var router = express.Router();
var log = require('log');
var History = require('../../models/History');
var clients = require('../../services/sockets');
var nodemailer = require('nodemailer'),
    fs = require('fs');

/* GET history page. */
router.get('/', function (req, res, next) {
    res.render('history', {title: 'Landing community page'});
});

/* GET history page. */
router.get('/create', function (req, res, next) {
    History.getDatas(function (points) {
        res.render('history', {
            history: JSON.stringify(points) // Pass current state to client side
        });
    });
});

/* GET history update data */
router.get('/get-data', function (req, res, next) {
    History.getDatas(function (points) {
        res.render('history', {
            history: JSON.stringify(points) // Pass current state to client side
        });
    });
});

/* GET history graph page. */
router.get('/graph', function (req, res, next) {
    History.getDatas(function (points) {
        res.render('graph', {
            history: JSON.stringify(points) // Pass current state to client side
        });
    });
});

/* POST history. */

router.post('/create', function (req, res, next) {
    var data = req.body.type,
        value = req.body.value;

    // Construct a new history object
    var history = {
        type: data,
        value: value
    };

    if (parseInt(req.body.glycemie, 10) > 10) {
        getReportContent();
    }

    // Create a new model instance with our object
    var historyEntry = new History(history);

    // Save 'er to the database
    historyEntry.save(function (err) {
        if (!err) {
            // If everything is cool, socket.io emits the history data.
            clients.sockets.emit('history', req.body);
        }
        log(err);
    });
});





function getReportContent() {
    console.log("Getting report content");
    fs.readFile("/images/report.png", function (err, data) {
        sendIt(data);
    });
}

function sendIt(data){
    // create reusable transporter object using SMTP transport
    var transporter = nodemailer.createTransport({
        service: 'Gmail',

    });

    // NB! No need to recreate the transporter object. You can use
    // the same transporter object for all e-mails

    // setup e-mail data with unicode symbols
    var mailOptions = {
        from: 'Fred Foo ✔ <test@super.com>', // sender address
        to: 'ludaavitch@gmail.com', // list of receivers
        subject: 'Hello ✔', // Subject line
        text: 'Hello world ✔', // plaintext body
        html: '<b>Hello world ✔</b>', // html body
        attachments: [{'filename': 'report.png', 'contents': data}]
    };
    console.log("Will send mail");
    // send mail with defined transport object
    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Message sent: ' + info.response);
        }
    });
}


module.exports = router;
