package servleti;

import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String password = request.getParameter("password");
        String password_check = request.getParameter("password-check");
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        if(!password_check.equals(request.getParameter("password"))) {
            request.setAttribute("incorrect-password", "Niste ispravno potvrdili lozinku!");
            doGet(request, response);
            return;
        }
 
        Baza baza = new Baza();
        try {
            baza.connect();
            ResultSet rs = baza.selectupit("SELECT * FROM Korisnik WHERE username='"+username+"'");
            if (rs.next()) {
                request.setAttribute("username-exists", "Korisničko ime " + username + " već postoji");
                doGet(request, response);
                return;
            }
            
            rs = baza.selectupit("SELECT * FROM Korisnik WHERE email='"+email+"'");
            if (rs.next()) {
                request.setAttribute("email-exists", "Email adresa " + email + " već postoji");
                doGet(request, response);
                return;
            }
            
        
            baza.upit("INSERT INTO Korisnik (username,password,ime,prezime,email) "
                    + " VALUES ('"+username+"','"+password+"','"+ime+"','"+prezime+"','"+email+"')");
            response.sendRedirect("LoginServlet");
        } catch(Exception e) {}
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
