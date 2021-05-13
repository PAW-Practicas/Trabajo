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
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import paw.bd.CriteriosArticulo;
import paw.bd.GestorBD;
import paw.bd.Paginador;
import paw.model.Articulo;
import paw.model.ExcepcionDeAplicacion;

/**
 *
 * @author usuario
 */
@WebServlet(name = "BuscarArticulos", urlPatterns = {"/BuscarArticulos"}, initParams = {
    @WebInitParam(name = "tamanioPagina", value = "12")})
public class BuscarArticulos extends HttpServlet {

    private static int tamanioPagina;
    private static GestorBD gbd = new GestorBD();

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            tamanioPagina = Integer.parseInt(this.getInitParameter("tamanioPagina"));
        } catch (Exception ex) {
            Logger.getLogger(BuscarArticulos.class.getName()).log(Level.WARNING, null, ex);
        }
    }


     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo=request.getParameter("tipo");
        String fabricante=request.getParameter("fabricante");
        String precio=request.getParameter("precio");
        String codArt=request.getParameter("codArt");
        String nomArt=request.getParameter("nomArt");
        
        if(cadVacia(nomArt)&& cadVacia(codArt)&&cadVacia(tipo)&& cadVacia(fabricante) && cadVacia(precio) ){
            RequestDispatcher rd = request.getRequestDispatcher("/catalogo.jsp");
            rd.forward(request, response);
            return ;
        }
       
        CriteriosArticulo criterios= new CriteriosArticulo();
        if(!cadVacia(fabricante))criterios.setFabricante(fabricante);
        if(!cadVacia(precio))criterios.setPrecio(precio);
        if(!cadVacia(tipo)) criterios.setTipo(tipo);
        if(!cadVacia(nomArt)) criterios.setNombre(nomArt);
        if(!cadVacia(codArt)) criterios.setCodigo(codArt);
        
        try {
            Paginador p=gbd.getPaginadorArticulos(criterios, tamanioPagina);
            int Pagina = paginaValida(request.getParameter("Pagina"),p.getNumPaginas());

           
            List<Articulo> listado=gbd.getArticulos(criterios,Pagina,tamanioPagina);
            request.setAttribute("codArt",codArt);
            request.setAttribute("nomArt",nomArt);
            
            request.setAttribute("tipo",tipo);
            request.setAttribute("fabricante",fabricante);
            request.setAttribute("precio",precio);            
           
            request.setAttribute("Adyacentes",p.adyacentes(Pagina));
            request.setAttribute("Siguiente",p.siguiente(Pagina));
            request.setAttribute("Anterior",p.anterior(Pagina));
            
            request.setAttribute("articulos", listado);
            request.setAttribute("Pagina",Pagina);
            request.setAttribute("numPags",p.getNumPaginas());
            request.setAttribute("numRegs",listado.size()+"");
            
            request.setAttribute("GestorBD",gbd);
            gbd.getTiposArticulos();
            if(listado.size()==1){
                RequestDispatcher rd = request.getRequestDispatcher("/FichaArticulo");
                rd.forward(request, response);
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("/catalogo.jsp");
            rd.forward(request, response);

        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(BuscarArticulos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int paginaValida(String s,int NumPags){
       try {
            
            int pag=Integer.parseInt(s);        
            if(pag<0) return 1;
            if(pag>=NumPags-1) return NumPags-1;
            return pag;
           
        }catch (NumberFormatException exception) {
             return 1;
        }    
       
    }
    
    public boolean cadVacia(String s){
        return ( s==null || s=="");
    }
}
