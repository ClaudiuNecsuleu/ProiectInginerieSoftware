package com.ulbs.proiectingineriesoftware.Servlet.User;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"DirGenRole","AdminRole"}))
@WebServlet(name = "UserDeleteServlet", urlPatterns = {"/UserDeleteServlet"})
public class UserDeleteServlet extends HttpServlet {

    @EJB
    private UserDaoLocal userDaoLocal;
    @Inject
   LanguageBean languageBean;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request != null) {
            String action = request.getParameter("action");

            String userIDStr = request.getParameter("userid");
            int userID = 0;
            if (userIDStr != null && !userIDStr.equals("")) {
                userID = Integer.parseInt(userIDStr);
            }

            if ("Delete".equalsIgnoreCase(action)) {
//                LOG.info("ID USER="+userIDStr);
                userDaoLocal.deleteUser(userID);
            }
            request.setAttribute("userID", userID);
        }
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("allUsers", userDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/user/userDelete.jsp").forward(request, response);

    }
    private static final Logger LOG = Logger.getLogger(UserDeleteServlet.class.getName());

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
