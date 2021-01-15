
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />
 
<t:pageTemplate pageTitle="ABC.DLL">
    <form method="POST" action="./ChangeLanguage">
             <select id="language" name="language" onchange="submit()">
                 <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
                 <option value="ro" ${language == 'ro' ? 'selected' : ''}>Romana</option>
                 <option value="de" ${language == 'de' ? 'selected' : ''}>Deutsch</option>
                 <option value="fr" ${language == 'fr' ? 'selected' : ''}>Français</option>
                 <option value="es" ${language == 'es' ? 'selected' : ''}>Español</option>
             </select>
         </form>
    <h1><fmt:message key="Welcome.msg"/></h1>

    <div class="center">  
        <h2><fmt:message key="News"/></h2>
        <form>
        <table>
            <th><fmt:message key="Job.name"/></th>
            <th><fmt:message key="Job.description"/></th>
            <th><fmt:message key="Remaining.posts"/></th>
                <c:forEach items="${allJobs}" var="job">
                    <d:if test="${job.getStatus()!=null}">
                    <tr>
                        <td>${job.jobname}</td>
                        <td>${job.description}</td>
                        <c:if test="${job.getRemainingjob()!=0}">

                            <td>${job.remainingjob}</td>

                        </c:if>
                        <c:if test="${job.getRemainingjob()==0}">
                            <td><fmt:message key="Job.inchis"/></td>
                        </c:if>
                    </tr>   
                </d:if>
            </c:forEach>
        </table>
            <br><br>
        </form>
    </div>

</t:pageTemplate>
