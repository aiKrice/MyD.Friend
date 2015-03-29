/**
 * Created by Ludaa on 28/03/15.
 */
"use strict";

$(document).ready(function () {

    $("#submit-data").click(function (e) {

        var o = new Object();
        o.type = $("#data-type").val();
        o.value = $("#data-value").val();
        socket.emit(o);
        // clients.sockets.emit('history', history);
    });
    $("#submit-data").click(function (e) {
        console.log("kkk")
        e.preventDefault();

        var glycemie = $("#glycemie").val();
        var temperature = $("#temperature").val();
        var frequence = $("#frequence").val();
        $.ajax({
            url: "/history/create",
            method: "POST",
            data: {"glycemie": glycemie, "temperature": temperature, "frequence": frequence},
            dataType: "json",
            success: function () {
                console.log("Good =");
            }
        });
    });
});
