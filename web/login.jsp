<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="your-path-to-fontawesome/css/all.min.css" rel="stylesheet">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Login</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link href="css/entrada.css" rel="stylesheet" media="all" type="text/css">
    <script type="text/javascript">
      window.onload = function() {
        document.getElementById("usr").focus();
      };
    </script>
  </head>

  <body >
    <div class="logo"><a href="index.html"><img src="img/LogoElectrosa200.png" border="0"></a></div>

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
          <div class="pestaniaNoSel"><a href="admin/index.html">Intranet</a></div>
        </div>
      </div>

      <div id="menu" >
        <ul>
          <li>
            <a href="index.html">Sobre electrosa<br/><img src="img/Home4.png"/></a>
          </li>
          <li>
            <a href="index.html">Dónde estamos<br/><img src="img/map.png"/></a>
          </li>
          <li>
            <a href="BuscarArticulos">Hojear catálogo<br/><img src="img/catalog.png"/></a>
          </li>
          <li>
            <a href="clientes/AreaCliente">Usuario registrado<br/><img src="img/registrado.png"/></a>
          </li>
        </ul>
        <div style="clear: left;"></div>
      </div>
    </div> 

    <div class="sombra">
      <div class="nucleo">
        <div id="migas">
          <a href="index.html" title="Inicio" >Inicio</a><!-- &nbsp; | &nbsp; 
          <a href="..." title="Otra cosa">Otra cosa</a>   -->	
        </div>

        <div class="contenido">

          <h1>Acceso de usuario registrado</h1> 

          
          <c:if test="${Error!=null}">
             <div class="alerta">
              ${Error}
             </div>    
          </c:if>
          
         
          <form name="flogin" id="flogin" class="izda" action="Login" method="post">
            <fieldset> 
              <div class="field">
                <label for="usr">Nombre de usuario :</label>
                <input type="text" name="usr" id="usr" size="10"/>
              </div>

              <div class="field">
                <label for="pwd">Contraseña:</label>
                <input type="password" name="pwd" id="pwd" size="10" />
              </div>

              <div class="dcha">
                <div class="field">
                  <input class="submitb" type="submit"  value="Acceder" />  
                </div>
              </div>
              <div style="clear:right"></div>
              <div class="field">
                <a href="recuerdo.html">&iquest;Olvid&oacute; su contrase&ntilde;a? </a></div>
            </fieldset>  
          </form>



          <div class="nuevo izda">
            <div>
              <p style="font-weight:bold; margin-top:5px">Nuevo cliente.</p>
              <p style="margin-top:5px;line-height:1.4em;">Para poder realizar pedidos on-line a través de nuestro sistema de pedidos es necesario que se registre </p>
            </div>
			
           <div  class="registrob">
             <a href="NuevoCliente">REGISTRESE</a>
            </div> 
          </div>		  

          <div class="clear"> </div>
        </div>
      </div>

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
