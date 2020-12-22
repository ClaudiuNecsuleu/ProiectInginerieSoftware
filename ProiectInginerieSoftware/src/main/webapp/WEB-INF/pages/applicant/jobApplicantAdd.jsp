<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="JobApplicant">

    <div class="center">

        <h2>Job Applicant</h2>
        <form action="./JobApplicantServletAdd" method="POST">
            <select name="username"  required/>
            <option value="">Chose Applicant...</option>
            <c:forEach var="user" items="${userList}" varStatus="status">
                <c:if test="${user.getJobApplicant() != null}">
                    <d:if test="${user.getRecomandare() != null}">
                    <option value="${user.username}"> ${user.username}</option>
                      </d:if>
                </c:if>
            </c:forEach>
            </select>     
            <button type="submit" class="btn3" name="action" value="Select">Alege</button> 
            <br><br>
        </form>
    </div>
    <div class="centerapadd1">
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


    <div class="centerapadd2">
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
</t:pageTemplate>