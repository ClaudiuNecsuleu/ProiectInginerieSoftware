package com.ulbs.proiectingineriesoftware.Servlet.Profile;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Common.PasswordUtil;
import com.ulbs.proiectingineriesoftware.Models.User;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"UserRole"}))
@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

    @EJB
    UserDaoLocal userDaoLocal;

    @Inject
    LanguageBean languageBean;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("language", languageBean.getLocale());
        request.getRequestDispatcher("/WEB-INF/pages/profile/ChangePassword.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String passwordold = request.getParameter("passwordold");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");

        User user = userDaoLocal.getUserByUsername(username);

        if (password.equals(password2) && PasswordUtil.convertToSha256(passwordold).equals(user.getPassword())) {
            String passwrodSha256 = PasswordUtil.convertToSha256(password);

            userDaoLocal.changePasswprd(user, passwrodSha256);
             request.setAttribute("status", "Successful");
        } else {
            request.setAttribute("status", "Password1.Password2");
        }
        request.setAttribute("language", languageBean.getLocale());
        request.getRequestDispatcher("/WEB-INF/pages/profile/ChangePassword.jsp").forward(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
