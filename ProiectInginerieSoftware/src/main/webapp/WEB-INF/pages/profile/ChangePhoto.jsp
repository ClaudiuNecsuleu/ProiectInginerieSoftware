<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="Change Photo">
    <div class="centeruinput">
        <h2>Users Edit</h2>
        <form action="./ChangePhoto" method="POST" enctype="multipart/form-data" novalidate>
            <div class="txt_field">  <input type="hidden" name="username" value="${name}"></div>
            <div>
                <label for="file">Photo</label>
                <input type="file" name="file" required>                      
            </div>
            <button type="submit" class="btn3" name="action" value="Change">Change</button>
            <a href="ProfileServlet"><button class="btn3" type="button">Back</button></a>
        </form> 
    </div>
</t:pageTemplate>

