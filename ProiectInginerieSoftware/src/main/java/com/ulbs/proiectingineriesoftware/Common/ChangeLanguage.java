
package com.ulbs.proiectingineriesoftware.Common;

import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ChangeLanguage", urlPatterns = {"/ChangeLanguage"})
public class ChangeLanguage extends HttpServlet {

   @Inject
   LanguageBean languageBean;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String language=request.getParameter("language");
        languageBean.changeLanguage(language);
        response.sendRedirect(request.getContextPath());
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
