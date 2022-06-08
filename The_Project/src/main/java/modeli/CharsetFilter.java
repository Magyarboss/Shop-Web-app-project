package modeli;

import javax.servlet.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CharsetFilter implements Filter {

    private String encoding;

    public void init(FilterConfig config) throws ServletException {
        encoding = config.getInitParameter("requestEncoding");
        if (encoding == null) encoding = "UTF-8";
    }

    public void CharEncoding( ServletRequest request, ServletResponse response ) {
        if (null == request.getCharacterEncoding()) {
            try {
                request.setCharacterEncoding(encoding);
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(CharsetFilter.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        // Set the default response content type and encoding
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
    }
      
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain next)
            throws IOException, ServletException {

        CharEncoding( request, response );           
        try {
           next.doFilter(request, response);
        } catch (Throwable e) {
           
        }        
    }

    public void destroy() {
    }
}