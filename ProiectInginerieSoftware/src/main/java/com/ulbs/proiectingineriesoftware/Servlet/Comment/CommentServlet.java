package com.ulbs.proiectingineriesoftware.Servlet.Comment;

import com.ulbs.proiectingineriesoftware.Models.Comment;
import com.ulbs.proiectingineriesoftware.Services.CommentDaoLocal;
import com.ulbs.proiectingineriesoftware.Services.JobDaoLocal;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CommentServlet", urlPatterns = {"/CommentServlet"})
public class CommentServlet extends HttpServlet {

    @EJB
    private CommentDaoLocal commentsDaoLocal;
    @EJB
    private UserDaoLocal userDaoLocal;
    @EJB
    private JobDaoLocal jobDaoLocal;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request != null) {
            String action = request.getParameter("action");
            String commentIDStr = request.getParameter("commentID");
            String publisherUsername = request.getParameter("publisherUsername");

            int commentID = 0;

            if (commentIDStr != null && !commentIDStr.equals("")) {
                commentID = Integer.parseInt(commentIDStr);
            }

            String username = request.getParameter("username");
            String comment1 = request.getParameter("comment");

            LocalTime time = LocalTime.now();
            LocalDate date1 = LocalDate.now();

            Comment comment = new Comment(comment1, date1, time, publisherUsername);

            request.setAttribute("comment", comment);

        }
        request.setAttribute("allComments", commentsDaoLocal.getAllComments());
        request.setAttribute("allUsers", userDaoLocal.getAllUsers());
        request.setAttribute("allJobs", jobDaoLocal.getAllJobs());
        request.getRequestDispatcher("/WEB-INF/pages/comment/comment.jsp").forward(request, response);
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
