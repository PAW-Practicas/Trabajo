package sol.ser;

import java.io.IOException;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.GestorBD;
import paw.bd.GestorBDPedidos;
import paw.model.Almacen;
import paw.model.Cliente;
import paw.model.ExcepcionDeAplicacion;
import paw.model.LineaEnRealizacion;
import paw.model.PedidoEnRealizacion;
import paw.util.servlet.ParameterParser;


public class GestionaPedido extends HttpServlet {

    private static GestorBDPedidos gbp = new GestorBDPedidos();
    private static GestorBD gbd = new GestorBD();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
//           for (Almacen a : gbd.getAlmacenes()){
//               a.getCoordX()
//           }
            
            
            String accion = request.getParameter("accion");
            String codArt = request.getParameter("codArt");
            PedidoEnRealizacion carrito = (PedidoEnRealizacion) request.getSession().getAttribute("carrito");
            Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");
            
            if(carrito==null)carrito=gbp.getPedidoEnRealizacion(cliente.getCodigo());
            if(carrito==null)carrito = new PedidoEnRealizacion(cliente);
            
            
            if (codArt != null) {
                
                if (accion.equals("comprar")) {
                    request.setAttribute("accion", "comprar");
                    request.setAttribute("codArt", codArt);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("Carrito");
                    rd.forward(request, response);
                    
                    return;
                }
                
                if (accion.equals("quitar")) {
                    request.setAttribute("accion", "quitar");
                    request.setAttribute("codArt", codArt);
                    response.sendRedirect("Carrito");
                    return;
                }
                
                if (accion.equals("cancelar")) {
                    request.setAttribute("msg", "¿Desea cancelar el pedido:" + carrito.getCodigo());
                    request.setAttribute("accion", "cancelar");
                    request.setAttribute("codArt", codArt);
                    RequestDispatcher rd = request.getRequestDispatcher("confirmacion.jsp");
                    rd.forward(request, response);
                    return;
                }
                
            }
        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(GestionaPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PedidoEnRealizacion carrito = (PedidoEnRealizacion) request.getSession().getAttribute("carrito");

        procesaParams(carrito, request);
        String accion = request.getParameter("accion");
        String codArt = request.getParameter("codArt");

        if (accion.equals("Seguir comprando")) {

            response.sendRedirect("../catalogo.jsp");

        }
        if (accion.equals("Cerrar pedido")) {

            request.getSession().setAttribute("pedidoACerrar", carrito);
            request.setAttribute("siLink", "CierraPedido?accion=cerrar");
            request.setAttribute("noLink", "CierraPedido?accion=cancelar");
            request.setAttribute("msg", "¿Desea cerrar el pedido:" + carrito.getCodigo() + "?");
            RequestDispatcher rd = request.getRequestDispatcher("confirmacion.jsp");
            rd.forward(request, response);
        }

        if (accion.equals("Guardar pedido")) {
            try {
//                GestorBDPedidos.getPedidoEnRealizacion
                
                gbp.grabaPedidoEnRealizacion(carrito);
            
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
                return;
            } catch (ExcepcionDeAplicacion ex) {
                Logger.getLogger(GestionaPedido.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        if (accion.equals("Cancelar")) {
            request.getSession().setAttribute("pedidoACancelar", carrito);
              request.setAttribute("siLink", "AnulaCarrito?accion=anular");
            request.setAttribute("noLink", "AnulaCarrito?accion=cancelar");
            request.setAttribute("msg", "Va a proceder a eliminar su pedido en realización .¿Está usted seguro?");
            RequestDispatcher rd = request.getRequestDispatcher("confirmacion.jsp");
            rd.forward(request, response);
        }

    }

    private void procesaParams(PedidoEnRealizacion pedido, HttpServletRequest req) {
        ParameterParser pp = new ParameterParser(req);
        Enumeration<String> pnames = req.getParameterNames();
        while (pnames.hasMoreElements()) {
            String paramName = pnames.nextElement();
            if (paramName.startsWith("C_")) {
                String codLinea = paramName.substring(2);
                LineaEnRealizacion linea = pedido.getLinea(codLinea);
                int cantidad = pp.getIntParameter(paramName, 1);
                linea.setCantidad(cantidad);
            } else if (paramName.startsWith("F_")) {
                String codLinea = paramName.substring(2);
                LineaEnRealizacion linea = pedido.getLinea(codLinea);
                Calendar fe = pp.getCalendarParameter(paramName, "dd/MM/yyyy", Calendar.getInstance());
                linea.setFechaEntregaDeseada(fe);
            }
        }
    }

}
