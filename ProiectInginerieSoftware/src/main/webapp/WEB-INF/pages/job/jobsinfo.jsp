
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Job">

    <div class="center">
        <form>
            <h2>Job Info</h2>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
            <a href="JobAddServlet"><button class="btn" type="button">Add</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
            <a href="JobEditServlet"><button class="btn" type="button">Edit</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('DirGenRole')}">
            <a href="JobDeleteServlet"><button class="btn" type="button">Delete</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('DirGenRole')}">
            <a href="JobAprobaServlet"><button class="btn" type="button">Aprobare</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('UserRole')}">
            <a href="IndexServlet"><button class="btn" type="button">Back</button></a>
            </c:if>
            <br><br>
        </form>

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
                        <d:if test="${job.getStatus()!=null}">
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
                        </d:if>
                    </tr>   
                </c:forEach>
            </table>
            <br><br>
        </form>

    </div>
</t:pageTemplate>
