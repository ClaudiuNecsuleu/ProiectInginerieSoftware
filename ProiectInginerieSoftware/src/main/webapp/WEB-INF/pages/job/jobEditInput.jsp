<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="JobEdit">
    <jsp:body>
        <div class="center">    
            <h2>Job Edit</h2>
            <form action="./JobEditInputServlet" method="POST">
                <div class="txt_field"> <input type="hidden" name="jobidSelect" value="${jobSelect.jobid}"></div>
                <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${jobSelect.jobname}" required></div>
                <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${jobSelect.description}" required></div>
                <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${jobSelect.remainingjob}" required></div>
                <div class="txt_field">  <input type="text" placeholder="publiser" name="publisher" value="${jobSelect.publisher}" readonly required></div>

                <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
                <a href="JobsServlet"><button class="btn3" type="button">Back</button></a>
                <br><br>
            </form>
        </div>
        <br>
        <div class="centerjeinput">
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
                            <d:if test="${job.getStatus()!=null}">
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
                            </d:if>
                        </tr>   
                    </c:forEach>
                </table>
                <br><br>
            </form>

        </div>
    </jsp:body>
</t:pageTemplate>