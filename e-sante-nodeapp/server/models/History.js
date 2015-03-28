/**
 * Created by Ludaa on 28/03/15.
 */
/*jslint node:true */
"use strict";

var mongoose = require('mongoose');

// Create a new schema for our History data
var schema = new mongoose.Schema({
    value: String
});

schema.statics.getPoints = function (callback) {
    var points = [];

    History.find(function (err, docs) {
        // If everything is cool...
        if (!err) {
            points = docs;
        }
        // Pass them back to the specified callback
        callback(points);
    });
};

var History = mongoose.model('History', schema);

module.exports = History;