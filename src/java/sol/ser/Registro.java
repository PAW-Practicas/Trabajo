/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sol.ser;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.GestorBD;
import paw.model.Cliente;
import paw.model.Direccion;
import paw.model.ExcepcionDeAplicacion;
import paw.util.ReCaptchaException;
import paw.util.UtilesString;
import paw.util.Validacion;
import paw.util.servlet.UtilesServlet;

/**
 *
 * @author 34628
 */
public class Registro extends HttpServlet {

    private static GestorBD gbd = new GestorBD();
//public static paw.util.ReCaptchaValidator valCaptcha = new paw.util.ReCaptchaValidator("6LevlBcbAAAAAOiERcYFRxMO-kwOFqY6lBC0sJi0","6LevlBcbAAAAAIdEn7AFRrXO70lgSnwnlPjgmIIU ");
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("Error", null);
        RequestDispatcher rd = request.getRequestDispatcher("NuevoCliente.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        
        try {
            paw.model.Cliente c = (paw.model.Cliente) UtilesServlet.populateBean("paw.model.Cliente", request);
            paw.model.Direccion d = (paw.model.Direccion) UtilesServlet.populateBean("paw.model.Direccion", request);
            
            c.setDireccion(d);
            
            String usr = request.getParameter("login");
            String pwd = request.getParameter("pwd");
            String rpwd = request.getParameter("rpwd");
            String privacidadOK = request.getParameter("privacidad");
           
            if(UtilesString.isVacia(privacidadOK)) privacidadOK="0";
            List<String> l=valida(c, usr, pwd, rpwd, Integer.parseInt(privacidadOK), gbd);

                      


            
//            if(l.isEmpty()&& valCaptcha.verifyResponse(request)  ){
            if(l.isEmpty()){
                Cliente c2=gbd.insertaCliente(c, pwd, rpwd);
                request.getSession().setAttribute("cliente", c2);
                
                String email= request.getParameter("email");
                
                request.setAttribute("email",email);
                response.sendRedirect("Mail");
            }
            else{
                
                
                if(!l.contains("La longitud máxima del nombre son 50 caracteres"))request.setAttribute("RazonSocial", c.getNombre());
                if(!l.contains("La longitud máxima del CIF son 12 caracteres"))request.setAttribute("CIF", c.getCif());
                if(!l.contains("La longitud máxima del teléfono son 11 caracteres"))request.setAttribute("Telefono",c.getTfno());
                if(!l.contains("La longitud máxima del email son 100 caracteres")) request.setAttribute("Email", c.getEmail());
               
                if(!l.contains("La longitud máxima del userName son 50 caracteres")&&
                   !l.contains("El nombre de usuario tiene espacios en blanco") &&
                   !l.contains("Ya existe un usuario en la BD con ese nombre de usuario"))
                    request.setAttribute("login",usr);
                
                
                
                if(!l.contains("La longitud máxima de la calle son 50 caracteres"))request.setAttribute("Direccion", c.getDireccion().getCalle());
                if(!l.contains("La longitud máxima de la ciudad son 20 caracteres")) request.setAttribute("Poblacion",c.getDireccion().getCiudad()); 
                if(!l.contains("El CP no parece un código postal válido"))request.setAttribute("CP",c.getDireccion().getCp());
                request.setAttribute("pwd", pwd);
                 if(!l.contains("Las contraseñas son diferentes")) request.setAttribute("rpwd", rpwd);
                 
                 
                 
                 request.setAttribute("provincia",request.getParameter("provincia"));
                 
               
                request.setAttribute("gbd", gbd);
                request.setAttribute("Error", l);
            RequestDispatcher rd = request.getRequestDispatcher("NuevoCliente.jsp");
            rd.forward(request, response);
            }

        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        } 
//        catch (ReCaptchaException ex) {
//            
//             RequestDispatcher rd = request.getRequestDispatcher("NuevoCliente.jsp");
//            rd.forward(request, response);
//            
//            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
//        }
        
    }

   
    
    
    /**
     * Realiza las validaciones para los campos del formulario de registro de
     * nuevo cliente
     *
     * @param cli objeto paw.model.Cliente con los datos leídos del formulario
     * @param usr valor del campo "nombre de usuario" del formulario
     * @param pwd valor del campo "contraseña" del formulario
     * @param rpwd valor del campo "Repita contraseña" del formulario
     * @param privacidadOK debe tener valor 1 si la casilla de "Política de
     * privacidad" está marcada
     * @param gbd objeto GestorBD para ser usado en las comprobaciones que
     * requieran de conexión a al BD
     * @return Una lista de String con mensajes de error correspondientes a las
     * reglas de validación que no se cumplen
     * @throws ExcepcionDeAplicacion
     */
    private List<String> valida(Cliente cli,
            String usr,
            String pwd,
            String rpwd,
            int privacidadOK,
            GestorBD gbd)
            throws ExcepcionDeAplicacion, IOException {

        List<String> errores = new ArrayList<String>();

        if (UtilesString.isVacia(cli.getNombre())
                || UtilesString.isVacia(cli.getCif())
                || UtilesString.isVacia(cli.getDireccion().getCalle())
                || UtilesString.isVacia(cli.getDireccion().getCiudad())
                || UtilesString.isVacia(cli.getDireccion().getProvincia())
                || UtilesString.isVacia(cli.getDireccion().getCp())
                || UtilesString.isVacia(cli.getEmail())
                || UtilesString.isVacia(usr)
                || UtilesString.isVacia(pwd)
                || UtilesString.isVacia(rpwd)) {
            errores.add("Debes proporcionar valor para todos los campos requeridos");
        }

        if (cli.getNombre() != null && cli.getNombre().length() > 50) {
            errores.add("La longitud máxima del nombre son 50 caracteres");
        }

        if (cli.getCif() != null && cli.getCif().length() > 12) {
            errores.add("La longitud máxima del CIF son 12 caracteres");
        }

        if (cli.getTfno() != null && cli.getTfno().length() > 11) {
            errores.add("La longitud máxima del teléfono son 11 caracteres");
        }

        if (cli.getEmail() != null && cli.getEmail().length() > 100) {
            errores.add("La longitud máxima del email son 100 caracteres");
        }

        if (usr != null && usr.length() > 50) {
            errores.add("La longitud máxima del userName son 50 caracteres");
        }

        if (cli.getDireccion().getCalle() != null && cli.getDireccion().getCalle().length() > 50) {
            errores.add("La longitud máxima de la calle son 50 caracteres");
        }

        if (cli.getDireccion().getCiudad() != null && cli.getDireccion().getCiudad().length() > 20) {
            errores.add("La longitud máxima de la ciudad son 20 caracteres");
        }

        if (privacidadOK != 1) {
            errores.add("Debes leer la cláusula de privacidad y marcar la casilla correspondiente");
        }

        if (!UtilesString.isVacia(pwd) && !UtilesString.isVacia(rpwd) && !pwd.equals(rpwd)) {
            errores.add("Las contraseñas son diferentes");
        }

        if (!UtilesString.isVacia(usr) && usr.contains(" ")) {
            errores.add("El nombre de usuario tiene espacios en blanco");
        }

        if (!UtilesString.isVacia(usr) && gbd.getClienteByUserName(usr) != null) {
            errores.add("Ya existe un usuario en la BD con ese nombre de usuario");
        }

        if (!UtilesString.isVacia(cli.getCif()) && gbd.getClienteByCIF(cli.getCif()) != null) {
            errores.add("Ya existe un usuario en la BD con ese CIF");
            cli.setCif(null);
        }

        if (!UtilesString.isVacia(cli.getEmail()) && !Validacion.isEmailValido(cli.getEmail())) {
            errores.add("El email no parece una dirección de correo válida");
            cli.setEmail(null);
        }

        if (!UtilesString.isVacia(cli.getDireccion().getCp()) && !Validacion.isCPValido(cli.getDireccion().getCp())) {
            errores.add("El CP no parece un código postal válido");
            cli.getDireccion().setCp(null);
        }

        return errores;
    }

}
