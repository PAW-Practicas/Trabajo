/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sol.ser;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.GestorBDPedidos;
import paw.model.Almacen;
import paw.model.ExcepcionDeAplicacion;
import paw.model.PedidoEnRealizacion;

/**
 *
 * @author usuario
 */
public class AnulaCarrito extends HttpServlet {

    private static GestorBDPedidos gbp = new GestorBDPedidos();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Almacen a;
            
            
            PedidoEnRealizacion carrito = (PedidoEnRealizacion) request.getSession().getAttribute("carrito");
            if (carrito == null) {
                response.sendError(400, "Bad Request");
            }
            String accion = request.getParameter("accion");
            if (accion.equals("anular")) {

                gbp.anulaPedido(carrito);
                request.getSession().removeAttribute("carrito");
                request.getSession().removeAttribute("pedidoACancelar");
                response.sendRedirect("VerPedido");
                return;
                
            }
            if (accion.equals("cancelar")) {
               request.getSession().removeAttribute("pedidoACancelar");
                RequestDispatcher rd = request.getRequestDispatcher("Carrito");
                rd.forward(request, response);
                return;
            }
        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(AnulaCarrito.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
