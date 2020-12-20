
<%@page import="com.ulbs.proiectingineriesoftware.Common.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="role.css">
        <title>JobApplicant</title>

    </head>
    <body class="login" onpageshow="UserRights()">

        <% UserBean currentUser = ((UserBean) (session.getAttribute("currentSessionUser")));%>

        <script>

            function UserRights() {
                var x = document.getElementsByClassName("<%=currentUser.getRoleName()%>");
                x[0].style.display = "block";
            }
        </script>
        <div class="Viewer">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li> <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>JobApplicant</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h1>Job Applicant</h1>
                <form action="./JobApplicantServlet" method="POST">
                    <input type="hidden" name="username" id="ts"  value="<%=currentUser.getUsername()%>" required>
                    <br>
                    <select name="jobname"  required/>
                    <option value="">Chose Job...</option>
                    <c:forEach var="job" items="${jobList}" varStatus="status">
                        <option value="${job.jobname}"> ${job.jobname}</option>
                    </c:forEach>
                    </select>
                    <button type="submit" class="btn3" name="action" value="Add">Aplica</button>  
                    <button type="submit" class="btn3" name="action" value="Def">Elimina aplicarea</button>  
                    <hr>
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
        </div>

        <div class="Admin">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li>  <a href="RoleServlet"><strong>RoleInfo</strong></a></li>
                    <li> <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="UserServlet"><strong>User</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one" >LogOut</a></li>
                </ul>
            </nav>

            <div class="comm">

                <h1>Job Applicant</h1>
                <br>

                <form action="./JobApplicantServlet" method="POST">
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
                    <br><br>
                </form>
            </div>
        </div>

        <div class="DirectorDep">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li> <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>

            <div class="comm">

                <h1>Job Applicant</h1>
                <form action="./JobApplicantServlet" method="POST">
                    <select name="username"  required/>
                    <option value="">Chose Applicant...</option>
                    <c:forEach var="user" items="${userList}" varStatus="status">
                        <c:if test="${user.getJobApplicant() != null}">
                            <option value="${user.username}"> ${user.username}</option>
                        </c:if>
                    </c:forEach>
                    </select>     
                    <button type="submit" class="btn3" name="action" value="Select">Alege</button> 
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
        </div>


        <div class="DirectorGeneral">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li> <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="UserServlet"><strong>User</strong></a></li>
                    <li>  <a href="RoleServlet"><strong>Role</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h1>Job Applicant</h1>
                <form action="./JobApplicantServlet" method="POST">

                    <select name="username" />
                    <option value="">Chose user for Applicant...</option>
                    <c:forEach var="user" items="${userList}" varStatus="status">
                        <c:if test="${user.getJobApplicant() != null}">
                            <option value="${user.username}"> ${user.username}</option>
                        </c:if>
                    </c:forEach>
                    </select>     
                    <button type="submit" class="btn3" name="action" value="Select">Alege</button> 

                    <br>

                    <select name="deleteApp" />
                    <option value="">Chose Applicant for delete...</option>
                    <c:forEach var="user" items="${userList}" varStatus="status">
                        <c:if test="${user.getJobApplicant() != null}">
                            <option value="${user.username}"> ${user.username}</option>
                        </c:if>
                    </c:forEach>
                    </select>     
                    <button type="submit" class="btn3" name="action" value="SelectDelete">Sterge</button> 

                    <br>

                    <select name="deleteJob" />
                    <option value="">Chose user for delete from job...</option>
                    <c:forEach var="user" items="${userList}" varStatus="status">
                        <c:if test="${user.getJob() != null}">
                            <option value="${user.username}"> ${user.username}</option>
                        </c:if>
                    </c:forEach>
                    </select>     
                    <button type="submit" class="btn3" name="action" value="SelectDeleteJob">Sterge</button> 
                </form>
            </div>

            <div class="centerjagen">
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
                    <br><br>
                </form>
            </div>
            <div class="centergen">
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


                    <br><br>
                </form>
            </div>
        </div>

        <div class="DirectorHR">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li> <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
                    <li>  <a href="UserServlet"><strong>User</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h1>Job Applicant</h1>
                <form action="./JobApplicantServlet" method="POST">
                    <select name="username"  required/>
                    <option value="">Chose Applicant...</option>
                    <c:forEach var="user" items="${userList}" varStatus="status">
                        <c:if test="${user.getJobApplicant() != null}">
                            <option value="${user.username}"> ${user.username}</option>
                        </c:if>
                    </c:forEach>
                    </select>     
                    <button type="submit" class="btn3" name="action" value="Select">Alege</button> 
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
        </div>

        <div class="Recruiter">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li> <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h1>Job Applicant</h1>
                <form action="./JobApplicantServlet" method="POST">
                    <select name="username"  required/>
                    <option value="">Chose Applicant...</option>
                    <c:forEach var="user" items="${userList}" varStatus="status">
                        <c:if test="${user.getJobApplicant() != null}">
                            <option value="${user.username}"> ${user.username}</option>
                        </c:if>
                    </c:forEach>
                    </select>     

                    <button type="submit" class="btn3" name="action" value="Select">Alege</button> 
                    <br>
                    <select name="deleteApp"  required/>
                    <option value="">Chose Applicant...</option>
                    <c:forEach var="user" items="${userList}" varStatus="status">
                        <c:if test="${user.getJobApplicant() != null}">
                            <option value="${user.username}"> ${user.username}</option>
                        </c:if>
                    </c:forEach>
                    </select>     
                    <button type="submit" class="btn3" name="action" value="SelectDelete">Sterge</button> 

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
        </div>

    </body>
</html>
