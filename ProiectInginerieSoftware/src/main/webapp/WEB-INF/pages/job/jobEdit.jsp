<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="JobApplicant">
    <jsp:body>
        <div class="comm">    
            <h2>Job Edit</h2>
            <form action="./JobEditInputServlet" method="POST">
                <label><strong>Select job to edit:</strong></label>
                <select name="jobid" required>
                    <option value="">Jobname</option>
                    <c:forEach var="job" items="${allJobs}" varStatus="status">
                        <option value="${job.jobid}"> ${job.jobname}</option>
                    </c:forEach>
                </select>
                <br>
                <button type="submit" class="btn3" value="Edit">Edit</button>
                <a href="JobsServlet"><button class="btn3" type="button">Back</button></a>
            </form>
            <br>
        </div>
        <div class="centerj">
            <form>
                <br><br>
                <table>
                    <th>IDJob</th>
                    <th>Job name</th>
                    <th>Job description</th>
                    <th>Remaining posts</th>
                    <th>Publisher</th>
                        <c:forEach items="${allJobs}" var="job">
                        <tr>
                            <td>${job.jobid}</td>
                            <td>${job.jobname}</td>
                            <td>${job.description}</td>
                            <c:if test="${job.getRemainingjob()!=0}">
                                <td>${job.remainingjob}</td>
                            </c:if>
                            <c:if test="${job.getRemainingjob()==0}">
                                <td>Job inchis</td>
                            </c:if>
                            <td>${job.publisher}</td>
                        </tr>   
                    </c:forEach>
                </table>

            </form>
        </div>
    </jsp:body>
</t:pageTemplate>