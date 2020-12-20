<%-- 
    Document   : jobEditInput
    Created on : Dec 6, 2020, 9:58:49 AM
    Author     : Bogdan
--%>

<%@page import="pro.webproject.common.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="role.css">
        <title>Job Edit Page</title>
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
            <center>
                <img src="acc.png" alt="Girl in a jacket" width="600" height="600">
                <p>ACCES INTERZIS!</p>
            </center>
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
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h2>Job Edit</h2>
                <form action="./JobEditInputServlet" method="POST">
                    <div class="txt_field"> <input type="hidden" name="jobidSelect" value="${jobSelect.jobid}" required></div>
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${jobSelect.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${jobSelect.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${jobSelect.remainingjob}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="publisher" value="${jobSelect.publisher}" readonly required></div>
                    
                    
                    <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
                    <a href="JobsServlet"><button class="btn3" type="button">Back</button></a>


                    <br>
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
                </form>
                <br>
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
                <h2>Job Edit</h2>
                <form action="./JobEditInputServlet" method="POST">
                    <div class="txt_field"> <input type="hidden" name="jobidSelect" value="${jobSelect.jobid}" required></div>
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${jobSelect.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${jobSelect.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${jobSelect.remainingjob}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="publisher" value="${jobSelect.publisher}" readonly required></div>
                    <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
                    <a href="JobsServlet"><button class="btn3" type="button">Back</button></a>


                    <br>
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
                </form>
                <br>
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
                <h2>Job Edit</h2>
                <form action="./JobEditInputServlet" method="POST">
                    <div class="txt_field"> <input type="hidden"  name="jobidSelect" value="${jobSelect.jobid}" required></div>
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${jobSelect.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${jobSelect.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${jobSelect.remainingjob}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="publisher" value="${jobSelect.publisher}" readonly required></div>
                    <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
                    <a href="JobsServlet"><button class="btn3" type="button">Back</button></a>


                    <br>
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
                </form>
                <br>
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
                <h2>Job Edit</h2>
                <form action="./JobEditInputServlet" method="POST">
                    <div class="txt_field"> <input type="hidden"  name="jobidSelect" value="${jobSelect.jobid}" required></div>
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${jobSelect.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${jobSelect.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${jobSelect.remainingjob}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="publisher" value="${jobSelect.publisher}" readonly required></div>
                    <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
                    <a href="JobsServlet"><button class="btn3" type="button">Back</button></a>


                    <br>
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
                </form>
                <br>
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
                <h2>Job Edit</h2>
                <form action="./JobEditInputServlet" method="POST">
                    <div class="txt_field"> <input type="hidden"  name="jobidSelect" value="${jobSelect.jobid}" required></div>
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${jobSelect.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${jobSelect.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${jobSelect.remainingjob}" required></div>
                   <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="publisher" value="${jobSelect.publisher}" readonly required></div>
                    <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
                    <a href="JobsServlet"><button class="btn3" type="button">Back</button></a>


                    <br>
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
                </form>
                <br>
            </div>
        </div>

    </body>
</html>