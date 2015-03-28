/**
 * Created by Ludaa on 27/03/15.
 */
/*jslint node:true */
"use strict";

var express = require('express');
var router = express.Router();

/* GET landing product page. */
router.get('/', function(req, res, next) {
    res.render('landing-product', { title: 'Landing product page' });
});

module.exports = router;
