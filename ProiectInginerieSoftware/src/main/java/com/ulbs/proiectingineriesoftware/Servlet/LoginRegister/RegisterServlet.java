package com.ulbs.proiectingineriesoftware.Servlet.LoginRegister;

import com.ulbs.proiectingineriesoftware.Common.LanguageBean;
import com.ulbs.proiectingineriesoftware.Common.PasswordUtil;
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
import com.ulbs.proiectingineriesoftware.Common.SendEmail;
import java.util.logging.Logger;
import javax.inject.Inject;


@MultipartConfig
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    public String status = "gol";

    @EJB
    private UserDaoLocal userDaoLocal;
    @Inject
   LanguageBean languageBean;
    
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

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("language", languageBean.getLocale());
        request.getRequestDispatcher("/WEB-INF/pages/loginreg/register.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        
        String password;
        
          if (name.length() > 3) {
            password = name.substring(0, 3);
        } else {
            password = name;
        }

        if (prenume.length() > 3) {
            password += prenume.substring(0, 3);
        } else {
            password += prenume;
        }

        password += telefonMobil.substring(telefonMobil.length() - 2, telefonMobil.length());
        String passwrodSha256 = PasswordUtil.convertToSha256(password);
        LOG.info("Parola ta e "+password);
        User user = new User(name, prenume, telefon, telefonMobil, mail, "USER", descriere, createUsername(name, prenume), passwrodSha256);

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
                Role role = new Role("USER");
                userDaoLocal.addRoleToUser(role, user.getUsername());
                status = "Succ.reg" ;
                SendEmail.send(mail, "Inregistrare abc.dll", "Salut "+user.getUsername()+ " ,ne bucuram ca ai ales site-ul nostru ! .Parola ta este: "+password+".","abc12dll@gmail.com", "firmasoftwareabc12DLL");

            } else {
                status = "Fail.reg";
            }

        }
        request.setAttribute("user", user);
        request.setAttribute("language", languageBean.getLocale());
        request.setAttribute("message", status);
        request.setAttribute("message", "Eroare.logare");
        request.getRequestDispatcher("/WEB-INF/pages/loginreg/register.jsp").forward(request, response);
    }
    private static final Logger LOG = Logger.getLogger(RegisterServlet.class.getName());

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold
}
