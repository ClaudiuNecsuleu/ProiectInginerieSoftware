
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="ABC.DLL">

    <h1>Welcome to the ABC.DLL</h1>

    <div class="center">  
        <h2>NEWS</h2>
        <form>
        <table>
            <th>Job name</th>
            <th>Job description</th>
            <th>Remaining posts</th>
                <c:forEach items="${allJobs}" var="job">
                    <d:if test="${job.getStatus()!=null}">
                    <tr>
                        <td>${job.jobname}</td>
                        <td>${job.description}</td>
                        <c:if test="${job.getRemainingjob()!=0}">

                            <td>${job.remainingjob}</td>

                        </c:if>
                        <c:if test="${job.getRemainingjob()==0}">
                            <td>Job inchis</td>
                        </c:if>
                    </tr>   
                </d:if>
            </c:forEach>
        </table>
            <br><br>
        </form>
    </div>

</t:pageTemplate>
