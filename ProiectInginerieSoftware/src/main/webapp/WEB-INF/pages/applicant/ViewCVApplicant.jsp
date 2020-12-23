<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobApplicant">
    <jsp:body>
        <div class="center">

            <h2>Job Applicant</h2>
            <form action="./ViewCVApplicant" method="POST">
                <select name="username"  required/>
                <option value="">View CV..</option>
                <c:forEach var="user" items="${userList}" varStatus="status">
                    <c:if test="${user.getJobApplicant() != null}">
                        <d:if test="${user.getRecomandare() != null}">
                            <e:if test="${user.getFile() != null}">
                                <option value="${user.username}"> ${user.username} , CV: ${user.getFile().getFilename()} </option>
                            </e:if>
                        </d:if>
                    </c:if>
                </c:forEach>
                </select>     
                <input type="hidden" name="recruiterName" value="${name}" />
                <button type="submit" class="btn3" name="action" value="View">View</button> 
                <br><br>
            </form>
        </div>

    </jsp:body>
</t:pageTemplate>