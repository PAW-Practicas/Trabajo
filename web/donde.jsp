<%-- 
    Document   : donde
    Created on : 21-may-2021, 18:50:20
    Author     : usuario
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="GestorBD" class="paw.bd.GestorBD"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Donde estamos</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css"></head>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css">
    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"></script>

  <body >
   <%@include file="cabecera.html" %> 
<c:set var="centro" value="${GestorBD.getAlmacenDeCP(28001)}" scope="page"></c:set>

    <c:set var="almacenes" value="${GestorBD.almacenes}" scope="page"></c:set>
   <div class="sombra">
      <div class="nucleo">
        <div id="migas">
          <a href="index.jsp" title="Inicio" >Inicio</a><!-- &nbsp; | &nbsp; 
          <a href="..." title="Otra cosa">Otra cosa</a>   -->	
        </div>
        <div class="contenido">
          <h1>Donde estamos</h1>
          <div class="centro">
              
            
              
            <h2>Oficinas centrales </h2>
            <p><strong>Electrosa S.L. </strong><br>
            ${centro.getDireccion().getCalle()}<br>
              ${centro.getDireccion().getCp()} - ${centro.getDireccion().getCiudad()}<br>
              ${centro.getDireccion().getProvincia()}<br>
              Tfno: (+34) 941 000 000 - FAX:  (+34) 941 000 001</p>
            <h2>Almacenes de zona </h2>
            
             <p>Para  facilitar la gesti&oacute;n ELECTROSA considera la superficie nacional dividida en  cinco zonas: centro, norte, sur, este y oeste. En cada zona dispone de un  almac&eacute;n (almac&eacute;n de referencia de la zona). Puede visitarlos en las siguientes direcciones:</p>

             <c:forEach var="almacen" items="${almacenes}"> 
                
               
                <div class="dirAlmacen"><strong>${almacen.getZona()} </strong><br>
                  ${almacen.getDireccion().getCalle()}  <br>
                  ${almacen.getDireccion().getCp()} - ${almacen.getDireccion().getCiudad()}<br>
                  ${a.getDireccion().getProvincia()}<br>
                </div> 
                  
             </c:forEach>  

            
<!--            
            <div class="dirAlmacen"><strong>Zona Norte </strong><br>
              C/ Luis de Ulloa, s.n.  <br>
              26004 - Logro&ntilde;o <br>
              La Rioja - Spain <br>
            </div>
            <div class="dirAlmacen"><strong>Zona Norte </strong><br>
              C/ Luis de Ulloa, s.n.  <br>
              26004 - Logro&ntilde;o <br>
              La Rioja - Spain <br>
            </div>-->
            <div class="clear"></div>
            <div id="mapId" style="margin: auto; width: 512px; height: 512px; position: relative; overflow: hidden;"></div>
          </div>
        </div>
      </div>

      <div class="separa"></div>
      
      <div class="pie">
        <span class="pie_izda">
          <a href="mailto:francisco.garcia@unirioja.es">Contacto</a> &nbsp; | &nbsp; <a href="mapa.html">Mapa</a> </span>
        <span class="pie_dcha">
          &copy; 2012 Francisco J. García Izquierdo  </span>
        <div class="clear"></div>  
      </div>
    </div>
   
   
    
    
   <script type="text/javascript">
    var map;

      



    function inicializa() {
        var cnf = {
        center: [${centro.getCoordX()}, ${centro.getCoordY()}],
        zoom: 6
      };

      map = L.map('mapId', cnf);
      
      
      L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
      }).addTo(map);


    
            
      <c:forEach var="almacen" items="${almacenes}"> 
        L.marker([${almacen.coordX}, ${almacen.coordY}]).bindPopup("${almacen.direccion}").addTo(map);
      </c:forEach>

    }

    window.addEventListener("load", inicializa);

  </script>
    
  </body>
</html>