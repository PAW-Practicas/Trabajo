<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
    <title>Bienvenido a Electrosa</title>
    <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
    <meta name="keywords" content="electrodomesticos" lang="es-ES">
    <meta name="language" content="es-ES">
    <meta name="robots" content="index,follow">

    <link href="../css/electrosa.css" rel="stylesheet" media="all" type="text/css">
    <link href="../css/clientes.css" rel="stylesheet" media="all" type="text/css">
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
          <a href="AreaCliente" title="Área de cliente">Área de cliente</a>   
        </div>
        <div id="cliente">
          Bienvenido, ${cliente.nombre}
        </div>
        <div class="clear"></div>
        <div class="contenido">
          <h1>&Aacute;rea de clientes  </h1>
          <p>Muchas gracias por confiar en nosotros. En Electrosa haremos todo lo posible para que su trato con nostros sea lo m&aacute;s ventajoso para su empresa. </p>
        </div><div class="centro">
          <ul>
            <li class="columna">  
              <ul>  
                <li class="celda">
                  <div class="parteCelda">
                    <a href=../"generica.html"><img src="../img/motif_b2c_1_194.jpg" alt="" title=""></a>
                  </div>
                  <div class="parteCelda2">
                    <h3><a href="../generica.html">El mejor Servicio de Mantenimiento</a></h3>
                    Quién mejor que Electrosa para cuidar&nbsp;sus electrodomésticos
                    <div style="float:right; padding:10px 5px">
                      <a style="padding:5px 8px 5px 10px;background:#5C7E72;color:#FFF" href="../generica.html" ><span>Sepa por qu&eacute; ...</span> </a>
                    </div>
                  </div>
                  <div class="clear"></div>
                </li> 
                <li class="celda">
                  <div class="parteCelda">
                    <a class="parteCelda" href="../generica.html"><img src="../img/imag_teaser_encuentre-solucion.jpg" alt="" title="" ></a>
                  </div>
                  <div class="parteCelda2">
                    <h3><a href="../generica.html">Encuentre la solución más adecuada</a></h3>
                    Descubra&nbsp;el producto que necesita&nbsp;
                    <div style="float:right; padding:10px 5px">
                      <a style="padding:5px 8px 5px 10px;background:#5C7E72;color:#FFF" href="../generica.html" ><span>Comenzar ...</span> </a>
                    </div>
                  </div>
                  <div class="clear"></div>
                </li> 
              </ul>
            </li>

            <li class="columna"> 
              <ul>  
                <li class="celda">
                  <div class="parteCelda">
                    <a href="../generica.html"><img src="../img/registre-garantia.jpg" alt="" title=""></a>
                  </div>
                  <div class="parteCelda2">
                    <h3 ><a href="../generica.html">Garantía y Puesta en Marcha</a></h3>
                    Solicite su Garantía y Puesta en Marcha gratuita
                    <div style="float:right; padding:10px 5px">
                      <a style="padding:5px 8px 5px 10px;background:#5C7E72;color:#FFF" href="../generica.html" ><span>Registrar ...</span> </a>
                    </div>
                  </div>
                  <div class="clear"></div>
                </li> 
                <li class="celda">
                  <div class="parteCelda">
                    <a href="../generica.html"><img src="../img/atencion-cliente.jpg" alt="" title=""></a>
                  </div>
                  <div class="parteCelda2">
                    <h3><a href="../generica.html">Atención al Cliente</a></h3>
                    Contacte con Electrosa<br><strong>999 99 99 99</strong>
                    <div style="float:right; padding:10px 5px">
                      <a style="padding:5px 8px 5px 10px;background:#5C7E72;color:#FFF" href="../generica.html" ><span>M&aacute;s ...</span> </a>
                    </div>
                  </div>
                  <div class="clear"></div>
                </li> 			
              </ul>
            </li>
          </ul>

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

