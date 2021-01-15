package com.ulbs.proiectingineriesoftware.Servlet.Comment;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Models.Comment;
import com.ulbs.proiectingineriesoftware.Services.CommentDaoLocal;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"UserRole"}))
@WebServlet(name = "CommentJobServlet", urlPatterns = {"/CommentJobServlet"})
public class CommentJobServlet extends HttpServlet {

    @EJB
    private CommentDaoLocal commentDaoLocal;

    @Inject
   LanguageBean languageBean;
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
                request.setAttribute("message", "Successful");
            }
            else{
//            request.setAttribute("message", "Failed!");
            }
            request.setAttribute("comment", comment);

            request.setAttribute("jobname", jobname);
            request.setAttribute("publisherUsername", publisherUsername);

        }
        
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("allJobs", commentDaoLocal.getJobsList());
        request.getRequestDispatcher("/WEB-INF/pages/comment/commentJob.jsp").forward(request, response);
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
