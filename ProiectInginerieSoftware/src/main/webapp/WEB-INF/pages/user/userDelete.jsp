<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="UserDelete">

    <div class="center">
        <h2><fmt:message key="Users.Delete"/></h2>
        <form action="./UserDeleteServlet" method="POST">

            <label><strong><fmt:message key="Select.user.delete"/></strong></label>
            <select name="userid" required>
                <option value=""><fmt:message key="Username"/></option>
                <c:forEach var="user" items="${allUsers}" varStatus="status">
                    <option value="${user.userid}">  ${user.username}</option>
                </c:forEach>
            </select>
            <br>
            <button type="submit" class="btn3" name="action" value="Delete"><fmt:message key="Delete"/></button>
            <a href="UserServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
        </form>
        <br>
    </div>
    
</t:pageTemplate>