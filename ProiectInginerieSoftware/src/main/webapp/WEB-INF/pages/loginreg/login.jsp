<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Login">
     <div class="center"> 
    
         <h2>Login</h2>
    <form method="POST" action="j_security_check">
        <div class="txt_field"> <input type="text"  name="j_username"  placeholder="Username" required autofocus/></div>
        <div class="txt_field"><input type="password"  name="j_password" placeholder="Password" required/></div>
            <c:if test="${message != null}">
        <div class="alert alert-warning" role="alert">
            ${message}
        </div>   
    </c:if>
        <button  type="submit">Sign in</button>
          <a href="RegisterServlet"><button type="button" class="cancelbtn" >Register</button></a>
    </form>
     </div>
</t:pageTemplate>