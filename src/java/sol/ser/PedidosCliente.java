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
import paw.bd.GestorBDPedidos;
import paw.model.Cliente;
import paw.model.ExcepcionDeAplicacion;
import paw.model.Pedido;
import paw.model.PedidoAnulado;
import paw.model.PedidoEnRealizacion;

/**
 *
 * @author usuario
 */
public class PedidosCliente extends HttpServlet {
    private static final  GestorBDPedidos gbp= new GestorBDPedidos();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        
        try {
            Cliente c=(Cliente)request.getSession().getAttribute("cliente");
            if(c!=null){
            
            List<Pedido> pedPendientes = gbp.getPedidosPendientes(c.getCodigo());
            List<Pedido> pedCompletados=gbp.getPedidosCompletados(c.getCodigo());
            List<PedidoAnulado> pedAnulados=gbp.getPedidosAnulados(c.getCodigo());
            
            
            PedidoEnRealizacion carrito = (PedidoEnRealizacion)request.getSession().getAttribute("carrito");
            if(carrito == null){
                carrito=gbp.getPedidoEnRealizacion(c.getCodigo());
                request.getSession().setAttribute("carrito", carrito);
            }
            
            request.setAttribute("carrito",carrito);
            request.setAttribute("pedPendientes", pedPendientes);
            request.setAttribute("pedCompletados", pedCompletados);
            request.setAttribute("pedAnulados", pedAnulados);
            request.setAttribute("cliente", c);

            RequestDispatcher rd = request.getRequestDispatcher("pedidosClientes.jsp");
            rd.forward(request, response);
            }
        
        
        
        
        
        
        
        
        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(PedidosCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }


}
