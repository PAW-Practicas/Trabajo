<%-- 
    Document   : nuevoArticulo
    Created on : 06-may-2021, 11:59:37
    Author     : hesolar
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Nuevo art&iacute;culo</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="../css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/formulario.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/clientes.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/estilomenu.css" rel="stylesheet" media="all" type="text/css" />
  </head>

  <body >
    <script src="../js/ej12doce.js" type="text/javascript"></script>
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
          <div class="pestaniaNoSel"><a href="../index.html">Para usuarios</a></div>
          <div class="pestaniaSel">Intranet</div>
        </div>
      </div>

      <div id="cssmenu">
        <ul>
          <li class='has-sub'><a href="index.html">Art&iacute;culos</a>
            <ul>
              <li><a href="listadoArticulos.jsp">Listar</a></li>
              <li><a href="NuevoArticulo">A&ntilde;adir</a> </li>
              <li><a href="HazEstadistica">Estadísticas</a> </li>
            </ul>
          </li>
          <li class='has-sub'><a href="index.html">Clientes</a>	
            <ul>
              <li><a href="index.html">Listar</a> </li>
              <li><a href="index.html">A&ntilde;adir</a> </li>
            </ul>    
          </li>
          <li><a href="index.html">Pedidos</a></li>
          <li class='last'><a href="index.html">Stocks</a></li>
        </ul>
        <div style="clear: left;"></div>
      </div>
    </div> 

    <div class="sombra">
      <div class="nucleo">
        <div id="migas">
          <a href="index.html" title="Inicio" >Inicio</a>
        </div>

        <div class="clear"></div>

        <div class="contenido">

          <h1>A&ntilde;adir un art&iacute;culo    </h1>
          <p>Utilice el siguiente formulario.   </p>

          
         <c:if test="${! empty errores }">
          <div class="alerta">
             <c:forEach var="msg" items="${errores}">                
              ${msg}               
             </c:forEach>
          </div>   
         </c:if>

          <form id="fArtic" name="fArtic" action="NuevoArticulo" method="post" enctype="multipart/form-data">
            <fieldset> 
              <legend>Datos del art&iacute;culo </legend> 
              <div class="field">
                
              
                <label for="nombre">Nombre:
                  <c:if test="${empty articulo.nombre }">
                  <span class='Requerido'>Requerido</span>
                  </c:if>
                </label>
                
                <input type="text" name="nombre" id="nombre" size="55" value="${articulo.nombre}">
              </div>
              <div class="field">
                <label for="pvp">P.V.P:
                  <c:if test="${empty articulo.getPvp() }">
                  <span class='Requerido'>Requerido</span>
                  </c:if>
                </label>
                <input type="text" name="pvp" id="pvp" size="15" value=" ${articulo.getPvp()}">
              </div>
              <div>
                <div class="left">
                  <div class="field">
                    <label for="tipo">Tipo:
                        
                      <c:if test="${empty articulo.getTipo() }">  
                      <span class='Requerido'>Requerido</span>
                       </c:if>
                    </label>
                    <select name="tipo" id="tipo">
                       <c:if test="${! empty articulo.getTipo() }">  
                           <option value="${articulo.getTipo()}"> ${articulo.getTipo()}</option> 
                       </c:if>
                       <c:if test="${empty articulo.getTipo() }">  
                           <option disabled selected value="">- Elige -</option> 
                       </c:if>
                                                 
                                        
                       <c:forEach var="tipo" items="${tipos}"> 
                            <option value="${tipo}">${tipo}</option>      
                       </c:forEach>
                    </select>       
                    <input id="otroTip" type="checkbox" name="" value="" title="Introduce otro tipo" />               
                    Otro 
                    <div id="otrotipoCont" style="clear:both".><label>&nbsp;</label><input class="text" type="text" name="tipo" id="tipo" value="" ></div>
                  </div>
                </div>
                <div class="right">
                  <div class="field">
                    <label for="fabricante">Fabricante:
                        
                     <c:if test="${empty articulo.getFabricante() }">  
                           <span class='Requerido'>Requerido</span>
                       </c:if>
                       
                      
                    </label>
                    <select name="fabricante" id="fabricante">
                        
                        
                      <c:if test="${empty articulo.getFabricante() }">  
                           <option disabled selected value="">- Elige -</option> 
                       </c:if>
                      <c:if test="${!empty articulo.getFabricante() }">  
                           <option value="${articulo.getFabricante()}">${articulo.getFabricante()}</option> 
                       </c:if>     
                           
                        <c:forEach var="f" items="${fabricantes}"> 
                            <option value="${f}">${f}</option>      
                       </c:forEach>                     
                    </select>
                    <input id="otroFab" type="checkbox" name="" value=""  title="Introduce otro fabricante"/>
                    Otro 
                    <div id="otrofabricanteCont" style="clear:both"><label>&nbsp;</label><input class="text" type="text" name="fabricante" id="fabricante" value="" ></div>
                  </div>
                </div>		
              </div>

              <div class="field">
                <label for="descripcion">
                  Descripci&oacute;n:
                </label>
                <textarea name="descripcion" id="descripcion" cols="70" rows="3">${articulo.getDescripcion()}</textarea>
              </div>
              
<style>
  .fotoBtn {
    width: auto;
    background:#5C7E72;
    padding:8px 10px 10px 10px;
    color:#FFF;
  }
</style>              

              <div class="field">
                <label for="fichFoto" class="fotoBtn">
                  Fichero fotograf&iacute;a
                </label>
                <input type="file" name="fichFoto" id="fichFoto" style="display:none">
              </div>


            </fieldset>


            <fieldset class="submit"> 
              <div class="right">
                <div class="field">
                  <input class="submitb" type="submit"  value="Enviar los datos" >  
                </div>
              </div>
            </fieldset>  
          </form>

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