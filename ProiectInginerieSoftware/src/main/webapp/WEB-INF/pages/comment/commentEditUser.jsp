<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="CommentEdit">

    <div class="center">   
        <h2>Comments Edit User</h2>
        <form action="./CommentEditUserServlet" method="POST">

            <select name="userid" required>
                <option value="">Choose User</option>
                <c:forEach var="user" items="${allUsers}" varStatus="status">
                    <option value="${user.userid}"> ${user.username}</option> 
                </c:forEach>                      
            </select>
            <br>
              <c:if test="${message != null}">
                    <div class="alert alert-warning" role="alert">
                        ${message}
                    </div>   
                </c:if>
            <button type="submit" class="btn3" name="action" value="Edit" >Edit</button>
            <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
            <br>
        </form>
    </div>

</t:pageTemplate>