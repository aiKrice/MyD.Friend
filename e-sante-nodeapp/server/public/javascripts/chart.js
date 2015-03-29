
    $(document).ready(function () {
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                defaultSeriesType: 'line'
            },
            xAxis: {},
            yAxis: {
                min: 0,
                height: 200
            },
            exporting: {enabled: false},
            credits : {enabled:false},
            legend: {
                //align: 'left',
                //verticalAlign: 'top',
                //floating: true,
                layout: 'vertical',
                backgroundColor: '#FFFFFF',
                lineHeight : 10,
                style: {
                    left: '100px',
                    bottom: 'auto'
                }
            },
            title:{
                text:''
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.series.name + '</b><br/>' +
                        this.x + ': ' + this.y;
                }
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        formatter: function () {
                            return ( this.series.hideDataLabels ) ? '' : this.y;
                        }
                    }
                }
            },
            series: [{
                data: [6, 7, 2, 2.5, 3, 3.5, 4, 4.5, 6, 7,2, 2.5],
                name:"Glycemie"

            }, {
                data:[37.5,37.5,37.5,37.5,37.5,38.5,37.5,37.5,36.5,37.5,37,37.5],
                name:"Temperature"
            },{
                data:[70,66,86,66,66,66,76,66,66,66,60,66],
                name:"Frequence cardiaque"
            }]
        }, function (chart) {
            chart.series[0].hideDataLabels = false;
        });

        socket.on('history', function (data) {
            console.log(data.glycemie);
            var x = (new Date()).getTime(), // current time
                glycemie = parseInt(data.glycemie,10);
                temperature = parseInt(data.temperature,10);
                frequence = parseInt(data.frequence,10);

            chart.series[0].addPoint(glycemie, true, true, true);
            chart.series[1].addPoint(temperature, true, true, true);
            chart.series[2].addPoint(frequence, true, true, true);

            //chart.redraw();
        });

       /* socket.on('historyDatas', function (datas) {
            var x = (new Date()).getTime()
            for (var data in datas) {

                var value = datas[data].value;

                if (value) {
                    chart.series[0].addPoint(value, false, false);
                }
            }
        });*/
    });

