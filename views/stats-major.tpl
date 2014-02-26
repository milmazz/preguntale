{% extends "base.html" %}

{% block extrahead %}  
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
{% endblock extrahead %}

{% block content %}
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="media">
					  <a class="pull-left" href="#">
					    <img class="img-circle" src="/assets/img/mty.png">
					  </a>
					  <div class="media-body">
					    <h2 class="media-heading"><a href="#">Margarita Arellanes</a></h2>
					    <dl>
							<dt>Alcaldía:</dt>
							<dd>Monterrey</dd>
							<dt>Twitter:</dt>
							<dd><a href="https://twitter.com/marellanesc">@marellanesc</a></dd>
						</dl>
					  </div>
					</div>
				</div>
				
				<div class="col-md-12 column">
					<ul class="nav nav-tabs">
					  <li><a href="/people">Preguntas</a></li>
					  <li class="active"><a href="/stats/major">Estadísticas</a></li>
					</ul>

					<div class="col-md-6 column">
						<h3>
							Porcentaje de preguntas atendidas
						</h3>

						<div id="chart1"></div>
						
					</div>
					<div class="col-md-6 column">
						<h3>
							Avance a lo largo del tiempo
						</h3>

						<div id="chart2"></div>
					</div>
					<hr>
					<div class="col-md-6 column">
						<h3>
							Atención en el mes por categoría
						</h3>

						<div id="chart3"></div>
						
					</div>

					<div class="col-md-6 column">
						<h3>
							Distribución por categorías en el mes
						</h3>

						<div id="chart4"></div>
						
					</div>
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
		
		// Build the chart
        $('#chart1').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: null
            },
            credits: {
                enabled: false
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function() {
                            return '<strong>'+ this.point.name +'</strong>: '+ Highcharts.numberFormat(this.point.percentage, 1) +' %';
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Reportes',
                data: [
                    ['Atendidas', 157],
                    ['No atendidas', 189]
                ]
            }]
        });

        $('#chart2').highcharts({
            title: {
                text: null
            },
            credits: {
                enabled: false
            },
            xAxis: {
                categories: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
                    'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
            },
            yAxis: {
            	title: {
            		text: 'Valores'
            	},
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            legend: {
                layout: 'horizontal',
                align: 'center',
                verticalAlign: 'bottom',
                borderWidth: 0
            },
            series: [{
                name: 'No atendidas',
                data: [7, 6, 9, 14, 18, 21, 25, 26, 23, 18, 13, 9]
            }, {
                name: 'Atendidas',
                data: [5, 4, 6, 10, 15, 20, 24, 21, 20, 16, 10, 6]
            }]
        });
    
        $('#chart3').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: null
            },
            credits: {
                enabled: false
            },
            xAxis: {
                categories: ['Transparencia', 'Seguridad', 'Espacios públicos']
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Valores'
                },
                stackLabels: {
                    enabled: true,
                    style: {
                        fontWeight: 'bold',
                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                    }
                }
            },
            legend: {
                align: 'center',
                verticalAlign: 'bottom',
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
            },
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.x +'</b><br/>'+
                        this.series.name +': '+ this.y +'<br/>'+
                        'Total: '+ this.point.stackTotal;
                }
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                    dataLabels: {
                        enabled: true,
                        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                        style: {
                            textShadow: '0 0 3px black, 0 0 3px black'
                        }
                    }
                }
            },
            series: [{
                name: 'Atendidas',
                data: [5, 3, 4]
            }, {
                name: 'No atendidas',
                data: [2, 2, 3]
            }]
        });


        $('#chart4').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: null
            },
            credits: {
                enabled: false
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function() {
                            return '<strong>'+ this.point.name +'</strong>: '+ Highcharts.numberFormat(this.point.percentage, 1) +' %';
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Reportes',
                data: [
                    ['Transparencia', 7],
                    ['Seguridad', 5],
                    ['Espacios públicos', 7]
                ]
            }]
        });

    });
</script>
{% endblock scripts %}
