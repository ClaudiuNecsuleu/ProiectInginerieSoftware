package com.ulbs.proiectingineriesoftware.Servlet.Job;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Services.JobDaoLocal;
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

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"DirGenRole","AdminRole"}))
@WebServlet(name = "JobDeleteServlet", urlPatterns = {"/JobDeleteServlet"})
public class JobDeleteServlet extends HttpServlet {

    @EJB
    private JobDaoLocal jobDaoLocal;
    
    @Inject
   LanguageBean languageBean;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request != null) {
            String action = request.getParameter("action");
            String jobidStr = request.getParameter("jobid");
            Integer jobid = 0;
            if (jobidStr != null && !jobidStr.equals("")) {
                jobid = Integer.parseInt(jobidStr);
            }

            if ("Delete".equalsIgnoreCase(action)) {
                jobDaoLocal.deleteJob(jobid);
                request.setAttribute("message", "Successful");
            }
            else{
//            request.setAttribute("message", "Failed!");
            }
            request.setAttribute("jobid", jobid);
        }
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("allJobs", jobDaoLocal.getAllJobs());
        request.getRequestDispatcher("/WEB-INF/pages/job/jobDelete.jsp").forward(request, response);
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
