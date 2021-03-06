<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobApplicant">
    <jsp:body>
        <div class="center">

            <h2><fmt:message key="Job.Applicant"/></h2>
            <form action="./ViewCVApplicant" method="POST">

                <c:forEach var="user" items="${userList}" varStatus="status">
                    <c:if test="${user.getJobApplicant() != null}">
                        <d:if test="${user.getRecomandare() != null}">
                            <e:if test="${user.getFile() != null}">
                                <label><fmt:message key="User"/> ${user.username} , CV: ${user.getFile().getFilename()} </label>
                                <button type="submit" class="btn3" name="username" value="${user.username}"><fmt:message key="View"/></button> 
                                <br>
                            </e:if>
                        </d:if>
                    </c:if>
                </c:forEach>

             <a href="JobApplicantServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
                <br><br>
            </form>
        </div>

    </jsp:body>
</t:pageTemplate>