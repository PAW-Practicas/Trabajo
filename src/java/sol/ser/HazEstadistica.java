/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sol.ser;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.GestorBDPedidos;
import paw.model.ExcepcionDeAplicacion;
import paw.util.UtilesString;

/**
 *
 * @author usuario
 */
@WebServlet(name = "HazEstadistica", urlPatterns = {"/admin/HazEstadistica"})
public class HazEstadistica extends HttpServlet {
    private static GestorBDPedidos gbp= new GestorBDPedidos();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("tipo");
        String anio = request.getParameter("anio");
        String num = request.getParameter("num");
        if (UtilesString.isVacia(tipo) || UtilesString.isVacia(anio) || UtilesString.isVacia(num)) {
            RequestDispatcher rd = request.getRequestDispatcher("estadistica.jsp");
            rd.forward(request, response);
            return;
        }
        else{
            int year= Integer.parseInt(anio);
            int number = Integer.parseInt(num );
            try {
              String ventas=  gbp.getEstadisticaVentasJSON(year, tipo, number);
              request.setAttribute("ventas", ventas);
              request.setAttribute("anio",anio);
              request.setAttribute("tipo",tipo);
                RequestDispatcher rd = request.getRequestDispatcher("estadistica.jsp");
                 rd.forward(request, response);
                
            } catch (ExcepcionDeAplicacion ex) {
                Logger.getLogger(HazEstadistica.class.getName()).log(Level.SEVERE, null, ex);
            }
                    
        }
    
    }

}
