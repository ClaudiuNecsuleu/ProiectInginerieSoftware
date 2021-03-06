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
                <div class="txt_field"> <input type="hidden" name="jobidSelect" value="${jobSelect.jobid}"></div>
                <div class="txt_field"> <input type="text" placeholder="<fmt:message key="Nume"/>" name="jobname" value="${jobSelect.jobname}" required></div>
                <div class="txt_field"><input type="text" placeholder="<fmt:message key="Descriere"/>" name="description" value="${jobSelect.description}" required></div>
                <div class="txt_field">  <input type="text" placeholder="<fmt:message key="Remaining.posts"/>" name="remainingjob" value="${jobSelect.remainingjob}" required></div>
                <div class="txt_field">  <input type="text" placeholder="<fmt:message key="Publisher"/>" name="publisher" value="${jobSelect.publisher}" readonly required></div>

                <c:if test="${message != null}">
                    <div class="alert alert-warning" role="alert">
                        <fmt:message key="${message}"/>
                    </div>   
                </c:if>
                <button type="submit" class="btn3" name="action" value="Edit"><fmt:message key="Edit"/></button>
                <a href="JobsServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
                <br><br>
            </form>
        </div>
        <br>
        <div class="centerjeinput">
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
                            <d:if test="${job.getStatus()!=null}">
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
                            </d:if>
                        </tr>   
                    </c:forEach>
                </table>
                <br><br>
            </form>

        </div>
    </jsp:body>
</t:pageTemplate>