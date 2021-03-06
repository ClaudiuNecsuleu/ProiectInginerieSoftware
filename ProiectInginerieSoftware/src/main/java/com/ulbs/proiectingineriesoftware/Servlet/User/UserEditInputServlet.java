package com.ulbs.proiectingineriesoftware.Servlet.User;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Common.PasswordUtil;
import com.ulbs.proiectingineriesoftware.Models.User;
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
@WebServlet(name = "UserEditInputServlet", urlPatterns = {"/UserEditInputServlet"})
public class UserEditInputServlet extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(UserEditInputServlet.class.getName());
    
    @EJB
    private UserDaoLocal userDaoLocal;
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
        String action = request.getParameter("action");

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
        String passwrodSha256 = "";
        if (password != "" && password != null) {
            passwrodSha256 = PasswordUtil.convertToSha256(password);
        }

        String userIDStr = request.getParameter("userid");
        int userID = 0;

        if (userIDStr != null && !userIDStr.equals("")) {
            userID = Integer.parseInt(userIDStr);
        }
        User userSelect = userDaoLocal.getUser(userID);
        request.setAttribute("userSelect", userSelect);

        int userID1 = 0;
        if (userIDStrSelect != null && !userIDStrSelect.equals("")) {
            userID1 = Integer.parseInt(userIDStrSelect);
        }

        if (name != null && name != " ") {
            if (password != null && password != "") {
                User user = new User(name, prenume, telefon, telefonMobil, mail, functia, descriere, username, passwrodSha256);
                if ("Edit".equalsIgnoreCase(action)) {

                    userDaoLocal.editUser(user, userID1);
                }
            } else {
                User userPass = userDaoLocal.getUser(userID1);
                User user = new User(name, prenume, telefon, telefonMobil, mail, functia, descriere, username, userPass.getPassword());  //old password
                if ("Edit".equalsIgnoreCase(action)) {

                    userDaoLocal.editUser(user, userID1);
                }
            }

        }
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("allUsers", userDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/user/userEditInput.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
