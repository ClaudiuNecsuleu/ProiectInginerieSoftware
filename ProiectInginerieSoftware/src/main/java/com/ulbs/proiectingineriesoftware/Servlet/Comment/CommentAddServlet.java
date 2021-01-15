package com.ulbs.proiectingineriesoftware.Servlet.Comment;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Models.Comment;
import com.ulbs.proiectingineriesoftware.Services.CommentDaoLocal;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
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

@WebServlet(name = "CommentAddServlet", urlPatterns = {"/CommentAddServlet"})
public class CommentAddServlet extends HttpServlet {

    
    @EJB
    private CommentDaoLocal commentDaoLocal;
    
    @Inject
   LanguageBean languageBean;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request != null) {
            String action = request.getParameter("action");

            String username = request.getParameter("username");
            String comment1 = request.getParameter("comment");
            String publisherUsername = request.getParameter("publisherUsername");

            LocalTime time = LocalTime.now();
            LocalDate date1 = LocalDate.now();

            Comment comment = new Comment(comment1, date1, time, publisherUsername);
            if ("Add".equalsIgnoreCase(action)) {
                commentDaoLocal.addCommentToUser(comment, username);
                request.setAttribute("message", "Successful!");
            }
            else{
//            request.setAttribute("message", "Failed!");
            }
            request.setAttribute("comment", comment);
            request.setAttribute("username", username);
            request.setAttribute("publisherUsername", publisherUsername);

        }
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("allUsers", commentDaoLocal.getUsersList());          //trebuie o lista de users
        request.getRequestDispatcher("/WEB-INF/pages/comment/commentAdd.jsp").forward(request, response);

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
