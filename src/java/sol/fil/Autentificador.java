package sol.fil;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import paw.model.Cliente;


public class Autentificador implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession sesion = req.getSession();
        Cliente cliente = (Cliente) sesion.getAttribute("cliente");
        if (cliente == null) {
            String returnURL = req.getRequestURL() + "";

            sesion.setAttribute("returnURL", returnURL);
            resp.sendRedirect(req.getContextPath() + "/Login");

        }else{

            chain.doFilter(request, response);
        }
    }
}
