package servleti;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeli.*;

@WebServlet(name = "IndexServlet", urlPatterns = {"/IndexServlet"})
public class IndexServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        Baza baza = new Baza();
        try {
            baza.connect();
            String whereDodatak = "";
            String whereDodatak2 = "";
            String orderByDodatak ="ORDER BY Naziv";
            
            
            if (request.getParameter("idkat")!=null) {
                int idkat = Integer.parseInt(request.getParameter("idkat"));
               
                if(idkat==-1) request.getSession().setAttribute("idkat",idkat);
                else if (idkat==0) whereDodatak = " AND KategorijaID IS NULL ";
                else whereDodatak = " AND KategorijaID="+idkat;
                request.getSession().setAttribute("idkat",idkat);
            }
            else request.getSession().setAttribute("idkat",-1);
            
            
            if (request.getParameter("idpotkat")!=null) {
                
                int idpotkat = Integer.parseInt(request.getParameter("idpotkat"));
                
                if(idpotkat==-1) request.getSession().setAttribute("idpotkat",idpotkat);
                else whereDodatak2 = " AND PotkategorijaID="+idpotkat;

                request.getSession().setAttribute("idpotkat",idpotkat);
            }
            else request.getSession().setAttribute("idpotkat",-1);
            
            
            if (request.getParameter("orderBy")!=null) {
                int orderBy = Integer.parseInt(request.getParameter("orderBy"));
               
                if (orderBy==1) orderByDodatak = " ORDER BY Naziv DESC ";
                else if (orderBy==2)  orderByDodatak = " ORDER BY Cijena ";
                else if (orderBy==3)  orderByDodatak = " ORDER BY Cijena DESC ";
                request.getSession().setAttribute("orderBy",orderBy);
            }
            else request.getSession().setAttribute("orderBy",-1);
            
            
            ResultSet rs = 
                     baza.selectupit( "SELECT * FROM Proizvod WHERE Cijena > 0 AND KolicinaNaSkladistu > 0 "+whereDodatak + whereDodatak2
                                    + orderByDodatak );
            ArrayList<Proizvod> proizvodi = new ArrayList();
            while (rs.next()) {
                proizvodi.add( new Proizvod(
                               rs.getInt(1),
                               rs.getString(2),
                               rs.getString(3),
                               rs.getInt(4),
                               rs.getDouble(5),
                               rs.getInt(6),
                               rs.getInt(7),
                               rs.getString(8)
                              ) );
            }
            request.setAttribute("proizvodi",proizvodi);
            
            
            
            rs = baza.selectupit("SELECT SUM(Cijena*KolicinaNaSkladistu) FROM Proizvod WHERE 1=1 "+whereDodatak);
            rs.next();
            request.setAttribute("ukupnaVrijednost",rs.getDouble(1));
            
            rs = baza.selectupit("SELECT * FROM Kategorija ");
            ArrayList<Kategorija> kategorije = new ArrayList();
            while (rs.next()) {
                kategorije.add( new Kategorija( rs.getInt(1), rs.getString(2) ) );
            }
            request.setAttribute("kategorije",kategorije);
            
            rs = baza.selectupit("SELECT * FROM Potkategorija ");
            ArrayList<Potkategorija> potkategorije = new ArrayList();
            while (rs.next()) {
                potkategorije.add( new Potkategorija( rs.getInt(1),rs.getInt(2), rs.getString(3) ) );
            }
            request.setAttribute("potkategorije",potkategorije);
            
            //request.getSession().setAttribute("slikaproizvoda", rs.getString("slika"));  //NISAM SIGURAN ZaSTO SMO OVO OPCE STAVILI I ZA STO SLUZI AKO OPcE SLUZI (pogledati u videjima kada je prof objasnjavao za dodavanje slika mozda tamo nadjemo odgovor
            
            
        } 
        catch(ClassNotFoundException | NumberFormatException | SQLException e) { 
        }
        
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        
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
