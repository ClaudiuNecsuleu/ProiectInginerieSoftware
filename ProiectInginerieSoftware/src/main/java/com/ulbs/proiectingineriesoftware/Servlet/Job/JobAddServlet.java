package com.ulbs.proiectingineriesoftware.Servlet.Job;

import static com.ulbs.proiectingineriesoftware.Common.SendEmail.send;
import com.ulbs.proiectingineriesoftware.Models.Job;
import com.ulbs.proiectingineriesoftware.Services.JobDaoLocal;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ulbs.proiectingineriesoftware.Models.User;
import java.util.List;


@WebServlet(name = "JobAddServlet", urlPatterns = {"/JobAddServlet"})
public class JobAddServlet extends HttpServlet {

 
   @EJB
    private JobDaoLocal jobsDaoLocal;
   
     @EJB
     private UserDaoLocal userDaoLocal;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
         if (request != null) {
            String action = request.getParameter("action");
            String jobidStr = request.getParameter("jobid");
            Integer jobid = 0;
            if (jobidStr != null && !jobidStr.equals("")) {
                jobid = Integer.parseInt(jobidStr);
            }
            String namejob = request.getParameter("jobname");
            String description = request.getParameter("description");

            String leftJobStr = request.getParameter("remainingjob");
            int remainingjob = 0;
            if (leftJobStr != null && !leftJobStr.equals("")) {
                remainingjob = Integer.parseInt(leftJobStr);
            }
            String publisher = request.getParameter("publisher");

            Job job = new Job(namejob, remainingjob, description, publisher);

            if ("Add".equalsIgnoreCase(action)) {
                jobsDaoLocal.addJobToUser(publisher, job);
                request.setAttribute("message", "Successful!");
                List<User> userList = userDaoLocal.getAllUsers();
                
                for(User user : userList)
                {
                if(user.getFunctia().equals("DIRGEN"))
                {
                    System.out.println(user.getFunctia());
                 send(user.getMail(), "Job nou", "Job-ul cu numele: "+job.getJobname()+" a fost adaugat de "+publisher+" si necesita aprobare! Te rugam sa vizitezi site-ul pentru acest lucru.", "abc12dll@gmail.com", "firmasoftwareabc12DLL");
                }
                }
                
            } else{
            request.setAttribute("message", "Failed!");
            }

            request.setAttribute("job", job);
        }
        request.setAttribute("allJobs", jobsDaoLocal.getAllJobs());
        request.getRequestDispatcher("/WEB-INF/pages/job/jobAdd.jsp").forward(request, response);
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
        request.getRequestDispatcher("/WEB-INF/pages/job/jobAdd.jsp").forward(request, response);
     
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
