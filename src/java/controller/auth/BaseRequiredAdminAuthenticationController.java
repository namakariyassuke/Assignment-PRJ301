/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.auth;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Admin;
import model.User;

/**
 *
 * @author ASUS
 */
public abstract class BaseRequiredAdminAuthenticationController extends HttpServlet {
   private boolean isAuthenticated(HttpServletRequest request)
    {
       // Retrieve the user from the session
        User user = (User) request.getSession().getAttribute("user");
        // Check if the user is null
        if (user == null) {
            return false;
        } else {
            // Check if the user has admin privileges
            Admin admin = user.getAdmin();
            return admin != null;
        }
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
        // Retrieve the user from the session
        User user = (User) request.getSession().getAttribute("user");
        // Check if the user is authenticated
        if (isAuthenticated(request)) {
            // Delegate to the abstract doGet method
            doGet(request, response, user, user.getAdmin());
        } else {
            // Print an error message if the user is not authenticated
            response.getWriter().println("NO MORE LOGIN!");
        }
    } 
    
    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response,User user, Admin admin)
    throws ServletException, IOException;
    
    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response,User user, Admin admin)
    throws ServletException, IOException;

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Retrieve the user from the session
        User user = (User) request.getSession().getAttribute("user");
        // Check if the user is authenticated
        if (isAuthenticated(request)) {
            // Delegate to the abstract doPost method
            doPost(request, response, user, user.getAdmin());
        } else {
            // Print an error message if the user is not authenticated
            response.getWriter().println("NO MORE LOGIN!");
        }
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
