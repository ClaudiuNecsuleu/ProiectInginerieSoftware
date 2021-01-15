package com.ulbs.proiectingineriesoftware.Servlet.Applicant;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Services.JobDaoLocal;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
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

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"UserRole"}))
@WebServlet(name = "JobApplicantServlet", urlPatterns = {"/JobApplicantServlet"})
public class JobApplicantServlet extends HttpServlet {

    @EJB
    JobDaoLocal jobDaoLocal;
    @EJB
    UserDaoLocal userDaoLocal;
    @Inject
   LanguageBean languageBean;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("jobList", jobDaoLocal.getAllJobs());
        request.setAttribute("userList", userDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/applicant/jobApplicant.jsp").forward(request, response);

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
