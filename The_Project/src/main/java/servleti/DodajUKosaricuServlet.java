package servleti;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.ProizvodUKosarici;

@WebServlet(name = "DodajUKosaricuServlet", urlPatterns = {"/DodajUKosaricuServlet"})
public class DodajUKosaricuServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String id = request.getParameter("id");
        String naziv = request.getParameter("naziv");
        String opis = request.getParameter("opis");
        String kolicinaNaSkladistu = request.getParameter("kolicinaNaSkladistu");
        String cijena = request.getParameter("cijena");
        String kolicina = request.getParameter("kolicina");
        

        ProizvodUKosarici puk = new ProizvodUKosarici( Integer.parseInt(id), 
                                                       naziv, opis,
                                                       Integer.parseInt(kolicinaNaSkladistu), 
                                                       Double.parseDouble(cijena), 
                                                       Integer.parseInt(kolicina) 
                                                        );

        ArrayList<ProizvodUKosarici> kosarica = null;
        if (request.getSession().getAttribute("kosarica")==null) {
            kosarica = new ArrayList();
        }
        else {
            kosarica = (ArrayList<ProizvodUKosarici>)request.getSession().getAttribute("kosarica");
        }
        kosarica.add( puk );
        request.getSession().setAttribute("kosarica", kosarica);
        response.sendRedirect("IndexServlet");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
