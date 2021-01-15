package com.ulbs.proiectingineriesoftware.Servlet.Comment;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Models.Comment;
import com.ulbs.proiectingineriesoftware.Services.CommentDaoLocal;
import com.ulbs.proiectingineriesoftware.Services.JobDaoLocal;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
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

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"RecruiterRole", "DirGenRole", "DirDepRole", "DirHrRole"}))
@WebServlet(urlPatterns = {"/CommentEditJobNextServlet"})
public class CommentEditJobNextServlet extends HttpServlet {

    @EJB
    private CommentDaoLocal commentDaoLocal;
    @EJB
    private JobDaoLocal jobDaoLocal;

    @Inject
   LanguageBean languageBean;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request != null) {
            String action = request.getParameter("action");

            String comment1 = request.getParameter("newCommentJob");
            String commentIDStr = request.getParameter("commentIDJob");
            String jobIDStr = request.getParameter("jobID");
            String publisherUsername = request.getParameter("publisherUsername");

            int commentID = 0;
            int jobID = 0;

            if (commentIDStr != null && !commentIDStr.equals("")) {
                commentID = Integer.parseInt(commentIDStr);
            }

            if (jobIDStr != null && !jobIDStr.equals("")) {
                jobID = Integer.parseInt(jobIDStr);
            }

            LOG.info("commentID=" + commentID + "       jobID=" + jobID + "     jobIDSTR=" + jobIDStr);

            LocalTime time = LocalTime.now();
            LocalDate date1 = LocalDate.now();

            if (comment1 != null && !comment1.equals("")) {
                Comment comment = new Comment(comment1, date1, time, publisherUsername);
                if ("EditJob".equalsIgnoreCase(action)) {
                    commentDaoLocal.editComment(commentID, comment);
                    request.setAttribute("message", "Successful");
                } else {
//                request.setAttribute("message", "Failed!");
                }

            }
            request.setAttribute("language", languageBean.getLocale());
            request.setAttribute("job", jobDaoLocal.getJobByJobID(jobID));
            request.getRequestDispatcher("/WEB-INF/pages/comment/commentEditJobNext.jsp").forward(request, response);

        }

    }
    private static final Logger LOG = Logger.getLogger(CommentEditJobNextServlet.class.getName());

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
