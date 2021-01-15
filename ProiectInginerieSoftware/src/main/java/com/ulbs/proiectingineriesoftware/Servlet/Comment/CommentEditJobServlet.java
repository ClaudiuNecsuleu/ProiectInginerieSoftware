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
@WebServlet(urlPatterns = {"/CommentEditJobServlet"})
public class CommentEditJobServlet extends HttpServlet {

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

            String jobIDStr = request.getParameter("jobid");

            int jobID = 0;

            if (jobIDStr != null && !jobIDStr.equals("")) {
                jobID = Integer.parseInt(jobIDStr);
            }

            LOG.info("EDITJOBSERVLET/// jobIDSTR= " + jobIDStr);
            
            request.setAttribute("language", languageBean.getLocale());
            request.setAttribute("job", jobDaoLocal.getJobByJobID(jobID));
            request.getRequestDispatcher("/WEB-INF/pages/comment/commentEditJobNext.jsp").forward(request, response);

        }

    }
    private static final Logger LOG = Logger.getLogger(CommentEditJobServlet.class.getName());

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
