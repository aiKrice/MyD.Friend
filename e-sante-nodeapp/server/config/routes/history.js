/**
 * Created by Ludaa on 27/03/15.
 */
/*jslint node:true */
"use strict";

var express = require('express');
var router = express.Router();
var log = require('log');
var History = require('../../models/History');

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

    // Create a new model instance with our object
    var historyEntry = new History(history);

    // Save 'er to the database
    historyEntry.save(function(err) {
        if (!err) {
            // If everything is cool, socket.io emits the tweet.
            return io.emit('history', history);
        }
        log(err);
    });
});

module.exports = router;
