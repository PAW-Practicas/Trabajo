package sol.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.GestorBD;
import paw.model.ExcepcionDeAplicacion;
import paw.util.UtilesString;

@WebServlet(name = "GetProvincia", urlPatterns = {"/api/GetProvincia"})
public class GetProvincia extends HttpServlet {

    public static GestorBD gbd = new GestorBD();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        try {
            String cp = request.getParameter("cp");
            if (!UtilesString.isVacia(cp)) {
               
                
                
                cp=gbd.getProvinciaDeCp(cp);
                response.getWriter().print(cp);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "cp de provincia no válida");
            }

        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(GetStockArticulo.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(404);
        }

    }

}
