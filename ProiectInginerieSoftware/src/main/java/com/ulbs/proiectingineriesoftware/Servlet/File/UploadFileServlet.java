/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ulbs.proiectingineriesoftware.Servlet.File;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Models.File;
import com.ulbs.proiectingineriesoftware.Models.User;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"UserRole"}))
@MultipartConfig
@WebServlet(name = "UploadFileServlet", urlPatterns = {"/UploadFileServlet"})
public class UploadFileServlet extends HttpServlet {

   
    @EJB
    private UserDaoLocal userDaoLocal;

    @Inject
    LanguageBean languageBean;
    
    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

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

        File file = new File(fileName, fileType, fileContent);

        User user = userDaoLocal.getUserByUsername(username);
        if(user.getFile()!=null)
        {
        userDaoLocal.deleteUserCV(user);
        }
        userDaoLocal.setUserFile(user, file);
        
        request.setAttribute("language", languageBean.getLocale());
        request.getRequestDispatcher("ProfileServlet").forward(request, response);

    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
