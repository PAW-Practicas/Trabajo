<%-- 
    Document   : catalogo
    Created on : 14-abr-2021, 8:56:03
    Author     : usuario
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="fontawesome/css/all.min.css" rel="stylesheet">
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
         <c:if test="${not empty param.lang}" >
        <fmt:setLocale value="${param.lang}" scope="session"/>
     </c:if>   
      <fmt:setBundle basename="electrosaMsg"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
        <title><fmt:message key="catalogo.tit"/> </title>
        <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
        <meta name="keywords" content="electrodomesticos" lang="es-ES">
        <meta name="language" content="es-ES">
        <meta name="robots" content="index,follow">

        <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">

        <link href="css/catalogoMosaico.css" rel="stylesheet" media="all" type="text/css" title="mosaico">
        <link href="css/catalogoLista.css" rel="alternate stylesheet" media="all" type="text/css" title="lista">

        <script src="js/styleswitcherFGI.js" type="text/javascript"></script>

        <script>
            window.addEventListener("load", init);


            function init() {
                var as = document.querySelector(".modovisual").getElementsByTagName("a");
                as[0].addEventListener("click", function (evt) {
                    cambiadorCss.setHojaCss("mosaico");
                    evt.preventDefault();
                });
                as[1].addEventListener("click", function (evt) {
                    cambiadorCss.setHojaCss("lista");
                    evt.preventDefault();
                });



                //ejercicio 2 
                var x = document.getElementById("precio");

                var precio = "${precio}";
                var precios = ["- Cualquiera -", "10-50", "50-100", "100-200", "200-500", "500-1000", "1000"];


                var value = ["-1", "10-50", "50-100", "100-200", "200-500", "500-1000", "1000"];

                for (i = 0; i < precios.length; i++)
                {
                    let option = document.createElement("option");
                    option.text = precios[i];
                    option.value = value[i];
                    x.add(option);
                }

                var pr = '${precio}';
                if (pr !== -1) {
                    x.value = pr;
                }





            }
        </script>


        <script src="js/ej4.js" type="text/javascript"></script>
        <script src="js/ej5.js" type="text/javascript"></script>
        <script src="js/ej6.js" type="text/javascript"></script>
        <script src="js/ej8.js" type="text/javascript"></script>
        <script src="js/ej11.js" type="text/javascript"></script>
    </head>

    <body >
        
        
      <%@include file="cabecera3.html" %>



        <div class="sombra">
            <div class="nucleo">

                <div id="migas">
                    <a href="index.html" title="Inicio" >Inicio</a>&nbsp; | &nbsp; 
                    <a href="generica.html" title="Hojear catalogo">Hojear catalogo</a>	<!-- &nbsp; | &nbsp; 
                    <a href="..." title="Otra cosa">Otra cosa</a>   -->	
                </div>

                <div class="dcha" style="width:75px" id="carroDrop">
                    <div style="position: absolute">
                        <a href="clientes/Carrito">
                            <img style="z-index: 0; position: absolute" src="img/AddCart2-50.png">
                        </a>
                        <div style="z-index: 10; position: absolute; top: 10px; left:8px; font-weight: bold; font-size: 15px"> ${carrito.getLineas().size()} </div> <!-- Cambiarás un cosa aquí -->
                    </div>
                </div>


                <div class="contenido">
                    <h1><fmt:message key="catalogo.head"/></h1>
                    <p><fmt:message key="catalogo.txt"/> </p>
                    <div class="filtroCatalogo">
                        <form name="filtroCatalogo" id="filtroCatalogo" action="BuscarArticulos">
                            <script>

                            </script>
                            <label for="tipo"><fmt:message key="catalogo.fltr.tipo"/> </label>
                            <select name="tipo" id="tipo">
                                <c:if test="${!empty tipo}"> <option value="${tipo}">${tipo}</option> </c:if>
                                <option value="">- Cualquiera -</option>
                                <option value="Aspirador">Aspiradores</option>
                                <option value="Campana">Campanas</option>
                                <option value="Cocina">Cocinas</option>
                                <option value="Frigorifico">Frigoríficos</option>
                                <option value="Horno">Hornos</option>
                                <option value="Lavadora">Lavadoras</option>
                                <option value="Lavavajillas">Lavavajillas</option>
                                <option value="Microondas">Microondas</option>
                                <option value="Placa">Placas</option>
                            </select>

                            <label for="fabricante"><fmt:message key="catalogo.fltr.fab"/> </label>
                            <select name="fabricante" id="fabricante">
                                <c:if test="${!empty fabricante}"> <option value="${fabricante}">${fabricante}</option> </c:if>
                                <option value="">- Cualquiera -</option>
                                <option value="Edesa">Edesa</option>
                                <option value="Fagor">Fagor</option>
                                <option value="Miele">Miele</option>
                            </select>

                            <label for="precio"><fmt:message key="catalogo.fltr.pvp"/></label>
                            <select name="precio" id="precio"></select>

                            <!--- <p>
                                 <label for="nomArt">Búsqueda por nombre </label>
                                 <textarea id="w3review" name="nomArt" rows="1" cols="50"></textarea>
                             </p>
                             <br>
                             <label for="codArt">Búsqueda por código </label>
                             <textarea id="w3review" name="codArt" rows="1" cols="50"></textarea>
                             --->

                            <input name="buscar" id="buscar" type="image" title="Buscar" src="img/search25.png" alt="Buscar">


                            <br>
                            <input type="text" name="nomArt" id="nombre" value="" placeHolder="Nombre" style="margin-left:
                                   10px"/>
                            <input type="text" name="codArt" id="codigo" value="" placeholder="Código" />




                        </form>

                        <div class="modovisual">
                            <a href="catalogo.html"><fmt:message key="catalogo.fltr.mos"/></a> &nbsp; | &nbsp; <a href="catalogo.html"><fmt:message key="catalogo.fltr.lst"/></a>
                        </div>
                        <div class="clear"></div>
                    </div>



                    <div class="resumResul redondeo"> 
                        <c:if test="${numRegs != null}">
                            Encontrados ${numRegs}  artículos. Mostrando página ${Pagina} de ${numPags-1}.

                            <span class="paginador">                            

                                <c:if test="${Anterior != null && Anterior!=0}">
                                    <a href="BuscarArticulos?Pagina=${Anterior}&precio=${precio}&fabricante=${fabricante}&tipo=${tipo}">Anterior</a> 
                                </c:if>
                                <c:forEach var="paginas" items="${Adyacentes}">                
                                    <c:if test="${paginas == Pagina}">
                                        <span>${paginas}</span>  
                                    </c:if>
                                    <c:if test="${paginas!=Pagina && paginas!=numPags}">
                                        <a href="BuscarArticulos?Pagina=${paginas}&precio=${precio}&fabricante=${fabricante}&tipo=${tipo}">${paginas}</a> 
                                    </c:if>  




                                </c:forEach>    

                                <c:if test="${Siguiente != null && Siguiente !=numRegs-2 }">
                                    <a href="BuscarArticulos?Pagina=${Siguiente}&precio=${precio}&fabricante=${fabricante}&tipo=${tipo}">Siguiente</a> 
                                </c:if> 

                            </span>

                        </c:if>
                    </div>
                    <ul>
                        <c:forEach var="art" items="${articulos}">                
                            <li class="item redondeo" draggable="true">
                                <div class="foto">
                                    <a href="FichaArticulo?codArt=${art.codigo}"><img src="img/fotosElectr/${art.foto}" alt="${art.nombre}" longdesc="${art.descripcion}" width="80"></a>
                                </div>
                                <div class="datos">
                                    <a href="FichaArticulo?codArt=${art.codigo}"><span>${art.nombre}</span></a>
                                    <div class="precio">
                                        <span class="oferta">${art.pvp} &euro;</span>
                                    </div>
                                    <div class="carro">
                                        <a href="clientes/GestionaPedido?codArt=${art.codigo}&accion=comprar"><img src="img/shopcartadd_16x16.png" title="Añadir a mi carro de la compra"></a>
                                    </div>
                                </div>			  
                                <div class="codigo"><a href="FichaArticulo?codArt=${art.codigo}">${art.codigo}</a></div>
                            </li>    
                        </c:forEach>        
                    </ul>			
                    <div class="clear"></div>
                </div>
            </div>
            <%@include file="pie.html" %>
        </div>
    </body>
</html>