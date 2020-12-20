<%-- 
    Document   : login
    Created on : Oct 12, 2020, 1:17:34 PM
    Author     : oleof
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <title>Login Page</title>
    </head>
    <body class="login">
        <div class="center"> 
            <h2>Login</h2>
            <form action="./LoginServlet" method="POST">
                <div class="txt_field">  <input type="text" placeholder="Username" name="username" maxlength="23" size="25" required/>  </div> 
                <div class="txt_field">  <input type="text" placeholder="Password" name="password" required/>  </div> 
                <button type="submit" name="action" value="Login">Login</button>
                <a href="index.xhtml"><button type="button" class="cancelbtn" >Cancel</button></a>
            </form>
        </div>
    </body>
</html>