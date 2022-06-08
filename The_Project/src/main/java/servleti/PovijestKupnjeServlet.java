/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.Baza;
import modeli.Kupnja;

/**
 *
 * @author Magyarboss
 */
@WebServlet(name = "PovijestKupnjeServlet", urlPatterns = {"/PovijestKupnjeServlet"})
public class PovijestKupnjeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        Baza baza = new Baza();
        
        try{
            baza.connect();
            int idkor = (int)request.getSession().getAttribute("IDKorisnik");
            String imePrezimeKorisnika = request.getSession().getAttribute("imePrezime").toString();
            
            ResultSet rs = baza.selectupit("SELECT* FROM Kupnja WHERE KorisnikID= "+idkor+" ORDER BY Datum DESC");
            
            ArrayList<Kupnja> kupnje = new ArrayList();
            
            while(rs.next()){
                
                int idpr = rs.getInt("ProizvodID");
                ResultSet rsProizvod = baza.selectupit("SELECT * FROM Proizvod WHERE IDProizvod="+idpr);
                rsProizvod.next();
                String nacin = "Nepoznato";
                if(rs.getInt("Nacin")==1) nacin = "Online Plaćanje";
                if(rs.getInt("Nacin")==2) nacin = "Gotovina - pouzeće";
                
                kupnje.add(new Kupnja(
                                    rs.getInt("IDKupnja"),
                                    rs.getInt("KorisnikID"),
                                    rs.getInt("ProizvodID"),
                                    rs.getDouble("Cijena"),
                                    rs.getInt("Kolicina"),
                                    rs.getString("Datum"),      //rs.getObject(6, LocalDateTime.class),
                                    nacin,
                                    imePrezimeKorisnika,
                                    rsProizvod.getString("Naziv")));
            }
            request.setAttribute("kupnje", kupnje);
            
            
            getServletContext().getRequestDispatcher("/prikazPovijestKupnje.jsp").forward(request, response);
            
            
        }
        catch(IOException | ClassNotFoundException | SQLException | ServletException e) {
            
        }
        
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
