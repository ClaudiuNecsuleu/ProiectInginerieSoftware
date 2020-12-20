/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ulbs.proiectingineriesoftware.Servlet.Role;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pro.webproject.model.Role;
import pro.webproject.dao.UserDaoLocal;

/**
 *
 * @author Larisa
 */
@WebServlet(name = "RoleAddUserServlet", urlPatterns = {"/RoleAddUserServlet"})
public class RoleAddUserServlet extends HttpServlet {

    @EJB
    private UserDaoLocal usersDaoLocal;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request != null) {
            String action = request.getParameter("action");
            String nameRole = request.getParameter("nameRole");
            String username = request.getParameter("username");

            Role role = usersDaoLocal.getRole(nameRole);

            if ("AddToUser".equalsIgnoreCase(action)) {
                usersDaoLocal.addRoleToUser(role, username);
            }

            request.setAttribute("role", role);
        }

        request.setAttribute("allRoles", usersDaoLocal.getAllRoles());
        request.setAttribute("allUsers", usersDaoLocal.getAllUsers());
        request.getRequestDispatcher("roleAddUser.jsp").forward(request, response);
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
        processRequest(request, response);
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
