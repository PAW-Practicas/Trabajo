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
import paw.model.Cliente;
import paw.model.ExcepcionDeAplicacion;
import paw.model.Pedido;

public class AnulaPedidoEnRealizacion extends HttpServlet {

    private static GestorBDPedidos gbp = new GestorBDPedidos();
    private static GestorBD gbd = new GestorBD();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String codPedido = request.getParameter("codPedido");

        
            if (accion.equals("anular")) {
                try {
                    Cliente c = (Cliente) request.getSession().getAttribute("cliente");
                    
                    List<Pedido> pedidosPendientes = gbp.getPedidosPendientes(c.getCodigo());

                    for (Pedido p : pedidosPendientes) {
                        if (p.getCodigo().equals(codPedido)) {
                            gbp.anulaPedido(p);
                        }

                    }
                    RequestDispatcher rd = request.getRequestDispatcher("AreaCliente");
                    rd.forward(request, response);
                    
                } catch (ExcepcionDeAplicacion ex) {
                    Logger.getLogger(AnulaPedidoEnRealizacion.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            if(accion.equals("cancelar")){
                 RequestDispatcher rd = request.getRequestDispatcher("carrito.jsp");
                 rd.forward(request, response);
            }

        

    }

}
