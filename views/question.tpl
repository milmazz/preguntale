{% extends "base.html" %}

{% block extrahead %}
  <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
{% endblock extrahead %}

{% block title %}Preguntas{% endblock %}

{% block content %}
      <div class="row clearfix">
        <div class="col-md-12 column">
          <p>
            <span class="badge">Para:</span>
            <a href="/people">
                <img class="img-circle" src="/assets/img/mty-small.png">
             </a>
             <a href="/people">Margarita Arellanes</a>
          </p>
        </div>

          <div class="col-md-9 column">
            <h3>
              ¿Por qué aún no se ejecuta el plan integral para promoción de ciclovías?
            </h3>

            <p>Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.</p>


            <p>
              Publicada hace 3 días por <img class="img-circle" src="holder.js/45x45"> <a href="#">Pedro Perez</a>, de Monterrey, Nuevo León
            </p>

            <h4>Promueve:</h4>
            <p>

              <span class="fa-stack fa-lg">
                <em class="fa fa-square-o fa-stack-2x"></em>
                <em class="fa fa-facebook fa-stack-1x"></em>
              </span>

              <span class="fa-stack fa-lg">
                <em class="fa fa-square-o fa-stack-2x"></em>
                <em class="fa fa-twitter fa-stack-1x"></em>
              </span>

              <span class="fa-stack fa-lg">
                <em class="fa fa-square-o fa-stack-2x"></em>
                <em class="fa fa-google-plus fa-stack-1x"></em>
              </span>
            </p>
          </div>
          <div class="col-md-3 column">
            <p><small>40 personas apoyan esto, se necesitan 60 votos más.</small></p>
            <div class="progress">
              <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                <span class="sr-only">40% Completado</span>
              </div>
            </div>
            <p>
              <button type="button" class="btn btn-primary">¡Pregúntale tú también!</button>
            </p>

            <hr>
            <h4>Categoría</h4>
            <p><a href="#">Ejecución de planes</a></p>

            <hr>
            <h4>¿Quiénes han apoyado recientemente esta pregunta?</h4>


            <div class="media">
              <a class="pull-left" href="#"><img class="img-circle" src="holder.js/45x45" alt="Ciudadano"></a>
              <div class="media-body">
                 <p>
                  <a href="#">Anselmo Phillip</a><br />
                  <small>hace 7 horas</small>
                </p>
              </div>
            </div>

            <div class="media">
              <a class="pull-left" href="#"><img class="img-circle" src="holder.js/45x45" alt="Ciudadano"></a>
              <div class="media-body">
                 <p>
                  <a href="#">Max Cavalera</a><br />
                  <small>hace 2 días</small>
                </p>
              </div>
            </div>


            <div class="media">
              <a class="pull-left" href="#"><img class="img-circle" src="holder.js/45x45" alt="Ciudadano"></a>
              <div class="media-body">
                 <p>
                  <a href="#">Ronnie James Dio</a><br />
                  <small>hace 3 días</small>
                </p>
              </div>
            </div>

          </div>
          <hr>
        </div>

      </div>
{% endblock content %}
