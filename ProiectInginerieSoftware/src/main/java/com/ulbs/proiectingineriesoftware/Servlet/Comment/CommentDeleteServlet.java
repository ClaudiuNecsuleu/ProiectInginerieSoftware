package com.ulbs.proiectingineriesoftware.Servlet.Comment;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Services.CommentDaoLocal;
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
@WebServlet(name = "CommentDeleteServlet", urlPatterns = {"/CommentDeleteServlet"})
public class CommentDeleteServlet extends HttpServlet {

    @EJB
    private CommentDaoLocal commentDaoLocal;

    @Inject
   LanguageBean languageBean;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request != null) {
            String action = request.getParameter("action");

            String commentIDStr = request.getParameter("commentIdUser");
            int commentID = 0;
            if (commentIDStr != null && !commentIDStr.equals("")) {
                commentID = Integer.parseInt(commentIDStr);
            }
            String commentIDStr1 = request.getParameter("commentIdJob");
            
            if (commentIDStr1 != null && !commentIDStr1.equals("")) {
                commentID = Integer.parseInt(commentIDStr1);
            }
            if ("Delete".equalsIgnoreCase(action)) {
                commentDaoLocal.deleteComment(commentID);
                request.setAttribute("message", "Successful");
            } else {
//                request.setAttribute("message", "Failed!");
            }
            request.setAttribute("commentID", commentID);
        }
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("allComments", commentDaoLocal.getAllComments());
        request.getRequestDispatcher("/WEB-INF/pages/comment/commentDelete.jsp").forward(request, response);
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
