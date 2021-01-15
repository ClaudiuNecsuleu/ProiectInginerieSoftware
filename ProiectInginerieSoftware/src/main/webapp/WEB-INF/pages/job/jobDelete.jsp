<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobDelete">
    <jsp:body>
        <div class="center">    
            <h2><fmt:message key="Job.Delete"/></h2>
            <form action="./JobDeleteServlet" method="POST">
                <label><fmt:message key="Select.job.delete"/></label>
                <select name="jobid" required>
                    <option value=""><fmt:message key="Job"/></option>
                    <c:forEach var="job" items="${allJobs}" varStatus="status">
                        <option value="${job.jobid}">  ${job.jobname}</option>
                    </c:forEach>
                </select>
                <br>
                <c:if test="${message != null}">
                    <div class="alert alert-warning" role="alert">
                        <fmt:message key="${message}"/>
                    </div>   
                </c:if>
                <button type="submit" class="btn3" name="action" value="Delete"><fmt:message key="Delete"/></button>
                <a href="JobsServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
                <br>
                <br>

            </form>
        </div>
    </jsp:body>
</t:pageTemplate>