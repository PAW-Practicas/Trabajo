<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="fontawesome/css/all.min.css" rel="stylesheet">
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" lang="es-ES">
        <title>Registro</title>
        <meta name="description" content="Aplicación de prueba de Programación de aplicaciones Web; Grado en informática; Universidad de La Rioja." lang="es-ES">
        <meta name="keywords" content="electrodomesticos" lang="es-ES">
        <meta name="language" content="es-ES">
        <meta name="robots" content="index,follow">

        <link href="css/electrosa.css" rel="stylesheet" media="all" type="text/css">
        <link href="css/formulario.css" rel="stylesheet" media="all" type="text/css">
        <script src="js/Ejercicio3.js" type="text/javascript" defer></script>    
    </head>

    <body >
        <script>
            window.addEventListener("load", ej4_9);
            function ej4_9(e) {

                //parte izq
                var cp = document.getElementById("cp");
                cp.addEventListener("change", f);

            }

            function f(e) {

                var cp = e.currentTarget
                var provincia = cp.value

                axios('api/GetProvincia', {
                    params: {cp: provincia},
                    responseType: 'text'
                }).then(response => {
                    var respuesta = response.data
                    var provincia = document.getElementById("provincia");
                    if (respuesta !== null)
                        provincia.value = respuesta

                }).catch(err => {
                    alert('Error [' + err + ']')
                })



            }


        </script>

        <%@include file="cabecera.html" %>  
        <script src="js/ej3.js" type="text/javascript"></script>

        <div class="sombra">
            <div class="nucleo">
                <div id="migas">
                    <a href="index.html" title="Inicio" >Inicio</a><!-- &nbsp; | &nbsp; 
                    <a href="..." title="Otra cosa">Otra cosa</a>   -->	
                </div>

                <div class="contenido">

                    <h1>Registro de cliente   </h1>
                    <p>Para poder realizar pedidos on-line a trav&eacute;s de nuestro sistema de pedidos es necesario que se registre. Desde Electrosa le agradecemos su confianza en nosotros. </p>
                    <p>Introduzca los datos solicitados mediante el  siguiente formulario.   </p>


                    <c:if test="${Error != null}">

                        <div class="alerta">
                            <c:forEach var="er" items="${Error}">  
                                ${er} 
                                <br>
                            </c:forEach>
                        </div>    
                    </c:if>
                    <form name="fCliente" id="fCliente" action="" method="post">
                        <fieldset> 
                            <legend>Datos de la empresa </legend> 
                            <div class="field">
                                <label for="nombre">Raz&oacute;n social :
                                    <c:if test="${RazonSocial == null}">
                                        <span class="Requerido">Requerido</span>
                                    </c:if>
                                </label>
                                <input type="text" name="nombre" id="nombre" size="63" value="${RazonSocial}">
                            </div>
                            <div class="field">
                                <label for="cif">CIF:
                                    <c:if test="${CIF == null}">
                                        <span class="Requerido">Requerido</span>
                                    </c:if>    
                                </label>
                                <input type="text" name="cif" id="cif" maxlength="12" size="15" value="${CIF}" />
                            </div>
                            <div class="field">
                                <label for="calle">Dirección:

                                    <c:if test="${Direccion == null}">
                                        <span class="Requerido">Requerido</span>
                                    </c:if>       
                                </label>            
                                <input class="text" type="text" name="calle" id="calle" size="63" value="${Direccion}" />
                            </div>

                            <div>
                                <div class="left">
                                    <div class="field">
                                        <label for="ciudad">Población:
                                            <c:if test="${Poblacion == null}">
                                                <span class="Requerido">
                                                </c:if>    
                                                Requerido</span></label>
                                        <input class="text" size="15" type="text" name="ciudad" id="ciudad" value="${Poblacion}" />
                                    </div>
                                    <div class="field">
                                        <label for="cp">C.P.:

                                            <c:if test="${CP == null}">
                                                <span class="Requerido">Requerido</span>
                                            </c:if>
                                        </label>
                                        <input class="text" type="text" name="cp" id="cp" size="10" value="${CP}" maxlength="5" />
                                    </div>
                                </div>					
                                <!--
                                A Coruña,Álava,Albacete,Alicante,Almería,Araba,Asturias,Ávila,Badajoz,Baleares,Barcelona,Bizkaia,Burgos,Cáceres,Cádiz,Cantabria,Castellón,Ceuta,Ciudad Real,Córdoba,Cuenca,Gerona,Gipuzkoa,Girona,Granada,Guadalajara,Huelva,Huesca,Illes Balears,Jaén,La Coruña,La Rioja,Las Palmas,León,Lérida,Lleida,Lugo,Madrid,Málaga,Melilla,Murcia,Navarra,Orense,Ourense,Palencia,Pontevedra,Salamanca,Santa Cruz de Tenerife,Segovia,Sevilla,Soria,Tarragona,Teruel,Toledo,Valencia,Valladolid,Vizcaya,Zamora,Zaragoza
                                -->
                                <div class="right">
                                    <div class="field">
                                        <label for="provincia">Provincia:
                                            <c:if test="${empty provincia}">
                                                <span class="Requerido">Requerido</span>
                                            </c:if>

                                        </label>					
                                        <select name="provincia" id="provincia">

                                            <c:if test="${! empty provincia}">
                                                <option value="${provincia}">${provincia}</option>
                                            </c:if>

                                            <option value="">- Elige -</option>
                                            <option value="A Coruña">A Coruña</option>
                                            <option value="Álava">Álava</option>
                                            <option value="Albacete">Albacete</option>
                                            <option value="Alicante">Alicante</option>
                                            <option value="Almería">Almería</option>
                                            <option value="Araba">Araba</option>
                                            <option value="Asturias">Asturias</option>
                                            <option value="Ávila">Ávila</option>
                                            <option value="Badajoz">Badajoz</option>
                                            <option value="Baleares">Baleares</option>
                                            <option value="Barcelona">Barcelona</option>
                                            <option value="Bizkaia">Bizkaia</option>
                                            <option value="Burgos">Burgos</option>
                                            <option value="Cáceres">Cáceres</option>
                                            <option value="Cádiz">Cádiz</option>
                                            <option value="Cantabria">Cantabria</option>
                                            <option value="Castellón">Castellón</option>
                                            <option value="Ceuta">Ceuta</option>
                                            <option value="Ciudad Real">Ciudad Real</option>
                                            <option value="Córdoba">Córdoba</option>
                                            <option value="Cuenca">Cuenca</option>
                                            <option value="Gerona">Gerona</option>
                                            <option value="Gipuzkoa">Gipuzkoa</option>
                                            <option value="Girona">Girona</option>
                                            <option value="Granada">Granada</option>
                                            <option value="Guadalajara">Guadalajara</option>
                                            <option value="Guipuzcoa">Guipuzcoa</option>
                                            <option value="Huelva">Huelva</option>
                                            <option value="Huesca">Huesca</option>
                                            <option value="Illes Balears">Illes Balears</option>
                                            <option value="Jaén">Jaén</option>
                                            <option value="La Coruña">La Coruña</option>
                                            <option value="La Rioja">La Rioja</option>
                                            <option value="Las Palmas">Las Palmas</option>
                                            <option value="León">León</option>
                                            <option value="Lérida">Lérida</option>
                                            <option value="Lleida">Lleida</option>
                                            <option value="Lugo">Lugo</option>
                                            <option value="Madrid">Madrid</option>
                                            <option value="Málaga">Málaga</option>
                                            <option value="Melilla">Melilla</option>
                                            <option value="Murcia">Murcia</option>
                                            <option value="Navarra">Navarra</option>
                                            <option value="Orense">Orense</option>
                                            <option value="Ourense">Ourense</option>
                                            <option value="Palencia">Palencia</option>
                                            <option value="Pontevedra">Pontevedra</option>
                                            <option value="Salamanca">Salamanca</option>
                                            <option value="Santa Cruz de Tenerife">Santa Cruz de Tenerife</option>
                                            <option value="Segovia">Segovia</option>
                                            <option value="Sevilla">Sevilla</option>
                                            <option value="Soria">Soria</option>
                                            <option value="Tarragona">Tarragona</option>
                                            <option value="Teruel">Teruel</option>
                                            <option value="Toledo">Toledo</option>
                                            <option value="Valencia">Valencia</option>
                                            <option value="Valladolid">Valladolid</option>
                                            <option value="Vizcaya">Vizcaya</option>
                                            <option value="Zamora">Zamora</option>
                                            <option value="Zaragoza">Zaragoza</option>
                                        </select>
                                    </div>
                                    <div class="field">
                                        <label for="tfno">Teléfono:<!--<span class="Requerido">Requerido</span> --></label>
                                        <input class="text" type="text" name="tfno" id="tfno" value="${Telefono}" />
                                    </div>
                                </div>		
                            </div>

                            <div class="field">
                                <label for="email">Email:
                                    <c:if test="${Email == null}">
                                        <span class="Requerido"> Requerido</span>
                                    </c:if>   
                                </label>
                                <input class="text" type="email" name="email" id="email" size="40" value="${Email}" />
                            </div>
                        </fieldset>

                        <fieldset> 
                            <legend>Datos de acceso</legend>
                            <div class="field">
                                <label for="login">Nombre de usuarios:
                                    <c:if test="${empty login }">
                                        <span class="Requerido">Requerido</span>
                                    </c:if>    
                                </label>
                                <input class="text" type="text" name="login" id="login" size="10" value="${login}" />
                            </div>

                            <div>
                                <div class="left">
                                    <div class="field">
                                        <label for="pwd">Contraseña:

                                            <c:if test="${empty pwd}">
                                                <span class="Requerido">Requerido</span>
                                            </c:if>
                                        </label>
                                        <input class="text" type="password" name="pwd" id="pwd" size="10" value="${pwd}" />
                                        <a href="#" class="verContr"><span class="fas fa-eye-slash"></span></a>
                                    </div>
                                </div>					

                                <div class="right">
                                    <div class="field">
                                        <label for="rpwd">Repita contraseña:
                                            <c:if test="${empty rpwd}">
                                                <span class="Requerido">Requerido</span></label>
                                            </c:if>
                                        <input class="text" type="password" name="rpwd" id="rpwd" size="10" value="${rpwd}" />
                                        <a href="#" class="verContr"><span class="fas fa-eye-slash"></span></a>
                                    </div>
                                </div>		
                            </div>
                        </fieldset>

                    <fieldset>
                                        
                        
                    <legend> Captcha </legend>
                   <div class="g-recaptcha" data-sitekey="6LevlBcbAAAAAOiERcYFRxMO-kwOFqY6lBC0sJi0"></div>
                   <script src='https://www.google.com/recaptcha/api.js'></script>                
                   </fieldset>              
                                        
                        <fieldset class="submit"> 
                            <div class="left">
                                <div class="field">	


                                    <input type="checkbox" name="privacidad" value="1" id="privacidad"> 
                                    <label for="privacidad" style="float:none">He leido y acepto la <a href="privacidad.html">Pol&iacute;tica de privacidad</a></label>



                                </div>
                            </div>
                            <div class="right">
                                <div class="field">
                                    <input class="submitb" type="submit"  value="Enviar los datos" />  
                                </div>
                            </div>
                        </fieldset>  
                    </form>

                </div>

            </div>


            <%@include file="pie.html" %>  


        </div>
    </body>
</html>