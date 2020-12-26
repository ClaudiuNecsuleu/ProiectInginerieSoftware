<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="ChangePassword">
    <div class="centeruinput">
        <h2>Users Edit</h2>
        <form action="./ChangePassword" method="POST"  >
            <div class="txt_field">  <input type="hidden" name="username" value="${name}"></div>
            <div class="txt_field"> <input type="password" name="passwordold" placeholder="PasswordOld" required></div>
            <div class="txt_field"> <input type="password" name="password" placeholder="Password" required></div>
            <div class="txt_field"> <input type="password" name="password2" placeholder="Password" required></div>
            ${status}
            <button type="submit" class="btn3" name="action" value="Change">Change</button>
            <a href="ProfileServlet"><button class="btn3" type="button">Back</button></a>
            <br> <br>
        </form> 
    </div>
</t:pageTemplate>
