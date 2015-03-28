/**
 * Created by Ludaa on 28/03/15.
 */
/*jslint node:true */
"use strict";

var mongoose = require('mongoose');

// Create a new schema for our History data
var schema = new mongoose.Schema({
    type: String,
    value: String,
    created_at: Date,
    updated_at: Date
});

schema.statics.getDatas = function (callback) {
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

schema.statics.findByType = function (type, callback) {
    var points = [];

    History.find({type: type}, function (err, docs) {
        // If everything is cool...
        if (!err) {
            points = docs;
        }
        // Pass them back to the specified callback
        callback(points);
    });
};

schema.pre('save', function (next) {
    var now = new Date();
    this.updated_at = now;
    if (!this.created_at) {
        this.created_at = now;
    }
    next();
});

var History = mongoose.model('History', schema);

module.exports = History;