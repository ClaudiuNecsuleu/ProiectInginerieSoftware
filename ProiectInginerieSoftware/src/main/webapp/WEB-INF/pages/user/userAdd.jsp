
<%@page import="pro.webproject.common.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="role.css">
        <title>Users Add</title>
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
                <h2>Users Add</h2>
                <form action="./UserAddServlet" method="POST">
                    <div class="txt_field">  <input type="text" name="name" placeholder="Nume" value="${user.name}" required></div>
                    <div class="txt_field"> <input type="text" name="prenume" placeholder="Prenume" value="${user.prenume}" required></div>
                    <div class="txt_field"> <input type="text" name="telefon" placeholder="Telefon" value="${user.telefon}" required></div>
                    <div class="txt_field">  <input type="text" name="telefonMobil" placeholder="TelefonMobil" value="${user.telefonMobil}" required></div>
                    <div class="txt_field"> <input type="text" name="mail" placeholder="Mail" value="${user.mail}" required></div>
                    <div class="txt_field"> <input type="text" name="descriere" placeholder="Descriere" value="${user.descriere}" required></div>
                        <%
                            String status = (String) request.getAttribute("status");
                            if (status == "ok") {
                                out.print("Adaugat cu succes!");
                            }
                        %>
                    <button type="submit" name="action" value="Add">Add</button>
                    <a href="UserServlet"><button type="button">Back</button></a>
                    <br> <br>
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
            <center>
                <img src="acc.png" alt="Girl in a jacket" width="600" height="600">
                <p>ACCES INTERZIS!</p>
            </center>
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
            <center>
                <img src="acc.png" alt="Girl in a jacket" width="600" height="600">
                <p>ACCES INTERZIS!</p>
            </center>
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
                <h1>Users Add</h1>
                <form action="./UserAddServlet" method="POST">
                    <div class="txt_field">  <input type="text" name="name" placeholder="Nume" value="${user.name}" required></div>
                    <div class="txt_field"> <input type="text" name="prenume" placeholder="Prenume" value="${user.prenume}" required></div>
                    <div class="txt_field"> <input type="text" name="telefon" placeholder="Telefon" value="${user.telefon}" required></div>
                    <div class="txt_field">  <input type="text" name="telefonMobil" placeholder="TelefonMobil" value="${user.telefonMobil}" required></div>
                    <div class="txt_field"> <input type="text" name="mail" placeholder="Mail" value="${user.mail}" required></div>
                    <div class="txt_field"> <input type="text" name="descriere" placeholder="Descriere" value="${user.descriere}" required></div>
                        <%
                            status = (String) request.getAttribute("status");
                            if (status == "ok") {
                                out.print("Adaugat cu succes!");
                            }
                        %>
                    <button type="submit" name="action" value="Add">Add</button>
                    <a href="UserServlet"><button type="button">Back</button></a>
                     <br> <br>
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
            <center>
                <img src="acc.png" alt="Girl in a jacket" width="600" height="600">
                <p>ACCES INTERZIS!</p>
            </center>
        </div>
    </body>
</html>