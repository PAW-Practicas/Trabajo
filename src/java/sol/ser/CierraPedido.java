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
import paw.model.Cliente;
import paw.model.ExcepcionDeAplicacion;
import paw.model.Pedido;
import paw.model.PedidoEnRealizacion;

/**
 *
 * @author usuario
 */
public class CierraPedido extends HttpServlet {

    private static final GestorBDPedidos gbp = new GestorBDPedidos();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            PedidoEnRealizacion pedidoACerrar = (PedidoEnRealizacion) request.getSession().getAttribute("pedidoACerrar");
            if (pedidoACerrar == null) {
                response.sendError(400, "La aplicacion no puede determinar el pedido a cerrar");
                return;
            }
            String accion = request.getParameter("accion");
            if (accion.equals("cerrar")) {

                Cliente c = (Cliente) request.getSession().getAttribute("cliente");

                Pedido p =gbp.cierraPedido(pedidoACerrar, c.getDireccion());
                request.getSession().removeAttribute("carrito");
                request.getSession().removeAttribute("pedidoACerrar");
                
                request.setAttribute("pedido", p);
                RequestDispatcher rd = request.getRequestDispatcher("pedido.jsp");
                rd.forward(request, response);

                return;

            } else {
                request.getSession().removeAttribute("pedidoACerrar");
                response.sendRedirect("carrito.jsp");
            }

        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(CierraPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
