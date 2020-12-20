

<%@page import="pro.webproject.common.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="role.css">
        <title>Job Add Page</title>
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

                <h2>Job Add</h2>
                <form action="./JobsServlet" method="POST">
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${job.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${job.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${job.remainingjob}" required></div>
                    <input type="hidden" placeholder="Publisher" name="publisher" value="<%=currentUser.getUsername()%>" required>
                    <button type="submit" name="action" value="Add">Add</button>
                    <a href="JobsServlet"><button type="button">Back</button></a>
                    <br>


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

                <h2>Job Add</h2>
                <form action="./JobsServlet" method="POST">
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${job.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${job.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${job.remainingjob}" required></div>
                    <input type="hidden" placeholder="Publisher" name="publisher" value="<%=currentUser.getUsername()%>" required>
                    <button type="submit" name="action" value="Add">Add</button>
                    <a href="JobsServlet"><button type="button">Back</button></a>

                    <br>
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

                <h2>Job Add</h2>
                <form action="./JobsServlet" method="POST">
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${job.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${job.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${job.remainingjob}" required></div>
                    <input type="hidden" placeholder="Publisher" name="publisher" value="<%=currentUser.getUsername()%>" required>
                    <button type="submit" name="action" value="Add">Add</button>
                    <a href="JobsServlet"><button type="button">Back</button></a>
                    <br>

                </form>
            </div>
        </div>
        <div class="DirectorGeneral">   
            <nav>
                <ul>
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

                <h2>Job Add</h2>
                <form action="./JobsServlet" method="POST">
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${job.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${job.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${job.remainingjob}" required></div>
                    <input type="hidden" placeholder="Publisher" name="publisher" value="<%=currentUser.getUsername()%>" required>
                    <button type="submit" name="action" value="Add">Add</button>
                    <a href="JobsServlet"><button type="button">Back</button></a>
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

                <h2>Job Add</h2>
                <form action="./JobsServlet" method="POST">
                    <div class="txt_field"> <input type="text" placeholder="Name" name="jobname" value="${job.jobname}" required></div>
                    <div class="txt_field"><input type="text" placeholder="Description" name="description" value="${job.description}" required></div>
                    <div class="txt_field">  <input type="text" placeholder="RemainingPosts" name="remainingjob" value="${job.remainingjob}" required></div>
                    <input type="hidden" placeholder="Publisher" name="publisher" value="<%=currentUser.getUsername()%>" required>
                    <button type="submit" name="action" value="Add">Add</button>
                    <a href="JobsServlet"><button type="button">Back</button></a>
                    <br>
                </form>
            </div>
        </div>


    </body>
</html>
