/**
 * Created by Ludaa on 28/03/15.
 */
/*jslint node:true */
"use strict";

var index = require('./routes/index'),
    history = require('./routes/history'),
    errorHandlers = require('./routes/errors');

function loadRoutes(app){
    app.use('/', index);
    app.use('/history', history);
    errorHandlers(app);
}

module.exports = loadRoutes;