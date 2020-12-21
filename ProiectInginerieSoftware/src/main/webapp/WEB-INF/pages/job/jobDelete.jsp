<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobApplicant">
    <jsp:body>
        <div class="comm">    
            <h2>Job Delete</h2>
            <form action="./JobDeleteServlet" method="POST">
                <label>Select job to delete:</label>
                <select name="jobid" required>
                    <option value="">Job</option>
                    <c:forEach var="job" items="${allJobs}" varStatus="status">
                        <option value="${job.jobid}">  ${job.jobname}</option>
                    </c:forEach>
                </select>
                <br>
                <button type="submit" class="btn3" name="action" value="Delete">Delete</button>
                <a href="JobsServlet"><button class="btn3" type="button">Back</button></a>

            </form>
        </div>
    </jsp:body>
</t:pageTemplate>