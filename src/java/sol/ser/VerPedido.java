/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sol.ser;

import com.google.gson.Gson;
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
import paw.model.Articulo;
import paw.model.Cliente;
import paw.model.ExcepcionDeAplicacion;
import paw.model.Linea;
import paw.model.Pedido;
import paw.util.UtilesString;

/**
 *
 * @author usuario
 */
public class VerPedido extends HttpServlet {
    private static GestorBDPedidos gbp = new GestorBDPedidos();
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String codPedido= request.getParameter("cp");
            
            if(UtilesString.isVacia(codPedido)){
            response.sendRedirect("PedidosCliente"); 
            return ;
            }
            
            
            Pedido p=gbp.getPedido(codPedido);
            if(p==null){
                response.sendError(404,"Código de pedido no válido("+codPedido+")");
                return;
            }
            
            
            
            Cliente c=  (Cliente) request.getSession().getAttribute("cliente");
          
            List<Pedido> pedPendientes = gbp.getPedidosPendientes(c.getCodigo());
            List<Pedido> pedCompletados = gbp.getPedidosCompletados(c.getCodigo());
            p.getLineas();

            
            if(request.getHeader("X-Requested-With")!=null){
                response.setContentType("application/json; charset=UTF-8");
                Gson gson = new Gson();
                String json = gson.toJson(p);
                response.getWriter().print(json);
                return;
            }
            
            
            
            if(pedPendientes.contains(p)||pedCompletados.contains(p)){
                 double PrecioPedido=0;
                 
               //funcional PrecioPedido = p.getLineas().stream().map(x -> x.getPrecioReal()).reduce(PrecioPedido, (accumulator, _item) -> accumulator + _item);
                for(Linea x : p.getLineas()){
                    PrecioPedido+=x.getPrecioReal();
                }
                  String opcionPedido;  
                opcionPedido= pedPendientes.contains(p)? "pendiente" : "";
                request.setAttribute("opcion", opcionPedido);
                
                request.setAttribute("precioTotal",PrecioPedido);
                request.setAttribute("cliente",c);
                request.setAttribute("pedido", p);
                RequestDispatcher rd = request.getRequestDispatcher("pedido.jsp");
                rd.forward(request, response);
                return ;
            }
            
            else{
                
                
            request.setAttribute("link", "../Salir");
            response.sendError(403,"Usted no está autorizado para consultar esta información");
            
            }

        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(VerPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }

    
}
