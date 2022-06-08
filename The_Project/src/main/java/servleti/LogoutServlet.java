/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Magyarboss
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        if(session != null){
            try{
                response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server -Ove 4 stavke bi trebao staviti na sve stranice(servlete)koje na kojim ne zelim da mi stvara cache...
                response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance           -tj. da kada se odlogira user i kada stisnes back button u browseru da mi ne ocita taj stari cache 
                response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"                               -iz browsera o odlogiranom korisniku
                response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
                session.invalidate();
                response.sendRedirect("IndexServlet");
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
        /*request.getSession().removeAttribute("loggedUser");
        request.getSession().removeAttribute("imeprezime");
        request.getSession().removeAttribute("uloga");
        request.getSession().removeAttribute("id_korisnika");
        */
        
        
        
        
        
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
