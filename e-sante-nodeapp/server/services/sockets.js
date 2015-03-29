/**
 * Created by Ludaa on 28/03/15.
 */
/*jslint node:true */
"use strict";

var io = require('socket.io'),
    log = require('log');

var singleton  = function sockets(server) {
    if (singleton.sockets) {
        return;
    }

    var ws = io.listen(server);
    singleton.sockets = ws.sockets;
    console.log(ws.sockets);
    log(null, 'Websocket connection established.'.green);
};

module.exports = singleton;