<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="JobEdit">
    <jsp:body>
        <div class="center">    
            <h2><fmt:message key="Job.Edit"/></h2>
            <form action="./JobEditInputServlet" method="POST">
                <label><strong><fmt:message key="Select.job.edit"/></strong></label>
                <select name="jobid" required>
                    <option value=""><fmt:message key="Jobname"/></option>
                    <c:forEach var="job" items="${allJobs}" varStatus="status">
                        <option value="${job.jobid}"> ${job.jobname}</option>
                    </c:forEach>
                </select>
                <br>
                <c:if test="${message != null}">
                    <div class="alert alert-warning" role="alert">
                        <fmt:message key="${message}"/>
                    </div>   
                </c:if>
                <button type="submit" class="btn3" value="Edit"><fmt:message key="Edit"/></button>
                <a href="JobsServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>

            </form>
            <br>
        </div>


        <div class="centerjed">
            <form>
                <br><br>
                <table>
                    <th>IDJob</th>
                    <th><fmt:message key="Jobname"/></th>
                    <th><fmt:message key="Job.description"/></th>
                    <th><fmt:message key="Remaining.posts"/></th>
                    <th><fmt:message key="Publisher"/></th>
                        <c:forEach items="${allJobs}" var="job">
                        <tr>
                            <td>${job.jobid}</td>
                            <td>${job.jobname}</td>
                            <td>${job.description}</td>
                            <c:if test="${job.getRemainingjob()!=0}">
                                <td>${job.remainingjob}</td>
                            </c:if>
                            <c:if test="${job.getRemainingjob()==0}">
                                <td><fmt:message key="Job.inchis"/></td>
                            </c:if>
                            <td>${job.publisher}</td>
                        </tr>   
                    </c:forEach>
                </table>
                <br>
                <br>

            </form>
        </div>
    </jsp:body>
</t:pageTemplate>