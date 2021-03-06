package com.ulbs.proiectingineriesoftware.Servlet.Role;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Models.Role;
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
@WebServlet(name = "RoleServlet", urlPatterns = {"/RoleServlet"})
public class RoleServlet extends HttpServlet {

    @EJB
    private UserDaoLocal usersDaoLocal;
    
    @Inject
   LanguageBean languageBean;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String nameRole = request.getParameter("nameRole");
        String username = request.getParameter("username");

        Role role = new Role(nameRole);

        if ("AddRole".equalsIgnoreCase(action)) {
            usersDaoLocal.addRole(role);
        } else if ("AddToUser".equalsIgnoreCase(action)) {
            usersDaoLocal.addRoleToUser(role, username);
        } else if ("deleteRole".equalsIgnoreCase(action)) {
            usersDaoLocal.deleteRole(nameRole);
        }
            
        
        request.setAttribute("role", role);
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("allRoles", usersDaoLocal.getAllRoles());
        request.setAttribute("allUsers", usersDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/role/roleinfo.jsp").forward(request, response);
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
