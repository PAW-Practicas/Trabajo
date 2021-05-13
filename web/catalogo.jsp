<%-- 
    Document   : catalogo
    Created on : 14-abr-2021, 8:56:03
    Author     : usuario
--%>
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

        <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">

        <link href="css/catalogoMosaico.css" rel="stylesheet" media="all" type="text/css" title="mosaico">
        <link href="css/catalogoLista.css" rel="alternate stylesheet" media="all" type="text/css" title="lista">

        <script src="js/styleswitcherFGI.js" type="text/javascript"></script>
        <script> 
            window.addEventListener("load",init) 
        function init(){
            var as = document.querySelector(".modovisual").getElementsByTagName("a");
            as[0].addEventListener("click",function(evt){
              cambiadorCss.setHojaCss("mosaico") ;
              evt.preventDefault();
            });
            as[1].addEventListener("click",function(evt){
              cambiadorCss.setHojaCss("lista") ; 
              evt.preventDefault();
            });
        
        }
    
        </script>
    </head>

    <body >
        <%@include file="cabecera.html" %> 
    
        
        
        <div class="sombra">
            <div class="nucleo">

                <div id="migas">
                    <a href="index.html" title="Inicio" >Inicio</a>&nbsp; | &nbsp; 
                    <a href="generica.html" title="Hojear catalogo">Hojear catalogo</a>	<!-- &nbsp; | &nbsp; 
                    <a href="..." title="Otra cosa">Otra cosa</a>   -->	
                </div>
                <div class="contenido">
                    <h1>Nuestros productos</h1>
                    <p>Puede buscar los productos que necesite en nuestro cat&aacute;logo. Lo hemos organizado por marcas, tipo de electrodom&eacute;stico y rango de precios. Lo precios indicados en rojo corresponden a ofertas. </p>
                    <div class="filtroCatalogo">
                        <form name="filtroCatalogo" id="filtroCatalogo" action="BuscarArticulos">

                            <label for="tipo">Tipo: </label>
                            <select name="tipo" id="tipo">
                                <option value="-1">- Cualquiera -</option>
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

                            <label for="fabricante">Fabricante: </label>
                            <select name="fabricante" id="fabricante">
                                <option value="-1">- Cualquiera -</option>
                                <option value="Edesa">Edesa</option>
                                <option value="Fagor">Fagor</option>
                                <option value="Miele">Miele</option>
                            </select>

                            <label for="precio">Precio: </label>
                            <select name="precio" id="precio">
                                <option value="-1">- Cualquiera -</option>
                                <option value="10-50">10-50 &euro;</option>
                                <option value="50-100">50-100 &euro;</option>
                                <option value="100-200">100-200 &euro;</option>
                                <option value="200-500">200-500 &euro;</option>
                                <option value="500-1000">500-1000 &euro;</option>
                                <option value="1000">Mas de 1000 &euro;</option>
                            </select>

                            <p>
                                <label for="nomArt">Búsqueda por nombre </label>
                                <textarea id="w3review" name="nomArt" rows="1" cols="50"></textarea>
                            </p>
                            <br>
                            <label for="codArt">Búsqueda por código </label>
                            <textarea id="w3review" name="codArt" rows="1" cols="50"></textarea>

                            <p>
                                <input name="buscar" id="buscar" type="image" title="Buscar" src="img/search25.png" alt="Buscar">
                            </p>
                        </form>

                        <div class="modovisual">
                            <a href="catalogo.html">Mosaico</a> &nbsp; | &nbsp; <a href="catalogo.html">Lista</a>
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
                            <li class="item redondeo">
                                <div class="foto">
                                    <a href="FichaArticulo?codArt=${art.codigo}"><img src="img/fotosElectr/${art.foto}" alt="${art.nombre}" longdesc="${art.descripcion}" width="80"></a>



                                </div>
                                <div class="datos">
                                    <a href="FichaArticulo?codArt=${art.codigo}"><span>${art.nombre}</span>
                                        <div class="precio">
                                            <span class="oferta">${art.pvp} &euro;</span>
                                        </div>
                                        <div class="carro">
                                            <a href="clientes/GestionaPedido?codArt=${art.codigo}&accion=comprar"><img src="img/shopcartadd_16x16.png" title="Añadir a mi carro de la compra">
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