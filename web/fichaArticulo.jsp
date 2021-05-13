<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>${art.nombre}</title>
    <meta name="description" content="${art.descripcion}" lang="es-ES">
    <meta name="keywords" content="${art.fabricante} ${art.tipo}" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link href="css/fichaProducto.css" rel="stylesheet" media="all" type="text/css">
  </head>

  <body> 
     
    <c:if test="${rolCliente==true}">
             <%@include file="clientes/cabeceraCliente.html" %>    
    </c:if>
    <c:if test="${roladmin==true}">
                 <%@include file="admin/cabeceraAdmin.html" %>     
    </c:if>    
     
    <c:if test="${rolCliente==false}">
        <c:if test="${roladmin==false}">
            <%@include file="cabecera.html" %> 
</c:if>
</c:if>
    <div class="sombra">
      <div class="nucleo">
        <div id="migas">
          <a href="index.html" title="Inicio" >Inicio</a>&nbsp; | &nbsp; 
          <a href="${header['referer']}" title="Hojear catalogo">Hojear catálogo</a>&nbsp; | &nbsp; ${art.codigo}-->

          
        </div>

        <div class="contenido">
          <h1>Ficha t&eacute;cnica de ${art.codigo}</h1>
          <div class="fotoDetalle">
            <img src="img/fotosElectr/${art.foto}" alt="${art.codigo}" longdesc="${art.nombre}">
          </div>
          <div class="datosDetalle">
            <h2>${art.nombre}</h2>
            <p>${art.descripcion}</p>
            <div class="precio">
              <span>Precio: ${art.pvp} &euro;</span>	
            </div>
            <div class="carroDetalle" >
              <a href="clientes/GestionaPedido?codArt=${art.codigo}&accion=comprar"><img src="img/AddCart2-50.png" title="Añadir a mi pedido en realización">
            </div>
          </div>
          <div class="clear"></div>
        </div>
      </div>
            
      <div class="separa"></div>

      <%@include file="pie.html" %>

    </div>
  </body>
</html>