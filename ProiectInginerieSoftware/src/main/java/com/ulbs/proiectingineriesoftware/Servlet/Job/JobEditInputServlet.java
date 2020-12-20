package com.ulbs.proiectingineriesoftware.Servlet.Job;

import com.ulbs.proiectingineriesoftware.Models.Job;
import com.ulbs.proiectingineriesoftware.Services.JobDaoLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "JobEditInputServlet", urlPatterns = {"/JobEditInputServlet"})
public class JobEditInputServlet extends HttpServlet {

   
   @EJB
    private JobDaoLocal jobDaoLocal;
   
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
            }
        }

            request.setAttribute("jobSelect", jobSelect);
        }
            request.setAttribute("alljobs", jobDaoLocal.getAllJobs());
            request.getRequestDispatcher("/WEB-INF/pages/job/jobEditInput.jsp").forward(request, response);
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
