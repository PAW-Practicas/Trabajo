/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sol.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import paw.util.UtilesString;

/**
 *
 * @author usuario
 */
public class AnularPedido extends HttpServlet {

    private static GestorBDPedidos gbp = new GestorBDPedidos();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String codPedido = request.getParameter("codPedido");

            if (UtilesString.isVacia(codPedido) || codPedido == null) {
                response.sendError(400, "Ha introducido un pedido nulo");
            }

            Cliente c = (Cliente) request.getSession().getAttribute("cliente");

            List<Pedido> pedidosPendientes = gbp.getPedidosPendientes(c.getCodigo());
            if (pedidosPendientes == null) {
                response.sendError(404, "No existen pedidos de este cliente");
            }

            request.getParameter("codPedido");

            for (Pedido p : pedidosPendientes) {
                if (p.getCodigo().equals(codPedido)) {
                    gbp.anulaPedido(p);
                    response.sendRedirect("PedidosCliente");
                    return;
                }
            }
            response.sendError(404, "No existen este pedido");

        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(AnularPedido.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
