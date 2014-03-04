¡Pregúntale!
============

Durante la edición 2014 del [OpenDataMTY][], realizado durante los días 22 y 23
de febrero en las instalaciones del Centro de Tecnología Avanzada para la
Producción ([CETEC][]) del [Tecnológico de Monterrey][ITESM], el  [Centro de
Integración Ciudadana][CIC] indicaba algunos datos que captaron nuestra
atención:

- Actualmente el 90% de los regio-montanos desconfían de las autoridades.
- El 82% de las personas se siente insegura.
- Solo el 2% de la población manifiesta interés en participar en cualquier
causa social.

En nuestro afán de brindar una alternativa que sirviese para impulsar el último
punto referido a la participación ciudadana de los habitantes de la zona
metropolitana de Nuevo León, sentamos las bases de lo que denominamos:
*¡Pregúntale!*

Objetivos
---------

 - Proveer un canal alternativo que fomente la participación ciudadana en Nuevo
 León.
 - Proveer un API de consumo público.
 - Caso de uso inicial: 9 municipios de la zona metropolitana de Nuevo León.
 - Hacer flexible la configuración y ofrecer la posibilidad de integrarlo a
otros municipios o estados.

Antecedentes
------------

* Locales:
	- [Centro de Integración Ciudadana][CIC]
	- [Alcalde, ¿Cómo vamos?](http://comovamosnl.org/)
* Internacional:
	- [askthem.io](http://askthem.io)
	- [change.org](http://change.org)
	- [petitions.whitehouse.gov](http://petitions.whitehouse.gov)
	- [democracyos.org](http://democracyos.org)
	- [ipetitions.com](http://ipetitions.com)
	- [thepetitionsite.com](http://thepetitionsite.com)

Instalación
-----------

Hasta ahora solo con fines de desarrollo:

```bash
$ git clone https://github.com/milmazz/preguntale.git
$ cd preguntale
$ virtualenv venv
$ source venv/bin/activate
$ pip install -r requirements.txt
$ bower install
$ mkdir data
$ mongod --dbpath $(PWD)/data
$ python app.py
$ curl http://127.0.0.1:5000/
```

¿Cómo puedo colaborar?
----------------------

 - Puedes comenzar revisando nuestro listado de [issues][] abiertos o crear un
 nuevo reporte ya sea para iniciar una nueva discusión acerca de una nueva
 funcionalidad o para reportar un *bug* o error de programación. Si aun no
 conoces la base de código del proyecto puedes comenzar revisando los *issues*
 etiquetados como [low-hanging-fruit][], seguramente son de fácil resolución y
 pueden servirte como punto de partida.
 - Si necesitas mayor información o alguna aclaración sobre un *issue* en
 particular no dudes en comentarlo. Esperamos poder aclararte la duda tan pronto
 como nos sea posible y facilitar el camino para recibir tu colaboración.
 - Haz un *fork* de nuestro repositorio en *Github* y comienza a realizar tus
 cambios en la rama principal o *master*
 - Ya sea que estés resolviendo un *bug* o generando una nueva funcionalidad,
 por favor, provee *tests* que verifiquen que tus cambios funcionan de la manera
 esperada.
 - Envíanos un *Pull Request*, por favor, agrégate como nuestro colaborador
 editando el fichero AUTHORS
 - *Happy Hacking* :-)

[OpenDataMTY]: http://www.opendatamty.org/
[CETEC]: http://www.itesm.mx/wps/portal?WCM_GLOBAL_CONTEXT=/migration/MTY2/Monterrey/Acerca+del+campus/Vis_tanos/Instalaciones/CETEC
[ITESM]: http://www.itesm.mx/
[CIC]: http://cic.mx
[issues]: https://github.com/milmazz/preguntale/issues
[low-hanging-fruit]: https://github.com/milmazz/preguntale/issues?labels=low-hanging-fruit&page=1&state=open