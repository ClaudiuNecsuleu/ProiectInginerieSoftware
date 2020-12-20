<%@page import="com.ulbs.proiectingineriesoftware.Common.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="role.css">
        <title>Job Page</title>
    </head>
    <body class="home" onpageshow="UserRights()">

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
                <h2>Job Info</h2>
                <a href="jobAdd.jsp"><button class="btn2" type="button">Add</button></a>
                <a href="JobEditServlet"><button class="btn2" type="button">Edit</button></a>
                <a href="JobDeleteServlet"><button class="btn2" type="button">Delete</button></a>
                <a href="userLogged.jsp"><button class="btn2" type="button">Back</button></a>
                <form>
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
                <br>
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
                <form>
                <h2>Job Info</h2>
                <a href="jobAdd.jsp"><button class="btn2" type="button">Add</button></a>
                <a href="JobEditServlet"><button class="btn2" type="button">Edit</button></a>              
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
                <form>

                <h2>Job Info</h2>
                <a href="jobAdd.jsp"><button class="btn2" type="button">Add</button></a>
                <a href="JobEditServlet"><button class="btn2" type="button">Edit</button></a>
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
                <form>

                <h2>Job Info</h2>
                <a href="jobAdd.jsp"><button class="btn2" type="button">Add</button></a>
                <a href="JobEditServlet"><button class="btn2" type="button">Edit</button></a>
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
        </div>

    </body>
</html>
