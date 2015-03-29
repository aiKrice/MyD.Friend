/**
 * Created by Ludaa on 28/03/15.
 */
/*jslint node:true */
"use strict";

var io = require('socket.io'),
    log = require('log'),
    keymirror = require('keymirror'),
    History = require('../models/History');

var singleton = module.exports = function sockets(server) {
    if (singleton.sockets) {
        return;
    }

    var ws = io.listen(server);
    singleton.sockets = ws.sockets;




    ws.on('connection', function (socket) {
        //var datas = History.getDatas(function (datas) {
        //    var result = {};
        //    var Obj = datas.reduce(function (prev, current, index) {
        //        var id = current["_id"];
        //        prev[id] = current;
        //        return prev;
        //    }, result);
        //    socket.emit('historyDatas', Obj);
        //});

        var types = History.findByType("glycemie",function (types) {
            var result = {};
            var obj = types.reduce(function (prev, current, index) {
                var id = "id_" + index;
                prev[id] = current;
                return prev;
            }, result);
            socket.emit('historyDatas', obj);
        });
        var types = History.findByType("fc",function (types) {
            var result = {};
            var typesObj = types.reduce(function (prev, current, index) {
                var id = "id_" + index;
                prev[id] = current;
                return prev;
            }, result);
            socket.emit('historyDatas', typesObj);
        });
        var types = History.findByType("temp",function (types) {
            var result = {};
            var typesObj = types.reduce(function (prev, current, index) {
                var id = "id_" + index;
                prev[id] = current;
                return prev;
            }, result);
            socket.emit('historyDatas', typesObj);
        });
    });
    log(null, 'Websocket connection established.'.green);
};
