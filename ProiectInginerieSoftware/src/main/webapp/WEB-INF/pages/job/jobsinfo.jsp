
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Job">

    <div class="center">
        <form>
            <h2><fmt:message key="Job Info"/></h2>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
            <a href="JobAddServlet"><button class="btn" type="button"><fmt:message key="Add"/></button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
            <a href="JobEditServlet"><button class="btn" type="button"><fmt:message key="Edit"/></button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('DirGenRole')||pageContext.request.isUserInRole('AdminRole')}">
            <a href="JobDeleteServlet"><button class="btn" type="button"><fmt:message key="Delete"/></button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('DirGenRole')||pageContext.request.isUserInRole('AdminRole')}">
            <a href="JobAprobaServlet"><button class="btn" type="button"><fmt:message key="Aprobare"/></button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('UserRole')}">
            <a href="IndexServlet"><button class="btn" type="button"><fmt:message key="Back"/></button></a>
            </c:if>
            <br><br>
        </form>

    </div>
    <div class="centerj">
        <form>
            <br><br>
            <table>
                <th>IDJob</th>
                <th><fmt:message key="Job name"/></th>
                <th><fmt:message key="Job description"/></th>
                <th><fmt:message key="Remaining posts"/></th>
                <th><fmt:message key="Publisher"/></th>
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
                                <td><fmt:message key="Job inchis"/></td>
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
