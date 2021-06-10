<%-- 
    Document   : pedidosClientes.jsp
    Created on : 24-abr-2021, 12:42:43
    Author     : usuario
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
        <title>Electrosa >> Pedidos del cliente</title>
        <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
        <meta name="keywords" content="electrodomesticos" lang="es-ES">
        <meta name="language" content="es-ES">
        <meta name="robots" content="index,follow">

        <link href="../css/electrosa.css" rel="stylesheet" media="all" type="text/css">
        <link href="../css/clientes.css" rel="stylesheet" media="all" type="text/css">
        <link href="../css/listado.css" rel="stylesheet" media="all" type="text/css">
    </head>

    <body >
        <script>

            window.addEventListener("load", ej9_2);
            function ej9_2() {


                var a = document.querySelectorAll(".desplegar");
                for (let el of a) {
                    el.addEventListener("click", function (e) {
//                        e.preventDefault();
                        var contenido = el.innerHTML
                        var id = el.id
                        
                        if (contenido === '[+]') {
                            el.innerHTML= '[-]'
                            axios('VerPedido', {
                                params: {'cp':id},
                                headers: {'X-Requested-With': 'XMLHttpRequest'}
                            }).then(function (response) {
                               
                               var peticion=hazPedidoHTML(response.data);
                               
                               
                                var tr=document.createElement("tr");
                                tr.class="tr"
                                tr.id=id+"t"
                                var td=document.createElement("td");
                                td.class="td"
                                td.setAttribute("colspan","6")
                                td.setAttribute("align","center")
                             
                                td.innerHTML=peticion
                                tr.appendChild(td)
                                
                                var a = el.parentNode
                                a= a.parentNode
                                a.after(tr)
                                
                                
                                //a.innerHTML=hazHTML()
                                
                                
           
                            }).catch(function (error) {
                                        alert('Error [' + error + ']')
                            })
                        }
                        else{
                            
                             el.innerHTML= '[+]'
                             var elemento= document.getElementById(id+"t")
                             var padre = elemento.parentNode
                             padre.removeChild(elemento)

                        }

                    });
                }
            }
            
            function hazPedidoHTML(pedido) {
            var html = '<table width="95%"> \
              <colgroup> \
                <col width="9%"><col width="53%"><col width="10%"> \
                <col width="10%"><col width="6%"><col width="6%"> \
              </colgroup> \
              <tr style="text-align: left"><td colspan="6">Detalle del pedido ';
            html += pedido.codigo;
            html += '</td></tr>  \
              <tr style="text-align: left"> \
                <td>Cantidad</td><td>Art&iacute;culo</td><td>P.V.P.</td> \
                <td>Su precio</td><td>F. E. des.</td><td>F. E. prev.</td> \
              </tr>'

            html = pedido.lineas.reduce(function (html, l, i) {
              html += '      <tr '+(i%2==0?'class="par"':'')+'> \
                <td style="text-align:center">';
              html += l.cantidad;
              html += '</td><td style="text-align: left">';
              html += l.articulo.codigo +' / '+l.articulo.nombre
              html += '</td><td style="text-align: right">'+l.articulo.pvp+' &euro;</td>'
              html += '<td style="text-align: right">'+ l.precioReal +' &euro;</td>'
              html += '<td>' + l.fechaEntregaDeseada.dayOfMonth + '/' + l.fechaEntregaDeseada.month + '/' + l.fechaEntregaDeseada.year + '</td>';
              html += '<td>' + (!l.fechaEntregaPrevista ? 'S.D.*' :
                      l.fechaEntregaPrevista.dayOfMonth + '/' + l.fechaEntregaPrevista.month + '/' + l.fechaEntregaPrevista.year) + '</td></tr>';
              return html;
            }, html)
            html += '</table>'

            return html;
          }
            
            
            
        </script>

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
                    <a href="AreaCliente" title="Área de cliente">Área de cliente</a>
                </div>
                <div id="cliente">
                    Bienvenido ${cliente.nombre}
                </div>
                <div class="clear"></div>
                <div class="contenido">
                    <h1>Sus pedidos    </h1>
                    <a name="inicio"></a>
                    <p>Estos son sus pedidos. </p>

                    <c:if test="${! empty carrito}">
                        <p>Actualmente dispone de un <a href="Carrito">pedido en realizacion</a> </p>
                    </c:if>

                    <p>&nbsp;<span class="atajo"><a href="#comp">Completados</a> &nbsp; | &nbsp; <a href="#anul">Anulados</a></span></p>

                    <table width="95%">
                        <colgroup>
                            <col width="5%">
                            <col width="5%">
                            <col width="14%">
                            <col width="14%">
                            <col width="51%">
                            <col width="11%">
                        </colgroup>
                        <tr>
                            <td colspan="6">Listado de pedidos pendientes </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>C&oacute;digo </td>
                            <td>Fecha </td>
                            <td>Direcci&oacute;n de entrega </td>
                            <td>Importe </td>
                        </tr>            
                        <c:if test="${! empty pedPendientes}">
                            <c:forEach var="pendiente" items="${pedPendientes}" varStatus="i">

                                <c:if test="${(i.index%2==0 )}">
                                    <tr class="par" }>
                                    </c:if> 

                                    <c:if test="${!(i.index%2==0 )}">
                                    <tr>
                                    </c:if> 

                                    <td style="text-align: center"><img src="../img/pdf.gif" title="Descargar en PDF"/></td>

                                    <td style="text-align: center"><a href="VerPedido?cp=${pendiente.getCodigo()}"><img src="../img/cancel.png" title="Cancelar el pedido"/></td>



                                    <td><a title="Desplegar detalle pedido" class="desplegar" href="#" id="${pendiente.getCodigo()}">[+]</a><a href="VerPedido?cp=${pendiente.getCodigo()}">${pendiente.getCodigo()} </td>
                                    <td> Fecha: <fmt:formatDate pattern="dd/MM/yy" value="${pendiente.getFechaCierre().time}"/> </td>
                                    <td>${pendiente.getDirEntrega()}</td>
                                    <td style="text-align: right"><fmt:formatNumber value="${pendiente.getImporte()}"  />€</td>
                                </tr>

                            </c:forEach>
                        </c:if>
                    </table>

                    <span class="atajo"><a href="#inicio">Inicio</a></span>

                    <p>&nbsp;</p>          
                    <a name="comp"></a>
                    <table width="95%">
                        <colgroup>
                            <col width="5%">
                            <col width="14%">
                            <col width="14%">
                            <col width="56%">
                            <col width="11%">
                        </colgroup>
                        <tr>
                            <td colspan="5">Listado de pedidos Completados</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>C&oacute;digo </td>
                            <td>Fecha </td>
                            <td>Direcci&oacute;n de entrega </td>
                            <td>Importe </td>
                        </tr>
                        <c:if test="${! empty pedCompletados}" >
                            <c:forEach var="completado" items="${pedCompletados}" varStatus="i">


                                <c:if test="${(i.index%2==0 )}">
                                    <tr class="par" }>
                                    </c:if> 

                                    <c:if test="${!(i.index%2==0 )}">
                                    <tr>
                                    </c:if> 


                                    <td style="text-align: center"><img src="../img/pdf.gif" title="Descargar en PDF"/></td>

    
                                    <td><a title="Desplegar detalle pedido" class="desplegar" href="#" id="${completado.getCodigo()}">[+]</a><a href="VerPedido?cp=${completado.getCodigo()}">${completado.getCodigo()} </td>
                                    <td><fmt:formatDate pattern="dd/MM/yy" value="${completado.getFechaCierre().time}"/></td>
                                    <td>${completado.getDirEntrega()}</td>
                                    <td style="text-align: right"><fmt:formatNumber value="${completado.getImporte()}"  />€</td>
                                </tr>

                            </c:forEach>
                        </c:if>
                    </table>

                    <span class="atajo"><a href="#inicio">Inicio</a></span>

                    <p>&nbsp;</p>
                    <a name="anul"></a>
                    <table width="55%">
                        <colgroup>
                            <col width="10%">
                            <col width="26%">
                            <col width="32%">
                            <col width="32%">
                        </colgroup>
                        <tr>
                            <td colspan="4">Listado de pedidos anulados </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>C&oacute;digo</td>
                            <td>Fecha cierre</td>
                            <td>Fecha anulación</td>
                            <c:if test="${! empty pedAnulados}">
                                <c:forEach var="anulado" items="${pedAnulados}" varStatus="i">                

                                    <c:if test="${(i.index%2==0 )}">
                                    <tr class="par" }>
                                    </c:if> 

                                    <c:if test="${!(i.index%2==0 )}">
                                    <tr>
                                    </c:if>     


                                    <td style="text-align: center"><img src="../img/pdf.gif" title="Descargar en PDF"/></td>
                                    <td><a href="VerPedido?cp=${anulado.getCodigo()}">${anulado.getCodigo()} </a> </td>
                                    
                                    <td><fmt:formatDate value="${anulado.getFechaCierre().time}"/></td>
                                    <td><fmt:formatDate value="${anulado.getFechaAnulacion().time}"/></td>  
                                </tr>

                            </c:forEach>
                        </c:if>
                    </table>

                    <span class="atajo"><a href="#inicio">Inicio</a></span>
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