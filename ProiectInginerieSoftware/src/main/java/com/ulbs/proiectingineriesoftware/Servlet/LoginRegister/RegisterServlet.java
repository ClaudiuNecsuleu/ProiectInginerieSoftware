package com.ulbs.proiectingineriesoftware.Servlet.LoginRegister;

import com.ulbs.proiectingineriesoftware.Models.Photo;
import com.ulbs.proiectingineriesoftware.Models.Role;
import com.ulbs.proiectingineriesoftware.Models.User;
import com.ulbs.proiectingineriesoftware.Services.UserDaoLocal;
import java.io.IOException;
import java.util.Random;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    public String status = "gol";

    @EJB
    private UserDaoLocal userDaoLocal;

    private String createUsername(String name, String prenume) {
        String username = "";

        if (name.length() >= 5) {
            username = name.substring(0, 5) + prenume.charAt(0);
        } else {
            username = name + prenume.charAt(0);
        }

        if (existsUsername(username)) {

            Random rn = new Random();
            int nr = Math.abs(rn.nextInt() % 100);
            username = username + nr;
        }

        return username;
    }

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

    private boolean existsUsername(String username) {

        return userDaoLocal.existsUserWithUsername(username);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String useridStr = request.getParameter("userid");
        Integer userid = 0;
        if (useridStr != null && !useridStr.equals("")) {
            userid = Integer.parseInt(useridStr);
        }
        String name = request.getParameter("name");
        String prenume = request.getParameter("prenume");
        String telefon = request.getParameter("telefon");
        String telefonMobil = request.getParameter("telefonMobil");
        String mail = request.getParameter("mail");
        String descriere = request.getParameter("descriere");

        User user = new User(name, prenume, telefon, telefonMobil, mail, "Fara", descriere, createUsername(name, prenume));

        Part filePart = request.getPart("file");
        String fileName = getSubmittedFileName(filePart);
        String fileType = filePart.getContentType();
        long fileSize = filePart.getSize();
        byte[] fileContent = new byte[(int) fileSize];
        filePart.getInputStream().read(fileContent);

        Photo photo = new Photo(fileName, fileType, fileContent);

        if ("Add".equalsIgnoreCase(action)) {
            userDaoLocal.addUser(user);
            if (userDaoLocal.existsUserWithUsername(user.getUsername())) {
                userDaoLocal.setUserPhoto(user, photo);
                Role role = new Role("Viewer");
                userDaoLocal.addRoleToUser(role, user.getUsername());
                status = "ok";

            } else {
                status = "false";
            }

        }

        request.setAttribute("user", user);

        request.setAttribute("status", status);
        //  request.setAttribute("status", "acasa");
        request.getRequestDispatcher("/WEB-INF/pages/loginreg/register.jsp").forward(request, response);

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
    }// </editor-fold
}
