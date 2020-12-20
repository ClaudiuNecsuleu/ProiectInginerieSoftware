<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="JobApplicant">
    <div class="comm">
        <h1>Job Applicant</h1>
        <form action="./JobApplicantServletEdit" method="POST">
       
        </form>
    </div>
    <div class="centerjagen">
        <form>
            <br>
            <p><strong>All user applicant:</strong></p>
            <table>
                <th>UserName</th>
                <th>JobName</th>
                    <d:forEach items="${userList}" var="user">
                        <d:if test="${user.getJobApplicant() !=null}">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.getJobApplicant().jobname}</td>
                        </tr>
                    </d:if>
                </d:forEach>
            </table>
            <br><br>
        </form>
    </div>
    <div class="centergen">
        <form>
            <br>
            <p><strong>Job list:</strong></p>
            <table>
                <th>UserName</th>
                <th>JobName</th>
                    <d:forEach items="${jobList}" var="job">
                        <c:forEach items="${job.getUsersList()}" var="user">
                            <c:if test="${user.getJob()!=null}">
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.getJob().jobname}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </d:forEach>
            </table>
            <br><br>
        </form>
    </div>
</t:pageTemplate>