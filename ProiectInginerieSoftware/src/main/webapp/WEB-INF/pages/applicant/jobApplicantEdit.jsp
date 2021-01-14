<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="JobApplicant">
    <div class="center">
        <h2><fmt:message key="Job Applicant"/></h2>
        <form action="./JobApplicantServletEdit" method="POST">
          <a href="JobApplicantServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
        </form>
    </div>
    <div class="centerapadd1">
        <form>
            <br>
            <p><strong><fmt:message key="All user applicant:"/></strong></p>
            <table>
                <th><fmt:message key="UserName"/></th>
                <th><fmt:message key="JobName"/></th>
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
    <div class="centerapadd2">
        <form>
            <br>
            <p><strong><fmt:message key="Job list:"/></strong></p>
            <table>
                <th><fmt:message key="UserName"/></th>
                <th><fmt:message key="JobName"/></th>
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