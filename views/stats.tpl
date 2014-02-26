{% extends "base.html" %}

{% block extrahead %}
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
{% endblock extrahead %}

{% block content %}
			<div class="row clearfix">
				<div class="col-md-12 column">
                <img class="img-circle" src="/assets/img/mty.png">
                <img class="img-circle" src="holder.js/90x90">
                <img class="img-circle" src="holder.js/90x90">
                <img class="img-circle" src="holder.js/90x90">
                <img class="img-circle" src="holder.js/90x90">
				</div>
				
				<div class="col-md-12 column">

                    <h3>
                        Promedios por municipio
                    </h3>

                    <div id="chart1"></div>

				</div>
			</div>
{% endblock content %}

{% block scripts %}
<script type="text/javascript">
$(function () {
		Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
		    return {
		        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
		        stops: [
		            [0, color],
		            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
		        ]
		    };
		});
		
        $('#chart1').highcharts({
            chart: {
            },
            title: {
                text: null
            },
            credits: {
                enabled: false
            },
            xAxis: {
                categories: ['Monterrey', 'Juárez', 'García']
            },
            tooltip: {
                formatter: function() {
                    var s;
                    if (this.point.name) {
                        s = ''+
                            this.point.name +': '+ this.y;
                    } else {
                        s = ''+
                            this.x  +': '+ this.y;
                    }
                    return s;
                }
            },
            labels: {
                items: [{
                    html: 'Totales',
                    style: {
                        left: '40px',
                        top: '8px',
                        color: 'black'
                    }
                }]
            },
            series: [{
                type: 'column',
                name: 'Transparencia',
                data: [3, 2, 1]
            }, {
                type: 'column',
                name: 'Seguridad',
                data: [2, 3, 5]
            }, {
                type: 'column',
                name: 'Espacios públicos',
                data: [4, 3, 3]
            }, {
                type: 'spline',
                name: 'Promedios',
                data: [3, 2.66, 3],
                marker: {
                    lineWidth: 2,
                    lineColor: Highcharts.getOptions().colors[3],
                    fillColor: 'white'
                }
            }, {
                type: 'pie',
                name: 'Totales',
                data: [{
                    name: 'Monterrey',
                    y: 9,
                    color: Highcharts.getOptions().colors[3]
                }, {
                    name: 'Juárez',
                    y: 8,
                    color: Highcharts.getOptions().colors[4]
                }, {
                    name: 'García',
                    y: 9,
                    color: Highcharts.getOptions().colors[5] 
                }],
                center: [40, 55],
                size: 100,
                showInLegend: false,
                dataLabels: {
                    enabled: false
                }
            }]
        });

    });
</script>
{% endblock scripts %}
