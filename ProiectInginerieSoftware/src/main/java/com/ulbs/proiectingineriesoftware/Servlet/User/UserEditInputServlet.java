package com.ulbs.proiectingineriesoftware.Servlet.User;

import com.ulbs.proiectingineriesoftware.Common.PasswordUtil;
import com.ulbs.proiectingineriesoftware.Models.User;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserEditInputServlet", urlPatterns = {"/UserEditInputServlet"})
public class UserEditInputServlet extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(UserEditInputServlet.class.getName());
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @EJB
    private UserDaoLocal userDaoLocal;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request != null) {
            String action = request.getParameter("action");

            String userIDStr = request.getParameter("userid");
            String userIDStrSelect = request.getParameter("useridSelect");

            String name = request.getParameter("name");
            String prenume = request.getParameter("prenume");
            String telefon = request.getParameter("telefon");
            String telefonMobil = request.getParameter("telefonMobil");
            String mail = request.getParameter("mail");
            String functia = request.getParameter("functia");
            String descriere = request.getParameter("descriere");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String passwrodSha256 = PasswordUtil.convertToSha256(password);

            int userID = 0;
            int userID1 = 0;
            if (userIDStr != null && !userIDStr.equals("")) {
                userID = Integer.parseInt(userIDStr);
            }

            if (userIDStrSelect != null && !userIDStrSelect.equals("")) {
                userID1 = Integer.parseInt(userIDStrSelect);
            }

            User userSelect = userDaoLocal.getUser(userID);

            if (name != null && name != " ") {
                User user = new User(name, prenume, telefon, telefonMobil, mail, functia, descriere, username, passwrodSha256);

                if ("Edit".equalsIgnoreCase(action)) {

                    userDaoLocal.editUser(user, userID1);
                }
            }
            request.setAttribute("userSelect", userSelect);
        }
        request.setAttribute("allUsers", userDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/user/userEditInput.jsp").forward(request, response);
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
