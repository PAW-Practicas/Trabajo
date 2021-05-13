<%-- 
    Document   : pedido
    Created on : 25-abr-2021, 14:36:36
    Author     : usuario
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Electrosa >> Hoja de pedido</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="../css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/clientes.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/pedido.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/listado.css" rel="stylesheet" media="all" type="text/css">
  </head>

  <body >
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
            <a href="../BuscarArticulos">Comprar </a>
          </li>
          <li>
            <a href="PedidosCliente">Mis pedidos </a>
          </li>
          <li>
            <a href="EditaCliente">Cambiar datos personales </a>	
          </li>
          <li>
            <a href="../Salir">Cerrar sesión </a>	
          </li>
        </ul>
        <div style="clear: left;"></div>
      </div>
    </div> 

    <div class="sombra">
      <div class="nucleo">
        <div id="migas">
          <a href="../index.html" title="Inicio" >Inicio</a> &nbsp; | &nbsp; 
          <a href="AreaCliente" title="Área de cliente">Área de cliente</a>&nbsp; | &nbsp; 
          <a href="PedidosCliente" title="Mis pedidos">Mis pedidos</a>
        </div>
        <div id="cliente">
          Bienvenido ${cliente.getNombre()}
        </div>
        <div class="clear"></div>
        <div class="contenido">
          <h1>Hoja de pedido   </h1>
          <div class="cabPedido"> <span class="izda">ELECTROSA - Hoja de pedido</span> <span class="dcha">Ref. Pedido: ${pedido.getCodigo()}</span>
            <div class="clear"></div>
          </div>
          <div class="cabIdCliente">Identificación del cliente</div>
          <div class="detIdCliente">
            <div class="izda">Cliente: ${cliente.getCodigo()} </div>
            <br>
            <div class="izda">${cliente.getNombre()}</div>
            
            <div class="dcha"> Fecha:<fmt:formatDate value="${pedido.getFechaCierre().time}"/></div>
            <div class="dcha"> CIF: ${  cliente.getCif()},</div>
            <div class="clear"></div>
          </div>

          <div class="izda direccionEntregaPedLabel">A entregar en:</div>
          <div class="izda direccionEntregaPed">${pedido.getDirEntrega().getCalle()}<br>${pedido.getDirEntrega().getCiudad()}
          <br>${pedido.getDirEntrega().getCp()} - ${pedido.getDirEntrega().getProvincia()}</div>
          <div class="clear"></div>

          <table width="95%">
            <colgroup>
              <col width="9%">
              <col width="49%">
              <col width="11%">
              <col width="11%">
              <col width="10%">
              <col width="10%">
            </colgroup>
            <tr>
              <td colspan="6">Detalle del pedido</td>
            </tr>
            
         
            
            <tr>
              <td>Cantidad</td>
              <td>Art&iacute;culo</td>
              <td>P.V.P.</td>
              <td>Su precio</td>
              <td>F. Entrega deseada</td>
              <td>F. Entrega prevista</td>
            </tr>
               <c:forEach var="linea" items="${pedido.getLineas()}" varStatus="i">   
                   
                    
              
                    <c:if test="${i.index%2==0 }"><tr class="par" }> </c:if>    
                    <c:if test="${i.index%2!=0 }"><tr></c:if>
                    
                     
               
                 <td style="text-align:center">${linea.getCantidad()}</td>
                 <td>${linea.getArticulo().getNombre()}</td>
                 <td style="text-align: right">${linea.getPrecioBase()} &euro;</td>
                 <td style="text-align: right">${linea.getPrecioReal()} &euro;</td>
                 <td><fmt:formatDate value="${linea.getFechaEntregaDeseada().time}"/></td>
                 <td><fmt:formatDate value="${linea.getFechaEntregaPrevista().time}"/></td>
                  
           
               </tr>  
               
            </c:forEach>
                
            
               

          </table>
               <div class="resPedido">
            <span>TOTAL: ${precioTotal} &euro;</span>
            <div class="clear"></div>
          </div>  
           
          
       
          <div>
            * S.D.: sin disponibilidad. Recibirá una notificación de entrega en el momento en que podamos atender su petición.
          </div>   
        </div>
            
          <c:if test="${! empty opcion }">   

          <div  class="anulab">
            <a href="AnularPedido?codPedido=${pedido.getCodigo()}">ANULAR PEDIDO</a>
          </div> 
        </c:if> 
          <div  class="NOanulab">
            <a href="PedidosCliente">Volver a mis pedidos</a>
          </div> 
          <div class="clear"></div>
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