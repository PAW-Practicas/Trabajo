<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
        <title>Electrosa >> Pedido en realización</title>
        <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
        <meta name="keywords" content="electrodomesticos" lang="es-ES">
        <meta name="language" content="es-ES">
        <meta name="robots" content="index,follow">

        <link href="../css/electrosa.css" rel="stylesheet" media="all" type="text/css">
        <link href="../css/clientes.css" rel="stylesheet" media="all" type="text/css">
        <link href="../css/pedidoR.css" rel="stylesheet" media="all" type="text/css">
        <link href="../calendar_trial/codebase/calendar.min.css" rel="stylesheet" media="all">
        <script type="text/javascript" src="../calendar_trial/codebase/calendar.min.js" ></script>

    </head>

    <body >

        <script>
           window.addEventListener("load", ej3);
function ej3(e) {

    //parte izq
    var cantidad = document.getElementsByClassName("cantidad");
    for (let e of cantidad) {
        e.addEventListener("change", function (e) {
            var valor = this.value
            
            var cod=document.getElementsByClassName("codigo").item(0);
            var cod=cod.innerHTML;

            var chisme= e.currentTarget
        
        
        
             axios('../api/GetStockArticulo', {
            params : {codArt:cod}, 
            responseType: 'text'
            })
            .then(response => {
            var respuesta=response.data
//              var canDrive = age > 16 ? 'yes' : 'no';

              chisme.style.backgroundColor=respuesta>valor?"#5CBC67":"#C02C11";
//              if(valor>v)
//              chisme.style.backgroundColor = "#C02C11";
//              chisme.style.backgroundColor = "#5CBC67";
            })
            .catch( err => { alert('Error [' + err + ']') })

        
        
        })
        
    }
}
                        
        </script>


        <script>
                    window.addEventListener("load", ej9);
                    function ej9() {
                    var selector = document.querySelectorAll(".fecha");
                    for (let e of selector) {
                    setCalendar(e);
                    }
                    }
                    function setCalendar(campo) {
                    // Configuración del calendario
                    let calCnf = {
                    dateFormat: "%d/%m/%Y",
                            css: "dhx_widget--bordered",
                            value: campo.value,
                            disabledDates: date => date < new Date()
                    };
                    let calendar = new dhx.Calendar(null, calCnf); // Creación del calendario
                    let popup = new dhx.Popup(); // Pop-up ...
                    popup.attach(calendar); // ... asociado al calendario ...
                    campo.addEventListener("click", function () {
                    popup.show(campo); // ...que se muestra al hacer clic en el campo
                    });
                    calendar.events.on("change", function () {     // Al seleccionar una fecha...
                    campo.value = calendar.getValue(); // ... se cambia el valor del campo y ...
                    popup.hide(); // ... se oculta el pop-up/calendario
                    });
                    }



        </script>

        <%@include file="cabeceraCliente.html" %> 

        <div class="sombra">
            <div class="nucleo">
                <div id="migas">
                    <a href="../index.html" title="Inicio" >Inicio</a> &nbsp; | &nbsp; 
                    <a href="AreaCliente" title="Área de cliente">Área de cliente</a>
                </div>
                <div id="cliente">
                    Bienvenido, ${cliente.getNombre()}
                </div>
                <div class="clear"></div>
                <div class="contenido">
                    <h1>Contenido de su  pedido    </h1>
                    <p>Pedido iniciado el ${carrito.getInicio().getTime()}</p>
                    <form action="GestionaPedido" method="post">
                        <table width="95%" cellspacing="0">
                            <tr>
                                <td colspan="2"><img src="../img/AddCartb.png" style="vertical-align:middle;margin-bottom:3px; margin-left:15px">&nbsp; Art&iacute;culos del pedido</td>
                                <td width="10%">P.V.P.</td>
                                <td width="10%">Cantidad</td>
                                <td width="16%">Fecha de entrega (dd/mm/yyyy)</td>
                            </tr>
                            <!---List<LineaEnRealizacion> lineas = carrito.getLineas();
                              lineas.get(0).getArticulo().getCodigo() -->


                            <c:forEach var="linea" items="${carrito.getLineas()}">   
                                <tr >
                                    <td width="6%" style="text-align:center"><a href="GestionaPedido?accion=quitar&codArt=${linea.codigo}"><img src="../img/cancel.png" alt="Quitar del pedido" border="0" title="Quitar del pedido"></a></td>
                                    <td width="58%"><span class="codigo">${linea.getArticulo().getCodigo()}</span> - <br/><span class="descr">${linea.getArticulo().getNombre()}</span></td>
                                    <td>${linea.getArticulo().getPvp()}</td>
                                    <td>
                                        <input class="cantidad" value="3" type="number" name="C_${linea.getCodigo()}" size="3"  min="1" max="10">
                                        <!---value="C_{linea.getCodigo()}"--->

                                    </td>
                                    <td>


                                        <input type="text" class="fecha" name="F_${linea.getCodigo()}" size="10" value="<fmt:formatDate pattern="dd/MM/yy" value="${linea.getFechaEntregaDeseada().time}"/>">			  
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                        <input class="submitb" type="submit" name="accion" value="Seguir comprando">
                        <input class="submitb" type="submit" name="accion" value="Guardar pedido">
                        <input class="submitb cerrar" type="submit" name="accion" value="Cerrar pedido">	
                        <input class="submitb cancelar" type="submit" name="accion" value="Cancelar">
                    </form>
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
