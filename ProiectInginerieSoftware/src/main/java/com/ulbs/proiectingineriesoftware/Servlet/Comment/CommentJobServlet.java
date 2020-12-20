/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ulbs.proiectingineriesoftware.Servlet.Comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pro.webproject.dao.CommentDaoLocal;
import pro.webproject.model.Comment;

/**
 *
 * @author Clau
 */
@WebServlet(name = "CommentJobServlet", urlPatterns = {"/CommentJobServlet"})
public class CommentJobServlet extends HttpServlet {

    @EJB
    private CommentDaoLocal commentDaoLocal;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request != null) {
            String action = request.getParameter("action");

            String jobname = request.getParameter("jobname");
            String comment1 = request.getParameter("comment");
            String publisherUsername = request.getParameter("publisherUsername");

            LocalTime time = LocalTime.now();
            LocalDate date1 = LocalDate.now();

            Comment comment = new Comment(comment1, date1, time, publisherUsername);
            if ("AddJob".equalsIgnoreCase(action)) {
                commentDaoLocal.addCommentToJob(comment, jobname);
            }
            request.setAttribute("comment", comment);

            request.setAttribute("jobname", jobname);
            request.setAttribute("publisherUsername", publisherUsername);

        }
        request.setAttribute("allJobs", commentDaoLocal.getJobsList());
        request.getRequestDispatcher("commentJob.jsp").forward(request, response);
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
