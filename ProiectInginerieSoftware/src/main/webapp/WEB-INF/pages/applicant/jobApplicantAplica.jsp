<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobApplicant">
    <jsp:body>
        <div class="center">
            <h2>Job Applicant</h2>
            <form action="./JobApplicantServletAplica" method="POST">
                <input type="hidden" name="username" id="ts"  value="${name}">
                <br>
                <select name="jobname"  required/>
                <option value="">Chose Job...</option>
                <c:forEach var="job" items="${jobList}" varStatus="status">
                     <d:if test="${job.getStatus()!=null}">
                    <option value="${job.jobname}"> ${job.jobname}</option>
                     </d:if>
                </c:forEach>
                </select>
                <button type="submit" class="btn3" name="action" value="Add">Aplica</button>  
                <button type="submit" class="btn3" name="action" value="Def">Elimina aplicarea</button>  
                <br>
            </form>
        </div>
                <div class="centeraplica">
                    <form>
                <p>All user applicant:</p>
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
    </jsp:body>
</t:pageTemplate>