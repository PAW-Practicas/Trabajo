/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sol.ser;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.GestorBD;
import paw.bd.GestorBDPedidos;
import paw.model.Articulo;
import paw.model.Cliente;
import paw.model.ExcepcionDeAplicacion;
import paw.model.LineaEnRealizacion;
import paw.model.PedidoEnRealizacion;
import paw.util.UtilesString;

/**
 *
 * @author usuario
 */
public class Carrito extends HttpServlet {

    private static GestorBDPedidos gbp = new GestorBDPedidos();
    private static GestorBD gbd = new GestorBD();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        try {
            String codArt =(String) request.getAttribute("codArt");
            if(codArt==null||UtilesString.isVacia(codArt)){
                response.sendRedirect("carrito.jsp");
                return;
            }
            
            
            Cliente c = (Cliente) request.getSession().getAttribute("cliente");
            PedidoEnRealizacion carrito = (PedidoEnRealizacion) request.getSession().getAttribute("carrito");
            if (carrito == null) {
                carrito = new PedidoEnRealizacion(c);
            }
            
                Articulo ar = gbd.getArticulo(codArt);
            if(ar==null){
                response.sendError(404,"El codigo de artículo no es correcto");
                return;
            }
                
            if (accion.equals("comprar")) {

                carrito.addLinea(ar);
                gbp.grabaPedidoEnRealizacion(carrito);

                request.getSession().setAttribute("carrito", carrito);
                
               
            }

            if (accion.equals("quitar")) {

                carrito.removeLinea(ar.getCodigo());

                carrito.addLinea(ar);
                gbp.grabaPedidoEnRealizacion(carrito);

                request.getSession().setAttribute("carrito", carrito);
            }
            
            response.sendRedirect("carrito.jsp");

        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(Carrito.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
