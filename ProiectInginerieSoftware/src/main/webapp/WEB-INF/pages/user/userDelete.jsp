<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="UserDelete">

    <div class="center">
        <h2>Users Delete</h2>
        <form action="./UserDeleteServlet" method="POST">

            <label><strong>Select user to delete:</strong></label>
            <select name="userid" required>
                <option value="">Username</option>
                <c:forEach var="user" items="${allUsers}" varStatus="status">
                    <option value="${user.userid}">  ${user.username}</option>
                </c:forEach>
            </select>
            <br>
            <button type="submit" class="btn3" name="action" value="Delete">Delete</button>
            <a href="UserServlet"><button class="btn3" type="button">Back</button></a>
        </form>
        <br>
    </div>
    
</t:pageTemplate>