<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="JobApplicant">
    <div class="center">
        <h2><fmt:message key="Job.Applicant"/></h2>
        <form action="./JobApplicantServletDelete" method="POST">

            <select name="deleteApp" />
            <option value=""><fmt:message key="Chose.Applicant.delete"/></option>
            <c:forEach var="user" items="${userList}" varStatus="status">
                <c:if test="${user.getJobApplicant() != null}">
                    <option value="${user.username}"> ${user.username}</option>
                </c:if>
            </c:forEach>
            </select>     
            <button type="submit" class="btn3" name="action" value="SelectDelete"><fmt:message key="Delete"/></button> 
            <br>
            <select name="deleteJob" />
            <option value=""><fmt:message key="Chose.user.delete.job"/></option>
            <c:forEach var="user" items="${userList}" varStatus="status">
                <c:if test="${user.getJob() != null}">
                    <option value="${user.username}"> ${user.username}</option>
                </c:if>
            </c:forEach>
            </select>     
            <button type="submit" class="btn3" name="action" value="SelectDeleteJob"><fmt:message key="Delete"/></button> 
        <a href="JobApplicantServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>

        </form>
        <c:if test="${message != null}">
            <div class="alert alert-warning" role="alert">
                ${message}
            </div>   
        </c:if>
    </div>
    <div class="centerapadd1">
        <form>
            <br>
            <p><strong><fmt:message key="All.user.applicant"/></strong></p>
            <table>
                <th><fmt:message key="Username"/></th>
                <th><fmt:message key="Jobname"/></th>
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
            <p><strong><fmt:message key="Job.List"/></strong></p>
            <table>
                <th><fmt:message key="Username"/></th>
                <th><fmt:message key="Jobname"/></th>
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