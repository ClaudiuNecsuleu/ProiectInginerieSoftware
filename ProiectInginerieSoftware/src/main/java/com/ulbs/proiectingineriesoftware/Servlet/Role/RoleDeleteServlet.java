package com.ulbs.proiectingineriesoftware.Servlet.Role;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"DirGenRole"}))
@WebServlet(name = "RoleDeleteServlet", urlPatterns = {"/RoleDeleteServlet"})
public class RoleDeleteServlet extends HttpServlet {

    @EJB
    private UserDaoLocal usersDaoLocal;

    @Inject
   LanguageBean languageBean;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request != null) {
            String action = request.getParameter("action");
            String role = request.getParameter("deleteRole");

            if ("deleteRole".equalsIgnoreCase(action)) {
                usersDaoLocal.setRoleDefaultForAllUsers(    role);
                usersDaoLocal.deleteRole(role);
            }

        }
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("allRoles", usersDaoLocal.getAllRoles());
        request.setAttribute("allUsers", usersDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/role/roleDelete.jsp").forward(request, response);
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
    }// </editor-fold>

}
