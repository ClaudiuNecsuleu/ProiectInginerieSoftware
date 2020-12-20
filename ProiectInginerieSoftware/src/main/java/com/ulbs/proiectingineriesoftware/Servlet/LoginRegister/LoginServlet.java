package com.ulbs.proiectingineriesoftware.Servlet.LoginRegister;

import com.ulbs.proiectingineriesoftware.Common.UserBean;
import com.ulbs.proiectingineriesoftware.Models.User;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private String Status = "false";
    @EJB
    private UserDaoLocal userDaoLocal;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request != null) {
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if ("Login".equalsIgnoreCase(action)) {
                User user = userDaoLocal.userLogin(username, password);
                if (user != null && user.getUsername().equals(username) && user.getUsername().equals(password)) {
                    UserBean userBean = new UserBean();
                    userBean.initializare(user);

                    HttpSession session = request.getSession(true);
                    session.setAttribute("currentSessionUser", userBean);
                    response.sendRedirect("/WEB-INF/pages/loginreg/userLogged.jsp"); //logged-in page   DF
                }
                 else {
                    response.sendRedirect("/WEB-INF/pages/loginreg/userLogInvalid.jsp"); //error page 

                }

            }
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
