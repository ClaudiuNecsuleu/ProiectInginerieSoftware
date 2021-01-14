<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="CommentToUser">
    <jsp:body>
        <div class="center">   
            <h2><fmt:message key="Comments Add"/></h2>
            <form action="./CommentAddServlet" method="POST">
                <label><strong><fmt:message key="Select user to add a comment:"/></strong></label>
                <select  name="username" id="username"  required>
                    <option value=""><fmt:message key="Username"/></option>
                    <c:forEach var="user" items="${allUsers}" varStatus="status">
                        <option value="${user.username}">  ${user.username}</option>
                    </c:forEach>
                </select>
                <div class="txt_field"> <input type="text" placeholder="<fmt:message key="Comment"/>" name="comment" value="${comment.comment}" required></div>
                <input type="hidden" name="publisherUsername" value="${name}">
                  <c:if test="${message != null}">
                    <div class="alert alert-warning" role="alert">
                        ${message}
                    </div>   
                </c:if>
                <button type="submit" class="btn3" name="action" value="Add"><fmt:message key="Add"/></button>
                <a href="CommentServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
                <br>
            </form>
        </div>
    </jsp:body>
</t:pageTemplate>
