<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="CommentToJob">
    <jsp:body>
        <div class="center">  
            <h2><fmt:message key="Comments.Add"/></h2>
            <form action="./CommentJobServlet" method="POST">
                <label><strong><fmt:message key="Select.job.add.comment"/></strong></label>
                <select  name="jobname" id="jobname"  required>
                    <option value=""><fmt:message key="Jobname"/></option>
                    <c:forEach var="job" items="${allJobs}" varStatus="status">
                        <option value="${job.jobname}">  ${job.jobname}</option>
                    </c:forEach>
                </select>
                <div class="txt_field"> <input type="text" placeholder="<fmt:message key="Comment"/>" name="comment" value="${comment.comment}" required></div>
                <input type="hidden" name="publisherUsername" value="${name}">
                  <c:if test="${message != null}">
                    <div class="alert alert-warning" role="alert">
                        <fmt:message key="${message}"/>
                    </div>   
                </c:if>
                <button type="submit" class="btn3" name="action" value="AddJob"><fmt:message key="Add"/></button>
                <a href="CommentServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
                <br>
            </form>
        </div>
    </jsp:body>
</t:pageTemplate>
