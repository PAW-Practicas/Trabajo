package sol.ser;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.GestorBD;
import paw.model.Cliente;
import paw.model.ExcepcionDeAplicacion;
import paw.util.UtilesString;

/**
 *
 * @author hesolar
 */
public class Login extends HttpServlet {

    private static GestorBD gbd= new GestorBD();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          request.setAttribute("Error", null);
          RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
          rd.forward(request, response);
    }
    @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            String user=request.getParameter("usr");
            String password=request.getParameter("pwd");
            
         
            
            if(UtilesString.isVacia(user)|UtilesString.isVacia(password)){
                request.setAttribute("Error", "Rellena bien tus datos!");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");             
                rd.forward(request, response);
                return ;
            }
            else{
                if(gbd.comprobarLogin(user,password )){               
                Cliente c = gbd.getClienteByUserName(user);
                request.getSession().setAttribute("cliente", c);
                
                request.getSession().setAttribute("rolCliente", true);
                response.sendRedirect("clientes/AreaCliente");
                }
                else{
                    request.setAttribute("Error", "Credenciales incorrectas");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            }
            
            
        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
          
    }

}
