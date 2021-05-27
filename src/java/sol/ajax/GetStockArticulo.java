package sol.ajax;

import java.io.IOException;
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

@WebServlet(name = "GetStockArticulo", urlPatterns = {"/api/GetStockArticulo"})

public class GetStockArticulo extends HttpServlet {
    public static GestorBD gbd= new GestorBD();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int stock = 0;
            String cart = request.getParameter("codArt");
            if (!UtilesString.isVacia(cart)) {
            stock = gbd.getStockArticulo(cart);
            response.getWriter().print(stock);
            } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Código de artículo no especificado ");
            }

        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(GetStockArticulo.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(404);
        }
        
        
        
    }

    
}
