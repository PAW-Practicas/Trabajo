/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sol.ser;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import paw.model.Cliente;

public class AreaCliente extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession hs= request.getSession();
        Cliente c = (Cliente) hs.getAttribute("cliente");
        
        if(c==null){
        response.sendRedirect("../Login");
        return;
        }
        else{
             request.setAttribute("nomCliente",c.getNombre());


          RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
          rd.forward(request, response);
        }
    }

    

}
