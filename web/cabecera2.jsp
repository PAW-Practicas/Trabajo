<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>




        <div class="logo"><a href="index.jsp"><img src="img/LogoElectrosa200.png" border="0"></a></div>

        <div class="sombra">
            <div class="nucleo">
                <div id="lang">
                    <a href="index.jsp?lang=es_ES">Español</a> &nbsp; | &nbsp; <a href="index.jsp?lang=en_GB">English</a>
                </div>
            </div>
        </div>

        <div class="barra_menus">	
            <div class="pestanias">
                <div class="grupoPestanias">
                    <div class="pestaniaSel">Para usuarios</div>
                    <div class="pestaniaNoSel"><a href="admin/index.html"><fmt:message key="pest.intra"/></a></div>
                </div>
            </div>

            <div id="menu" >
                <ul>
                    <li>
                        <a href="index.jsp"><fmt:message key="pest.usr.sobre"/><br/><img src="img/Home4.png"/></a>
                    </li>
                    <li>
                        <a href="donde.jsp"><fmt:message key="pest.usr.donde"/><br/><img src="img/map.png"/></a>
                    </li>
                    <li>
                        <a href="catalogo.jsp"><fmt:message key="pest.usr.catalogo"/><br/><img src="img/catalog.png"/></a>
                    </li>
                    <li>
                        <a href="clientes/AreaCliente"><fmt:message key="pest.usr.reg"/> <br/><img src="img/registrado.png"/></a>
                    </li>
                </ul>
                <div style="clear: left;"></div>
            </div>
        </div> 
   
