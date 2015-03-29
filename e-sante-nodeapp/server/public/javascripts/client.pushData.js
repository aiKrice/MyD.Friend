/**
 * Created by Ludaa on 28/03/15.
 */
"use strict";

$(document).ready(function () {
    $("#submit-data").click(function (e) {
        e.preventDefault();
        var glycemie = $("#glycemie").val();
        var temperature = $("#temperature").val();
        var frequence = $("#frequence").val();
        $.ajax({
            url: "/history/create",
            method: "POST",
            data: {"glycemie": glycemie, "temperature": temperature, "frequence": frequence},
            dataType: "json"
        });
    });

    $("#pair").click(function (e) {
        e.preventDefault();
        console.log('In pairing');
        $.ajax({
            url: "/history/create",
            method: "POST",
            data: {},
            dataType: "json"
        });
    });
});
