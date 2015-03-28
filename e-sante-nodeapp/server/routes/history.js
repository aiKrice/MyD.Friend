/**
 * Created by Ludaa on 27/03/15.
 */
/*jslint node:true */
"use strict";

var express = require('express');
var router = express.Router();

/* GET history page. */
router.get('/', function (req, res, next) {
    res.render('history', {title: 'Landing community page'});
});

/* GET history page. */
router.get('/show', function (req, res, next) {
    res.render('history', {title: 'Landing community page'});
});
module.exports = router;
