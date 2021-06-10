/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sol.ser;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import paw.bd.GestorBD;
import paw.model.Articulo;
import paw.model.ExcepcionDeAplicacion;
import paw.util.UtilesString;
import paw.util.servlet.UtilesServlet;

@WebServlet(name = "NuevoArticulo", urlPatterns = {"/admin/NuevoArticulo"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024, // 1 MB
        maxRequestSize = 1024 * 1024 * 1 + 10 * 1024 // 1 MB 10kb  
)
public class NuevoArticulo extends HttpServlet {

    private static GestorBD gbd = new GestorBD();
    private static long CONT_FICH = 0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setAttribute("tipos", gbd.getTiposArticulos()); 
            request.setAttribute("fabricantes", gbd.getFabricantes());
            RequestDispatcher rd = request.getRequestDispatcher("nuevoArticulo.jsp");
            rd.forward(request, response);
        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(NuevoArticulo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setCharacterEncoding("utf-8");
            Articulo articulo = (Articulo) UtilesServlet.populateBean("paw.model.Articulo", request);
            
            
            Part foto = request.getPart("fichFoto");
            List<String> l = valida(articulo, foto);
            
            if(l.isEmpty()){
            
            if (foto.getSize() > 0) { // Solo si se ha recibido un fichero
                String fName = getNombreFicheroFoto(foto);
                if (fName != null) {
                    articulo.setFoto(articulo.getTipo() + File.separator + fName);
                }
            }
            gbd.insertaArticulo(articulo);
            RequestDispatcher rd = request.getRequestDispatcher("listadoArticulos.jsp");
            rd.forward(request, response);
            return;
            }
            request.setAttribute("tipos", gbd.getTiposArticulos());
            request.setAttribute("fabricantes", gbd.getFabricantes());
            request.setAttribute("articulo", articulo);
            RequestDispatcher rd = request.getRequestDispatcher("nuevoArticulo.jsp");
            rd.forward(request, response);
        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(NuevoArticulo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }


    private String getNombreFicheroFoto(Part part) {
        String fn = part.getSubmittedFileName();
        if (fn == null) {
            return null;
        }
        // En los viejos navegadores IE y Edge el nombre del fichero incluye la ruta
        // Por si acaso, la quitamos
        fn = fn.replaceAll("\\\\", "/");
        fn = fn.substring(fn.lastIndexOf("/") + 1);
        // Devolver el nombre
        return (System.currentTimeMillis()) + "" + (CONT_FICH++) + fn;
    }

    protected void guardaFoto(Part foto, Articulo art) throws IOException {
        String BASE_FOTOS = this.getServletContext().getRealPath("/img/fotosElectr") + File.separator;
        if (foto.getSize() > 0) {
            foto.write(BASE_FOTOS + art.getFoto());
            foto.delete();
        }
    }

    /**
     * Realiza las validaciones para los campos del formulario de alta de nuevo
     * artículo
     *
     * @param art objeto paw.model.Articulo con los datos leídos del formulario
     * @param foto objeto Part con el fichero de la foto del artículo
     * @return Una lista de String con mensajes de error correspondientes a las
     * reglas de validación que no se cumplen
     */
    private List<String> valida(Articulo art, Part foto) {
        List<String> errores = new ArrayList<String>();

        if (UtilesString.isVacia(art.getNombre())
                || UtilesString.isVacia(art.getTipo())
                || UtilesString.isVacia(art.getFabricante())) {
            errores.add("Debes proporcionar valor para todos los campos requeridos");
        }

        if (art.getNombre() != null && art.getNombre().length() > 50) {
            errores.add("La longitud máxima del nombre son 50 caracteres");
        }

        if (art.getTipo() != null && art.getTipo().length() > 15) {
            errores.add("La longitud máxima del tipo son 15 caracteres");
        }

        if (art.getFabricante() != null && art.getFabricante().length() > 11) {
            errores.add("La longitud máxima del fabricante son 15 caracteres");
        }

        if (art.getDescripcion() != null && art.getDescripcion().length() > 200) {
            errores.add("La longitud máxima de la descripción son 200 caracteres");
        }

        if (art.getFoto() != null && art.getFoto().length() > 50) {
            errores.add("El nombre de la foto es demasiado largo");
        }

        if (foto.getSize() > 0 && !foto.getContentType().startsWith("image")) {
            errores.add("El fichero subido debe ser una imagen.");
        }

        if (art.getPvp() <= 0) {
            errores.add("El precio debe ser una cantidad positiva");
            art.setPvp(0);
        }

        return errores;
    }

}
