<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Electrosa >> cat&aacute;logo</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="../css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/catalogoMosaico.css" rel="stylesheet" media="all" type="text/css"> 
    <link href="../css/estilomenu.css" rel="stylesheet" media="all" type="text/css" />

    <!--Load the Google Chart API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

  </head>

  <body >
    <div class="logo"><a href="../index.jsp"><img src="../img/LogoElectrosa200.png" border="0"></a></div>

    <div class="sombra">
      <div class="nucleo">
        <div id="lang">
          <a href="index.html">Español</a> &nbsp; | &nbsp; <a href="index.html">English</a>
        </div>
      </div>
    </div>  

    <div class="barra_menus">
      <div class="pestanias">
        <div class="grupoPestanias">
          <div class="pestaniaNoSel"><a href="../index.jsp">Para usuarios</a></div>
          <div class="pestaniaSel">Intranet</div>
        </div>
      </div>

      <div id="menu" >
        <ul>
          <li>
            <a href="index.html">Art&iacute;culos</a>		</li>
          <li>
            <a href="index.html">Clientes</a>	    </li>
          <li>
            <a href="index.html">Pedidos</a>		</li>
          <li>
            <a href="index.html">Stocks</a>		</li>
        </ul>
        <div style="clear: left;"></div>
      </div>
    </div> 
    <div class="sombra">
      <div class="nucleo">
        <div id="migas">
          <a href="index.html" title="Inicio" >Inicio</a>&nbsp; | &nbsp; 
          Estadísticas	<!-- &nbsp; | &nbsp; 
          <a href="..." title="Otra cosa">Otra cosa</a>   -->
        </div>

        <div class="contenido">
          <h1>Estadísticas de venta de productos</h1>
          <p>Elige. </p>
          <div class="filtroCatalogo redondeo">
            <form name="filtroCatalogo" id="filtroCatalogo" action="HazEstadistica" >	  
              <jsp:useBean id="gbd" scope="application" class="paw.bd.GestorBD" /> 

              <label for="tipo">Tipo :</label>
              <select name="tipo" id="tipo">
                <c:forEach var="t" items="${gbd.tiposArticulos}">
                  <option value="${t}" ${(t == param.tipo?'selected':'')}>${t}</option>
                </c:forEach>
              </select>

              <label for="anio">Año :</label>
              <select name="anio" id="anio">               
                <%
                  Date hoy = new Date();
                  int anio = hoy.getYear() + 1900;
                  int[] anios = new int[5];
                  for (int i = 0;i<5;i++) anios[i] = anio-i;
                  pageContext.setAttribute("anios", anios);
                  %>                
                <c:forEach var="a" items="${anios}">
                  <option value="${a}" ${(param.anio == a?'selected':'')}>${a}</option>
                </c:forEach>
              </select>

              <label for="num">Número de artículos :</label>
              <select name="num" id="num">
                <c:forEach var="n" items="3,4,5,6,7,8">
                  <option value="${n}" ${(param.num == n?'selected':'')}>${n}</option>
                </c:forEach>
              </select>

              <input name="ver" id="buscar" type="image" title="Ver" src="../img/search25.png" alt="Ver">
            </form>
            <div class="clear"></div>
          </div>

		  <!-- Un ejemplo de gráfico de sectores. Puedes usarlo como base para la práctica -->
            <div id="chart_div"></div>               
            <script type="text/javascript">
              // Adaptado de https://developers.google.com/chart/interactive/docs/quick_start
              function pintaGrafico(datos, titulo, idDestino) {
                // Load the Visualization API and the corechart package.
                google.charts.load('current', {'packages': ['corechart']});

                // Set a callback to run when the Google Visualization API is loaded.
                google.charts.setOnLoadCallback(drawChart);

                // Callback that creates and populates a data table,
                // instantiates the pie chart, passes in the data and
                // draws it.
                function drawChart() {
                  // Create the data table.
                  var data = new google.visualization.DataTable();

                  data.addColumn('string', 'Nombre');
                  data.addColumn('number', 'Ventas');
                  data.addRows(datos);

                  // Set chart options
                  var options = {'title': titulo, 'width': 600, 'height': 300};

                  // Instantiate and draw our chart, passing in some options.
                  var chart = new google.visualization.PieChart(document.getElementById(idDestino));
                  chart.draw(data, options);
                }
              }
			  
			  pintaGrafico(${ventas}, 'Ventas de ${tipo} en ${anio}', 'chart_div')
          </script>

          <div class="clear"></div>

        </div>
      </div>

      <div class="separa"></div>

      <div class="pie">
        <span class="pie_izda">
          <a href="mailto:francisco.garcia@unirioja.es">Contacto</a> &nbsp; | &nbsp; <a href="../mapa.html">Mapa</a> </span>
        <span class="pie_dcha">
          &copy; 2012 Francisco J. García Izquierdo  </span>
        <div class="clear"></div>  
      </div>

    </div>
  </body>
</html>