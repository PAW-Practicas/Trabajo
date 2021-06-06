<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Electrosa >> Error de aplicación</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">
  </head>

  <body >
   
      
    <c:if test="${rolCliente==true}">
             <div class="logo"><a href="../index.html"><img src="../img/LogoElectrosa200.png" border="0"></a></div>


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
          <div class="pestaniaSel">Para usuarios</div>
          <div class="pestaniaNoSel">Intranet</div>
        </div>
      </div>

      <div id="menu">
        <ul>
          <li>
            <a href="BuscarArticulos">Comprar </a>
          </li>
          <li>
            <a href="PedidosCliente">Mis pedidos </a>
          </li>
          <li>
            <a href="EditaCliente">Cambiar datos personales </a>	
          </li>
          <li>
            <a href="clientes/Salir">Cerrar sesión </a>	
          </li>
        </ul>
        <div style="clear: left;"></div>
      </div>
    </div>   
    </c:if>
    
    <c:if test="${rolCliente!=true}">
             <%@include file="cabecera.html" %>    
    </c:if>  
     

    <div class="sombra">
      <div class="nucleo">
        <div id="migas">
          <a href="index.jsp" title="Inicio" >Inicio</a><!-- &nbsp; | &nbsp; 
          <a href="..." title="Otra cosa">Otra cosa</a>   -->	
        </div>

        <div class="contenido">
		  <div style="float:left"><img src="img/alerta.png"></div>
		  <div class="error">
                    <div>
                        <c:out default="Error de aplicación" value="Error 404. Recurso inexistente: ${requestScope['javax.servlet.error.message']}"/>
                    </div>                    
                    
                    <div class="errorb"><a href="${empty link ? 'index.html' : link}">Salir de aqui</a></div>
		  </div>
		  <div class="clear"></div>
          
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
  </body>
</html>