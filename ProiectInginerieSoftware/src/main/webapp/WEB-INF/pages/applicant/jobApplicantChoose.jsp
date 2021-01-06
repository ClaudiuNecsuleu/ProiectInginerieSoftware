<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobApplicant">
    <jsp:body>
        <div class="center">

            <h2>Job Applicant</h2>
            <form action="./JobApplicantServletChoose" method="POST">

                <c:forEach var="user" items="${userList}" varStatus="status">
                    <c:if test="${user.getJobApplicant() != null}">
                        <d:if test="${user.getRecomandare() == null}">
                            <label>User:  ${user.username}</label>  
                            <input type="hidden" name="recruiterName" value="${name}" />
                            <c:if test="${message != null}">
                                <div class="alert alert-warning" role="alert">
                                    ${message}
                                </div>   
                            </c:if>
                            <button type="submit" class="btn3" name="username" value="${user.username}">Recomanda</button> 
                            <a href="${pageContext.request.contextPath}/File?id=${user.getUsername()}"> <button>ViewCV</button>  </a>
                            <br>         
                        </d:if>
                    </c:if>
                </c:forEach>

                 <a href="JobApplicantServlet"><button class="btn3" type="button">Back</button></a>

                <br><br>
            </form>
        </div>
        <div class="centerapach1">
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


        <div class="centerapach2">
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