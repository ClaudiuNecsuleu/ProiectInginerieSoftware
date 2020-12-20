package com.ulbs.proiectingineriesoftware.Servlet.Applicant;

import com.ulbs.proiectingineriesoftware.Services.JobDaoLocal;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "JobApplicantServlet", urlPatterns = {"/JobApplicantServlet"})
public class JobApplicantServlet extends HttpServlet {
    
    @EJB
    JobDaoLocal jobDaoLocal;
    @EJB
    UserDaoLocal userDaoLocal;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request != null) {
            String action = request.getParameter("action");
            
            String username = request.getParameter("username");
            String jobname = request.getParameter("jobname");
            String deleteApp = request.getParameter("deleteApp");
            String deleteJob = request.getParameter("deleteJob");
            
            if ("Add".equalsIgnoreCase(action)) {
                jobDaoLocal.addUserApplicantToJob(username, jobname);
            } else if ("Def".equalsIgnoreCase(action)) {
                userDaoLocal.setJobApplicantDeafult(username);
                
            } else if ("Select".equalsIgnoreCase(action)) {
                userDaoLocal.confirmJob(username);
                
            } else if ("SelectDelete".equalsIgnoreCase(action)) {
                userDaoLocal.setJobApplicantDeafult(deleteApp);
                
            } else if ("SelectDeleteJob".equalsIgnoreCase(action)) {
                jobDaoLocal.deleteUserFromJob(deleteJob);
            }
            
            request.setAttribute("jobList", jobDaoLocal.getAllJobs());
            request.setAttribute("userList", userDaoLocal.getAllUsers());
            request.getRequestDispatcher("jobApplicant.jsp").forward(request, response);
        }
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
