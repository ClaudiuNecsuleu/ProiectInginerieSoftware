<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="Comment">
    <jsp:body>
        <div class="comm">  
            <h2>Comments Add</h2>
            <form action="./CommentJobServlet" method="POST">
                <label><strong>Select job to add a comment:</strong></label>
                <select  name="jobname" id="jobname"  required>
                    <option value="">jobname</option>
                    <c:forEach var="job" items="${allJobs}" varStatus="status">
                        <option value="${job.jobname}">  ${job.jobname}</option>
                    </c:forEach>
                </select>
                <div class="txt_field"> <input type="text" placeholder="Comment" name="comment" value="${comment.comment}" required></div>
                <input type="hidden" name="publisherUsername" value="${name}">
                <button type="submit" class="btn3" name="action" value="AddJob">Add</button>
                <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
                <br>
            </form>
        </div>
    </jsp:body>
</t:pageTemplate>
