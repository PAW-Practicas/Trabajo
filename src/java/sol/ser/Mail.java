/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sol.ser;

import java.io.IOException;
import java.net.InetAddress;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.model.Cliente;
import paw.util.mail.DatosCorreo;
import paw.util.mail.GestorCorreo;
import paw.util.mail.conf.ConfiguracionCorreo;

/**
 *
 * @author juanp
 */
public class Mail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            Cliente c = (Cliente)request.getAttribute("cliente");
            request.getSession().setAttribute("cliente", c);
            
            
            
            String email= request.getParameter("email");
            DatosCorreo mail = new DatosCorreo("hesolar@unirioja.es", "hectorsolar99@gmail.com" , "Bienvenido a electrosa.com","Es un placer para nosotros tenerle como cliente. Visite nuestra web en la dirección:\n" +
"http://localhost:8080/PAW-pr5/");
            mail.setMimeType("utf-8");
            GestorCorreo.envia(mail, ConfiguracionCorreo.getDefault());
            response.sendRedirect("clientes/AreaCliente");
        } catch (AddressException ex) {
            Logger.getLogger(Mail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(Mail.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        

    }


}
