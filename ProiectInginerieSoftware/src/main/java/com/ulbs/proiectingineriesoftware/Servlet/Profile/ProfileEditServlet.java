/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ulbs.proiectingineriesoftware.Servlet.Profile;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
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
import javax.servlet.http.HttpSession;

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"UserRole"}))
@WebServlet(name = "ProfileEditServlet", urlPatterns = {"/ProfileEditServlet"})
public class ProfileEditServlet extends HttpServlet {

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
    request.getRequestDispatcher("ProfileServlet").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String telefon = request.getParameter("telefon");
        String telefonMobil = request.getParameter("telefonMobil");
        String descriere = request.getParameter("descriere");
        User user = userDaoLocal.getUserByUsername(username);

        userDaoLocal.updateProfile(user, telefon, telefonMobil, descriere);

        request.getRequestDispatcher("ProfileServlet").forward(request, response);
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
