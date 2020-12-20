
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="JobInfo">
            <div class="comm">

                <form>
                <h2>Job Info</h2>
                <a href="jobAdd.jsp"><button class="btn2" type="button">Add</button></a>
                <a href="JobEditServlet"><button class="btn2" type="button">Edit</button></a>
                <a href="JobDeleteServlet"><button class="btn2" type="button">Delete</button></a>
                <a href="userLogged.jsp"><button class="btn2" type="button">Back</button></a>
                <br>
                </form>
            </div>
            <div class="centerj">
                <form>
                    <br><br>
                    <table>
                        <th>IDJob</th>
                        <th>Job name</th>
                        <th>Job description</th>
                        <th>Remaining posts</th>
                        <th>Publisher</th>

                        <c:forEach items="${allJobs}" var="job">
                            <tr>
                                <td>${job.jobid}</td>
                                <td>${job.jobname}</td>
                                <td>${job.description}</td>
                                <c:if test="${job.getRemainingjob()!=0}">
                                    <td>${job.remainingjob}</td>
                                </c:if>
                                <c:if test="${job.getRemainingjob()==0}">
                                    <td>Job inchis</td>
                                </c:if>
                                <td>${job.publisher}</td>
                            </tr>   
                        </c:forEach>
                    </table>
                    <br><br>
                </form>
            </div>
</t:pageTemplate>
