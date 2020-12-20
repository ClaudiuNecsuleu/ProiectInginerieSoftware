<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Login">
        <div class="center"> 
            <h2>Login</h2>
            <form action="./LoginServlet" method="POST">
                <div class="txt_field">  <input type="text" placeholder="Username" name="username" maxlength="23" size="25" required/>  </div> 
                <div class="txt_field">  <input type="text" placeholder="Password" name="password" required/>  </div> 
                <button type="submit" name="action" value="Login">Login</button>
                <a href="index.xhtml"><button type="button" class="cancelbtn" >Cancel</button></a>
            </form>
        </div>
</t:pageTemplate>