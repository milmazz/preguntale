{% extends "base.html" %}

{% block extrahead %}
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharts.com/modules/exporting.js"></script>
	<style>
	#chart {min-width: 200px; height: 200px}
	</style>
{% endblock extrahead %}

{% block content %}
			<div class="row clearfix">
				<div class="col-md-6 column">
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
				<div id="chart" class="col-md-6 column"></div>
				<div class="col-md-12 column">
					<ul class="nav nav-tabs">
					  <li class="active"><a href="/people">Preguntas</a></li>
					  <li><a href="/stats/major">Estadísticas</a></li>
					</ul>

					<div class="col-md-10 column">
						<h3>
							<a href="/question">¿Por qué aún no se ejecuta el plan integral para promoción de ciclovías?</a>
						</h3>
						
						<p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500...</p>
						<p>
							<img class="img-circle" src="holder.js/45x45"> <a href="#">Pedro Perez</a>
							<span class="glyphicon glyphicon-arrow-right"></span>
							<img class="img-circle" src="/assets/img/mty-small.png"> <a href="#">Margarita Arellanes</a> de MTY
						</p>
					</div>
					<div class="col-md-2 column">
						<p><small>40 personas apoyan esto, se necesitan 60 votos más.</small></p>
						<div class="progress">
						  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
						    <span class="sr-only">40% Completado</span>
						  </div>
						</div>
						<p>
						
							<button type="button" class="btn btn-primary">¡Apoya esta pregunta!</button>
						</p>
					</div>
					
					<hr>

					<div class="col-md-10 column">
						<h3>
							<a href="/question">¿Por qué no promulgar una ley que promueva la accesibilidad física a personas con discapacidad?</a>
						</h3>
						
						<p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500...</p>

						<p>
							<img class="img-circle" src="holder.js/45x45"> <a href="#">Pedro Perez</a>
							<span class="glyphicon glyphicon-arrow-right"></span>
							<img class="img-circle" src="/assets/img/mty-small.png"> <a href="#">Margarita Arellanes</a> de MTY
						</p>
					</div>
					<div class="col-md-2 column">
						<p><small>98 personas apoyan esto, se necesitan 2 votos más.</small></p>
						<div class="progress">
						  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100" style="width: 98%">
						    <span class="sr-only">98% Completado</span>
						  </div>
						</div>
						<p>
							<button type="button" class="btn btn-primary">¡Apoya esta pregunta!</button>
						</p>
					</div>
					<hr>
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
        $('#chart').highcharts({
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
                    ['No atendidas', 189],
                    ['Atendidas', 157]
                ]
            }]
        });
    });
</script>
{% endblock scripts %}