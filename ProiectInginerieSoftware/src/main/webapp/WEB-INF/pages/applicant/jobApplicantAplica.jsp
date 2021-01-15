<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobApplicant">
    <jsp:body>
        <div class="center">
            <h2><fmt:message key="Job.Applicant"/></h2>
            <form action="./JobApplicantServletAplica" method="POST">
                <input type="hidden" name="username" id="ts"  value="${name}">
                <br>
                <select name="jobname"/>
                <option value=""><fmt:message key="Choose.job"/></option>
                <c:forEach var="job" items="${jobList}" varStatus="status">
                    <d:if test="${job.getStatus()!=null}">
                        <option value="${job.jobname}"> ${job.jobname}</option>
                    </d:if>
                </c:forEach>
                </select>
                <c:if test="${message != null}">
                    <div class="alert alert-warning" role="alert">
                        <fmt:message key="${message}"/>
                    </div>   
                </c:if>
                <button type="submit" class="btn3" name="action" value="Add"><fmt:message key="Aplica"/></button>  
                <button type="submit" class="btn3" name="action" value="Def"><fmt:message key="Elimina.aplicarea"/></button>  
                
           <a href="JobApplicantServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
              <br>
            </form>
        </div>
        <div class="centeraplica">
            <form>
                <p><fmt:message key="All.user.applicant"/></p>
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
    </jsp:body>
</t:pageTemplate>