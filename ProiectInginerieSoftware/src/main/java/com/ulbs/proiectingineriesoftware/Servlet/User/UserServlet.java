package com.ulbs.proiectingineriesoftware.Servlet.User;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import java.util.Random;
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
@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {

    @EJB
    private UserDaoLocal usersDaoLocal;
    @Inject
   LanguageBean languageBean;
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
        request.setAttribute("language", languageBean.getLocale());
        request.getRequestDispatcher("/WEB-INF/pages/user/user.jsp").forward(request, response);

    }

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
    }// </editor-fold

}
