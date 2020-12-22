<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobDelete">
    <jsp:body>
        <div class="center">    
            <h2>Job Delete</h2>
            <form action="./JobAprobaServlet" method="POST">
                <label>Select job for approve</label>
                <select name="jobid" required>
                    <option value="">Job</option>
                    <c:forEach var="job" items="${allJobs}" varStatus="status">
                        <d:if test="${job.getStatus()==null}">
                            <option value="${job.jobid}">  ${job.jobname}</option>
                        </d:if>
                    </c:forEach>
                </select>
                <br>
                <button type="submit" class="btn3" name="action" value="Aproba">Aproba</button>
                <a href="JobsServlet"><button class="btn3" type="button">Back</button></a>
                <br>
                <br>

            </form>
        </div>
    </jsp:body>
</t:pageTemplate>