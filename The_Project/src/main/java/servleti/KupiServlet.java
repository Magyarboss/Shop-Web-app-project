/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.Baza;
import modeli.ProizvodUKosarici;

/**
 *
 * @author Magyarboss
 */
@WebServlet(name = "KupiServlet", urlPatterns = {"/KupiServlet"})
public class KupiServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        int nacin = Integer.parseInt( request.getParameter("nacin")  );
        ArrayList<ProizvodUKosarici> 
                   kosarica = (ArrayList<ProizvodUKosarici>)request.getSession().getAttribute("kosarica");
        Baza baza = new Baza();
        String insertupit = null;
        try {
            baza.connect();
            int idkor = (int)request.getSession().getAttribute("IDKorisnik");
            //  DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");    
            // String datum = LocalDateTime.now().format(fmt);
            for ( ProizvodUKosarici puk: kosarica) {
                insertupit =
                    "INSERT INTO Kupnja "
                    + "(KorisnikID,ProizvodID,Cijena,Kolicina,Datum,Nacin) "
                    + "VALUES ("+idkor+","+puk.getIDProizvod()+","+puk.getCijena()+","
                    + puk.getKolicina()+",GETDATE(),"+nacin+")";
                
                baza.upit(insertupit);
                baza.upit( "UPDATE Proizvod SET KolicinaNaSkladistu=KolicinaNaSkladistu-"
                            +puk.getKolicina()+" WHERE IDProizvod="+puk.getIDProizvod() );
            }
            request.getSession().removeAttribute("kosarica");
            response.sendRedirect("IndexServlet");
        } 
        catch (IOException | ClassNotFoundException | SQLException e) {
            
        }    
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
