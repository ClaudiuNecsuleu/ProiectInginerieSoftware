<%-- 
    Document   : register
    Created on : Oct 12, 2020, 1:19:25 PM
    Author     : oleof
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
    </head>
    <body class="login">
        <div class="center"> 
            <h2>Register</h2>

            <form action="./RegisterServlet" method="POST" enctype="multipart/form-data" novalidate >     
                <div class="txt_field"> <input type="text" placeholder="Nume" name="name" value="${users.name}" required/></div>
                <div class="txt_field">  <input type="text" placeholder="Prenume" name="prenume" value="${users.prenume}" required/></div>
                <div class="txt_field"> <input type="text" placeholder="Telefon" name="telefon" value="${users.telefon}" required/></div>
                <div class="txt_field">  <input type="text" placeholder="Telefon Mobil" name="telefonMobil" value="${users.telefonMobil}" required/></div>
                <div class="txt_field"><input type="text" placeholder="Mail" name="mail" value="${users.mail}" required/></div>
                <div class="txt_field"> <input type="text" placeholder="Descriere" name="descriere" value="${users.descriere}" required/>    </div>
                    <%
                        String status = (String) request.getAttribute("status");
                        if (status == "ok") {
                            out.print("Inregistrat cu succes!");
                        }
                    %>

  
                <div>
                    <div>
                        <label for="file">Photo</label>
                        <input type="file" name="file" required>                      
                    </div>
                </div>
            
                <button type="submit" name="action" value="Add">Register</button>
                <a href="index.xhtml"><button type="button" class="cancelbtn" >Cancel</button></a>
            </form>

        </div>



    </body>
</html>