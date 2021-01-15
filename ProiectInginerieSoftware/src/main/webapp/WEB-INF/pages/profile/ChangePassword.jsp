<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />
 
<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="Change Password">
    <div class="centeruinput">
        <h2><fmt:message key="Edit.pass"/></h2>
        <form action="./ChangePassword" method="POST"  >
            <div class="txt_field">  <input type="hidden" name="username" value="${name}"></div>
            <div class="txt_field"> <input type="password" name="passwordold" placeholder="<fmt:message key="PasswordOld"/>" required></div>
            <div class="txt_field"> <input type="password" name="password" placeholder="<fmt:message key="Password"/>" required></div>
            <div class="txt_field"> <input type="password" name="password2" placeholder="<fmt:message key="Password"/>" required></div>
            <c:if test="${status != null}">
            <fmt:message key="${status}"/>
            </c:if>
            <button type="submit" class="btn3" name="action" value="Change"><fmt:message key="Change"/></button>
            <a href="ProfileServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
            <br> <br>
        </form> 
    </div>
</t:pageTemplate>
