package com.ulbs.proiectingineriesoftware.Servlet.LoginRegister;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        request.getRequestDispatcher("WEB-INF/pages/loginreg/login.jsp").forward(request, response);
        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("message", "Eroare.logare");
        request.setAttribute("language", languageBean.getLocale());
        request.getRequestDispatcher("/WEB-INF/pages/loginreg/login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
