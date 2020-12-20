package com.ulbs.proiectingineriesoftware.Servlet.User;

import com.ulbs.proiectingineriesoftware.Models.Role;
import com.ulbs.proiectingineriesoftware.Models.User;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserAddServlet", urlPatterns = {"/UserAddServlet"})
public class UserAddServlet extends HttpServlet {

    @EJB
    private UserDaoLocal userDaoLocal;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request != null) {
            String action = request.getParameter("action");

            String name = request.getParameter("name");
            String prenume = request.getParameter("prenume");
            String telefon = request.getParameter("telefon");
            String telefonMobil = request.getParameter("telefonMobil");
            String mail = request.getParameter("mail");
            // String functia = request.getParameter("functia");
            String descriere = request.getParameter("descriere");

            User user = new User(name, prenume, telefon, telefonMobil, mail, "Fara", descriere, userDaoLocal.createUsername(name, prenume));
            if ("Add".equalsIgnoreCase(action)) {
                userDaoLocal.addUser(user);
                if (userDaoLocal.existsUserWithUsername(user.getUsername())) {
                     Role role = new Role("Viewer");
                userDaoLocal.addRoleToUser(role, user.getUsername());
                    request.setAttribute("status", "ok");
                }
            } else {
                request.setAttribute("status", "failed");
            }
            request.setAttribute("user", user);
        }
        request.setAttribute("allUsers", userDaoLocal.getAllUsers());
        request.getRequestDispatcher("userAdd.jsp").forward(request, response);
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
