package com.ulbs.proiectingineriesoftware.Servlet.Photo;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.ulbs.proiectingineriesoftware.Models.Photo;
import com.ulbs.proiectingineriesoftware.Models.User;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.ServletSecurity;

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"UserRole"}))
@MultipartConfig
@WebServlet(name = "ChangePhoto", urlPatterns = {"/ChangePhoto"})
public class ChangePhoto extends HttpServlet {

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

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
        request.getRequestDispatcher("/WEB-INF/pages/profile/ChangePhoto.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        Part filePart = request.getPart("file");
        String fileName = getSubmittedFileName(filePart);
        String fileType = filePart.getContentType();
        long fileSize = filePart.getSize();
        byte[] fileContent = new byte[(int) fileSize];
        filePart.getInputStream().read(fileContent);

        Photo photo = new Photo(fileName, fileType, fileContent);
        User user = userDaoLocal.getUserByUsername(username);

        if (user.getPhoto() != null) {
            userDaoLocal.deleteUserPhoto(user);
        }
        userDaoLocal.setUserPhoto(user, photo);

         request.getRequestDispatcher("ProfileServlet").forward(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
