<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobAdd">
    <jsp:body>
        <div class="center">    

            <h2><fmt:message key="Job.Add"/></h2>
            <form action="./JobAddServlet" method="POST">
                <div class="txt_field"> <input type="text" placeholder="<fmt:message key="Nume"/>" name="jobname" value="${job.jobname}" required></div>
                <div class="txt_field"><input type="text" placeholder="<fmt:message key="Descriere"/>" name="description" value="${job.description}" required></div>
                <div class="txt_field">  <input type="text" placeholder="<fmt:message key="Remaining.posts"/>" name="remainingjob" value="${job.remainingjob}" required></div>
                <input type="hidden" name="publisher" value="${name}">
                <c:if test="${message != null}">
                    <div class="alert alert-warning" role="alert">
                       <fmt:message key="${message}"/>
                    </div>   
                </c:if>
                <button type="submit" name="action" value="Add"><fmt:message key="Add"/></button>
                <a href="JobsServlet"><button type="button"><fmt:message key="Back"/></button></a>

            </form>
        </div>
    </jsp:body>
</t:pageTemplate>