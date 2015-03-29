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
var Mailgun = require('mailgun-js'),
    fs = require('fs');
var io = require('socket.io');

/* GET history page. */
router.get('/', function (req, res, next) {
    res.render('history', {title: 'Landing community page'});
});

/* GET history graph page. */
router.get('/graph', function (req, res, next) {
    History.getDatas(function (points) {
        res.render('graph', {
            history: JSON.stringify(points) // Pass current state to client side
        });
    });
});

/* GET history page. */
router.get('/create', function (req, res, next) {
    History.getDatas(function (points) {
        res.render('history', {
            history: JSON.stringify(points) // Pass current state to client side
        });
    });
});

/* POST history. */
router.post('/create', function (req, res, next) {
    if (parseInt(req.body.glycemie, 10) > 10) {
        setTimeout(function () {

            var api_key = 'key-4fa91a6168a7cb1b50bf3d56640789c9';

            var domain = 'sandbox3fe0d2ae3766434586acb2d64b19c437.mailgun.org';

            var from_who = 'contact@mydpartner.com';

            var path = require("path");
            var fp = path.join(__dirname, '/../../public/images/report.png');
            //Settings
            var mailgun = new Mailgun({apiKey: api_key, domain: domain});

            var data = {
                from: from_who,
                to: "ludovic.zamord@gmail.com",
                subject: 'Anomalie détectée',
                text: 'Content',
                attachment: fp
            };

            //Sending the email with attachment
            mailgun.messages().send(data, function (error, body) {
                if (error) {
                    console.log(error);
                    res.render('error', {error: error});
                }
                else {
                    res.send();
                    console.log("attachment sent", fp);
                }
            });
        }, 2);
    }
    else {
        var data = req.body.type,
            value = req.body.value;

        // Construct a new history object
        var history = {
            type: data,
            value: value
        };
        // Create a new model instance with our object
        //var historyEntry = new History(history);
        //
        //// Save 'er to the database
        //historyEntry.save(function (err) {
        //    if (!err) {
        //        // If everything is cool, socket.io emits the history data.
        //        clients.sockets.emit('history', req.body);
        //    }
        //    log(err);
        //});


        //clients.sockets.emit('history', req.body);
    }
});


module.exports = router;
