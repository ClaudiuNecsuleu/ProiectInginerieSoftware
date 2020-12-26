package com.ulbs.proiectingineriesoftware.Servlet.Index;

import com.ulbs.proiectingineriesoftware.Models.Role;
import com.ulbs.proiectingineriesoftware.Models.User;
import com.ulbs.proiectingineriesoftware.Services.JobDaoLocal;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "IndexServlet", urlPatterns = {"/IndexServlet"})
public class IndexServlet extends HttpServlet {

    @EJB
    UserDaoLocal userDaoLocal;
    @EJB
    JobDaoLocal jobDaoLocal;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!userDaoLocal.existsRoleWithName("Admin")) {
            Role role = new Role("Admin");
            userDaoLocal.addRole(role);
        }
        if (!userDaoLocal.existsRoleWithName("DirectorGeneral")) {
            Role role = new Role("DirectorGeneral");
            userDaoLocal.addRole(role);
        }

        if (!userDaoLocal.existsRoleWithName("DirectorHR")) {
            Role role = new Role("DirectorHR");
            userDaoLocal.addRole(role);
        }

        if (!userDaoLocal.existsRoleWithName("DirectorDep")) {
            Role role = new Role("DirectorDep");
            userDaoLocal.addRole(role);
        }

        if (!userDaoLocal.existsRoleWithName("Recruiter")) {
            Role role = new Role("Recruiter");
            userDaoLocal.addRole(role);
        }

        if (!userDaoLocal.existsRoleWithName("User")) {
            Role role = new Role("User");
            userDaoLocal.addRole(role);
        }

        if (!userDaoLocal.existsUserWithUsername("admin")) {

            User user = new User("admin", "admin","688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6", "07217351", "931293791", "abc12dll@gmail.com", "ADMIN", "Face si el ce poate", "admin", null, null, null, null);
            userDaoLocal.addUser(user);
            userDaoLocal.addRoleToUser(new Role("Admin"), user.getUsername());

        }
        if (!userDaoLocal.existsUserWithUsername("dirgen")) {

            User user = new User("dirgen", "dirgen","688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6", "07217352", "931293792", "abc12dll@gmail.com", "DIRGEN", "Face si el ce poate", "dirgen", null, null, null, null);
            userDaoLocal.addUser(user);
            userDaoLocal.addRoleToUser(new Role("DirectorGeneral"), user.getUsername());

        }
        if (!userDaoLocal.existsUserWithUsername("dirhr")) {

            User user = new User("dirhr", "dirhr","688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6", "07217353", "931293793", "abc12dll@gmail.com", "DIRHR", "Face si el ce poate", "dirhr", null, null, null, null);
            userDaoLocal.addUser(user);
            userDaoLocal.addRoleToUser(new Role("DirectorHR"), user.getUsername());

        }
        if (!userDaoLocal.existsUserWithUsername("dirdep")) {

            User user = new User("dirdep", "dirdep","688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6", "07217354", "931293794", "abc12dll@gmail.com", "DIRDEP", "Face si el ce poate", "dirdep", null, null, null, null);
            userDaoLocal.addUser(user);
            userDaoLocal.addRoleToUser(new Role("DirectorDep"), user.getUsername());

        }
        if (!userDaoLocal.existsUserWithUsername("recruiter")) {

            User user = new User("recruiter", "recruiter","688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6", "07217355", "931293795", "abc12dll@gmail.com", "RECRUITER", "Face si el ce poate", "recruiter", null, null, null, null);
            userDaoLocal.addUser(user);
            userDaoLocal.addRoleToUser(new Role("Recruiter"), user.getUsername());

        }
        if (!userDaoLocal.existsUserWithUsername("user")) {

            User user = new User("User", "User","688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6", "07217356", "931293796", "abc12dll@gmail.com", "USER", "Face si el ce poate", "user", null, null, null, null);
            userDaoLocal.addUser(user);
            userDaoLocal.addRoleToUser(new Role("User"), user.getUsername());

        }

        request.setAttribute("allJobs", jobDaoLocal.getAllJobs());
        request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
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
