<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobApplicant">
    <jsp:body>
        <div class="comm">

            <h1>Job Applicant</h1>
            <form action="./JobApplicantServletChoose" method="POST">
                <select name="username"  required/>
                <option value="">Chose Applicant...</option>
                <c:forEach var="user" items="${userList}" varStatus="status">
                    <c:if test="${user.getJobApplicant() != null}">
                         <d:if test="${user.getRecomandare() == null}">
                        <option value="${user.username}"> ${user.username}</option>
                         </d:if>
                    </c:if>
                </c:forEach>
                </select>     
                <input type="hidden" name="recruiterName" value="${name}" />
                <button type="submit" class="btn3" name="action" value="Recomanda">Recomanda</button> 
                <br><br>
            </form>
        </div>
        <div class="centerhr1">
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
                <br>
            </form>
        </div>


        <div class="centerhr">
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

                <br>
            </form>
        </div>
    </jsp:body>
</t:pageTemplate>