/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modeli.Baza;

@MultipartConfig
@WebServlet(name = "DodavanjeProizvodaServlet", urlPatterns = {"/DodavanjeProizvodaServlet"})
public class DodavanjeProizvodaServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        
        request.setCharacterEncoding("UTF-8");
        
        Part file = request.getPart("slikaproizvoda");      //objekt (Part) slike
        String imeFileSlike = file.getSubmittedFileName(); //string u kojemu je ime slike
        
        String naziv = request.getParameter("naziv");
        String opis = request.getParameter("opis");
        int kolicina = Integer.parseInt(request.getParameter("kolicina"));
        Double cijena = Double.parseDouble(request.getParameter("cijena"));
        int potkategorijaID = Integer.parseInt(request.getParameter("potkategorijaID"));
        int kategorijaID = Integer.parseInt(request.getParameter("kategorijaID"));
        
        
        Baza baza = new Baza();
        try {
            baza.connect();
            baza.upit("INSERT INTO Proizvod (Naziv, Opis, KolicinaNaSkladistu, Cijena, PotkategorijaID, KategorijaID, Slika) "
                    + " VALUES ('"+naziv+"','"+opis+"',"+kolicina+","+cijena+","+potkategorijaID+","+kategorijaID+",'"+imeFileSlike+"')");
            
        
            
           
        } catch(Exception e) {}
        
        
        
        
        
        
        // ELEMENTI ZA DODAVANJE SLIKE U DATOTEKU
        
        String putanjaUpload = "C:/Users/Magyarboss/Desktop/Java/THE PROJECT/The_Project/src/main/webapp/slike/slikeproizvoda/"+ imeFileSlike;
        
        try (FileOutputStream fos = new FileOutputStream(putanjaUpload)){
            
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        //response.sendRedirect("mojprofil.jsp");
        getServletContext().getRequestDispatcher("/dodavanjeproizvoda.jsp").forward(request, response);
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
