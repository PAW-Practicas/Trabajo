package sol.ser;

import java.io.IOException;
import java.util.List;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;
import paw.bd.GestorBD;
import paw.model.*;

public class FichaArticulo extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String codArt = request.getParameter("codArt");
    String nomArt =request.getParameter("nomArt");;
    String fabricante = request.getParameter("fabricante");
    String precio = request.getParameter("precio");
    String tipo = request.getParameter("tipo");
    String Pagina = request.getParameter("Pagina"); 
    
    
    try {
        Articulo articulo=null;
        if(!codArt.equals("")){
        articulo = new GestorBD().getArticulo(codArt);
        }
        else{
         List<Articulo> listado=new GestorBD().getArticulos();
          for(Articulo art: listado){
              if(art.getNombre().equals(nomArt)){
                  codArt=art.getCodigo();
                  articulo = new GestorBD().getArticulo(codArt);
              }
          }
        }
        
        if (articulo == null) 
        {
         
            
          request.setAttribute("enlaceSalir", "BuscarArtículos");
          response.sendError(404,"El artículo "+ codArt+" no existe");
          
        } 
        else 
        {
            
            
          
          request.setAttribute("fabricante",fabricante);
          request.setAttribute("precio",precio);
          request.setAttribute("tipo",tipo);
          request.setAttribute("art", articulo);
          request.setAttribute("codArt", codArt);
          request.setAttribute("nomArt", articulo.getNombre());
          request.setAttribute("fabricante",fabricante);
          request.setAttribute("Pagina",Pagina);
          request.setAttribute("admin", request.isUserInRole("administrador"));
          request.setAttribute("rolcliente", request.isUserInRole("cliente"));
          request.setAttribute("roladmin", request.isUserInRole("administrador"));

          RequestDispatcher rd = request.getRequestDispatcher("fichaArticulo.jsp");
          rd.forward(request, response);
        }
      
    } catch (ExcepcionDeAplicacion ex) {
      Logger.getLogger(FichaArticulo.class.getName()).log(Level.SEVERE, null, ex);
      request.setAttribute("enlaceSalir", "index.html");
      throw new ServletException(ex);
    }
  }

}
