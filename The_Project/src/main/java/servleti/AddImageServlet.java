/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modeli.Baza;



@MultipartConfig        
@WebServlet(name = "AddImageServlet", urlPatterns = {"/AddImageServlet"})
public class AddImageServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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
        
        request.setCharacterEncoding("UTF-8");
        
        String teststring = request.getParameter("test");
        request.setAttribute("teststring", teststring);
        
        Part file = request.getPart("image");
        String imageFileName = file.getSubmittedFileName();
        
        request.setAttribute("teststring2", imageFileName);
        
        
        
        String uploadPath = "C:/Users/Magyarboss/Desktop/Java/THE PROJECT/The_Project/src/main/webapp/slike/slikeprofila/"+ imageFileName;
        
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        Baza baza = new Baza();
        try {
            baza.connect();
            
            baza.upit("UPDATE Korisnik SET Slika = "+"'"+imageFileName+"' WHERE Username = "+"'"+request.getSession().getAttribute("loggedUser")+"'" );     
            request.getSession().setAttribute("slikaprofila", imageFileName);        
        }
        catch(Exception e) {}
        //response.sendRedirect("mojprofil.jsp");
        getServletContext().getRequestDispatcher("/mojprofil.jsp").forward(request, response);
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
