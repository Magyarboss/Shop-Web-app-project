package servleti;

import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.Baza;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        if(request.getSession().getAttribute("loggedUser") != null) {
            response.sendRedirect("ProizvodiServlet");
        }
        getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        

        Baza baza = new Baza();
        try {
            baza.connect();
            ResultSet rs = baza.selectupit("SELECT * FROM Korisnik WHERE username='"+username+"'");
            if (rs.next()) {
                if (rs.getString("password").trim().equals(password)) {               
                    request.getSession().setAttribute("loggedUser", username );
                    request.getSession().setAttribute("ime", rs.getString("ime"));
                    request.getSession().setAttribute("imePrezime", rs.getString("ime")+" "+rs.getString("prezime"));
                    request.getSession().setAttribute("slikaprofila", rs.getString("slika"));
                    request.getSession().setAttribute("IDKorisnik" ,rs.getInt("IDKorisnik"));
                    //getServletContext().getRequestDispatcher("/ProizvodiServlet").forward(request, response); Ovo nije potrebno vec mozemo samo koristiti -
                                                                                                //sendRedirect jer smo sve atribute stavili u session, da nisu u sessionu morali bi
                    
                    response.sendRedirect("IndexServlet");
                    return;
                }
            }
        } catch(Exception e) {}

        request.setAttribute("incorrect-login", "Neisparvno korisničko ime i/ili lozinka.");
        getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
