package com.ulbs.proiectingineriesoftware.Servlet.Job;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Models.Job;
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

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"RecruiterRole", "DirGenRole", "DirDepRole", "DirHrRole"}))
@WebServlet(name = "JobEditInputServlet", urlPatterns = {"/JobEditInputServlet"})
public class JobEditInputServlet extends HttpServlet {

   
   @EJB
    private JobDaoLocal jobDaoLocal;
   @Inject
   LanguageBean languageBean;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            if (request != null) {
            String action = request.getParameter("action");
            
            String jobidStr = request.getParameter("jobid");
            String jobidStrSelect = request.getParameter("jobidSelect");
            
            String namejob = request.getParameter("jobname");
            String description = request.getParameter("description");

            String leftJobStr = request.getParameter("remainingjob");
            int remainingjob = 0;
            if (leftJobStr != null && !leftJobStr.equals("")) {
                remainingjob = Integer.parseInt(leftJobStr);
            }
            String publisher = request.getParameter("publisher");
            
            Integer jobid = 0;
            Integer jobidInput = 0;
            if (jobidStr != null && !jobidStr.equals("")) {
                jobid = Integer.parseInt(jobidStr);
            }
            
            if (jobidStrSelect != null && !jobidStrSelect.equals("")) {
                jobidInput = Integer.parseInt(jobidStrSelect);
            }
            Job jobSelect=new Job();
            if(jobid != 0)
            jobSelect=jobDaoLocal.getJobByJobID(jobid);
            
            if(namejob != null && namejob != ""){
            Job job = new Job(namejob, remainingjob, description, publisher);

            if ("Edit".equalsIgnoreCase(action)) {
                jobDaoLocal. editJob(jobidInput, job);
                request.setAttribute("message", "Successful");
            }
            else{
//            request.setAttribute("message", "Failed!");
            }
        }

            request.setAttribute("jobSelect", jobSelect);
        }
            request.setAttribute("language", languageBean.getLocale());
            request.setAttribute("alljobs", jobDaoLocal.getAllJobs());
            request.getRequestDispatcher("/WEB-INF/pages/job/jobEditInput.jsp").forward(request, response);
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
