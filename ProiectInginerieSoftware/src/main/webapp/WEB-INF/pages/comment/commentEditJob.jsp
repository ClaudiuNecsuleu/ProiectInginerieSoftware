<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="CommentEdit">

    <div class="center">   
        <h2>Comments Edit Job</h2>
        <form action="./CommentEditJobServlet" method="POST">

            <select name="jobid" required>
                <option value="">Choose job</option>
                <c:forEach var="job" items="${allJobs}" varStatus="status">
                    <option value="${job.jobid}"> ${job.jobname}</option> 
                </c:forEach>                      
            </select>
            <br>
            <button type="submit" class="btn3" name="action" value="Edit" >Edit</button>
            <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
            <br>
        </form>
    </div>

</t:pageTemplate>