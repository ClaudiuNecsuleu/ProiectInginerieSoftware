package com.ulbs.proiectingineriesoftware.Servlet.Applicant;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Common.SendEmail;
import com.ulbs.proiectingineriesoftware.Models.User;
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

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"RecruiterRole"}))
@WebServlet(name = "JobApplicantServletChoose", urlPatterns = {"/JobApplicantServletChoose"})
public class JobApplicantServletChoose extends HttpServlet {

    @EJB
    JobDaoLocal jobDaoLocal;
    @EJB
    UserDaoLocal userDaoLocal;
    @Inject
   LanguageBean languageBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("jobList", jobDaoLocal.getAllJobs());
        request.setAttribute("userList", userDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/applicant/jobApplicantChoose.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String recruiterName = request.getParameter("recruiterName");
        if (username != null) {
            userDaoLocal.recomandaUser(username, recruiterName);
            User user = userDaoLocal.getUserByUsername(username);
            if (user.getRecomandare().equals(recruiterName)) {
                request.setAttribute("message", "Successful");
                SendEmail.send(user.getMail(), "Tocmai ai fost recomandat!", "Salut " + user.getUsername() + " ,tocmai ai fosr repartizat de recruiterul nostru, " + recruiterName + ".Iti dorim mult succes in urmatoarea repartitie,cu drag abc.dll !", "abc12dll@gmail.com", "firmasoftwareabc12DLL");

            } else {
//            request.setAttribute("message", "Failed!");
            }
        }
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("jobList", jobDaoLocal.getAllJobs());
        request.setAttribute("userList", userDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/applicant/jobApplicantChoose.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
