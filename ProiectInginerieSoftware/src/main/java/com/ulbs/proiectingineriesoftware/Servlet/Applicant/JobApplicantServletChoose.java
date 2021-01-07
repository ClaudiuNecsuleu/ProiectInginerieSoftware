package com.ulbs.proiectingineriesoftware.Servlet.Applicant;

import com.ulbs.proiectingineriesoftware.Common.SendEmail;
import com.ulbs.proiectingineriesoftware.Models.User;
import com.ulbs.proiectingineriesoftware.Services.JobDaoLocal;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import javax.ejb.EJB;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        request.setAttribute("jobList", jobDaoLocal.getAllJobs());
        request.setAttribute("userList", userDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/applicant/jobApplicantChoose.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String recruiterName = request.getParameter("recruiterName");
        if (username != null) {
            userDaoLocal.recomandaUser(username, recruiterName);
            User user = userDaoLocal.getUserByUsername(username);
            if (user.getRecomandare().equals(recruiterName)) {
                request.setAttribute("message", "Successful!");
                SendEmail.send(user.getMail(), "Tocmai ai fost recomandat!", "Salut " + user.getUsername() + " ,tocmai ai fosr repartizat de recruiterul nostru, " + recruiterName + ".Iti dorim mult succes in urmatoarea repartitie,cu drag abc.dll !", "abc12dll@gmail.com", "firmasoftwareabc12DLL");

            } else {
//            request.setAttribute("message", "Failed!");
            }
        }
        request.setAttribute("jobList", jobDaoLocal.getAllJobs());
        request.setAttribute("userList", userDaoLocal.getAllUsers());
        request.getRequestDispatcher("/WEB-INF/pages/applicant/jobApplicantChoose.jsp").forward(request, response);
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
