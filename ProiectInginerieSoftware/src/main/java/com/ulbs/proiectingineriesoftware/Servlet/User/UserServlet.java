package com.ulbs.proiectingineriesoftware.Servlet.User;

import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import java.util.Random;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {

    @EJB
    private UserDaoLocal usersDaoLocal;

    private String createUsername(String name, String prenume) {
        
        String username = "";

        if (name.length() >= 5) {
            username = name.substring(0, 5) + prenume.charAt(0);
        } else {
            username = name + prenume.charAt(0);
        }

        if (existsUsername(username)) {

            Random rn = new Random();
            int nr = Math.abs(rn.nextInt() % 100);
            username = username + nr;
        }

        return username;
    }

    private boolean existsUsername(String username) {

        return usersDaoLocal.existsUserWithUsername(username);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request != null) {
        
        String action = request.getParameter("action");
        }
        request.getRequestDispatcher("user.jsp").forward(request, response);

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
    }// </editor-fold

}
