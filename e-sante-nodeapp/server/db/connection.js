/**
 * Created by Ludaa on 28/03/15.
 */
/*jslint node:true */
"use strict";

var mongoose = require('mongoose'),
    log = require('log');
require('colors');

var db_uri = 'mongodb://localhost/e_sante';

mongoose.connect(db_uri);

var db = mongoose.connection;

db.on('error', function(){
    log("Could not connect to mongo".red)
});

module.exports = {
    connect: function (ready) {
        if (ready) {
            db.on('open', ready);
        }
    },

    disconnect: function (disconnected) {
        mongoose.disconnect(disconnected);
    }
};
