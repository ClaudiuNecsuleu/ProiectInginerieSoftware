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
        <form action="./JobApplicantServletAdd" method="POST">
            <select name="username"  required/>
            <option value=""><fmt:message key="Chose.Applicant"/></option>
            <c:forEach var="user" items="${userList}" varStatus="status">
                <c:if test="${user.getJobApplicant() != null}">
                    <d:if test="${user.getRecomandare() != null}">
                    <option value="${user.username}"> ${user.username} ,<fmt:message key="recomandat"/> ${user.getRecomandare()}</option>
                      </d:if>
                </c:if>
            </c:forEach>
            </select>     
             <c:if test="${message != null}">
                <div class="alert alert-warning" role="alert">
                    <fmt:message key="${message}"/>
                </div>   
            </c:if>
            <button type="submit" class="btn3" name="action" value="Select"><fmt:message key="Alege"/></button> 
           
         <a href="JobApplicantServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
          <br><br>
        </form>
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
            <br>
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

            <br>
        </form>
    </div>
</t:pageTemplate>