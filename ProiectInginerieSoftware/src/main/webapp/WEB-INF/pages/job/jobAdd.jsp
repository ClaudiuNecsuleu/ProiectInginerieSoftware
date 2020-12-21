<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobAdd">
    <jsp:body>
        <div class="center">    

            <h2>Job Add</h2>
            <form action="./JobsServlet" method="POST">
                <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${job.jobname}" required></div>
                <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${job.description}" required></div>
                <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${job.remainingjob}" required></div>
                <input type="hidden" name="publisher" value="${name}">
                <button type="submit" name="action" value="Add">Add</button>
                <a href="JobsServlet"><button type="button">Back</button></a>
                
            </form>
        </div>
    </jsp:body>
</t:pageTemplate>