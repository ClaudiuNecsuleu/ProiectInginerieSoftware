
<%@page import="pro.webproject.common.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8
              <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="role.css">
        <title>Users Edit</title>

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

                <h1>Users Edit</h1>

                <form action="./UserEditInputServlet" method="POST">

                    <div class="txt_field">  <input type="hidden" name="useridSelect" value="${userSelect.userid}" required></div>
                    <div class="txt_field">  <input type="text" name="name" placeholder="Nume" value="${userSelect.name}" required></div>
                    <div class="txt_field"> <input type="text" name="prenume" placeholder="Prenume" value="${userSelect.prenume}" required></div>
                    <div class="txt_field"> <input type="text" name="telefon" placeholder="Telefon" value="${userSelect.telefon}" required></div>
                    <div class="txt_field">  <input type="text" name="telefonMobil" placeholder="Telefon mobil" value="${userSelect.telefonMobil}" required></div>
                    <div class="txt_field"> <input type="text" name="mail" placeholder="Mail" value="${userSelect.mail}" required></div>
                    <div class="txt_field"> <input type="text" name="functia" placeholder="Functia" value="${userSelect.functia}" required></div>
                    <div class="txt_field"> <input type="text" name="descriere" placeholder="Descriere" value="${userSelect.descriere}" required></div>
                    <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
                    <a href="UserServlet"><button class="btn3" type="button">Back</button></a>
                </form> 
                <br>
                <table>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Prenume</th>
                    <th>Telefon</th>
                    <th>Telefon Mobil</th>
                    <th>Mail</th>
                    <th>Functie</th>
                    <th>Descriere</th>
                    <th>Username</th>
                        <c:forEach items="${allUsers}" var="user">
                        <tr>

                            <td>${user.userid}</td>
                            <td>${user.name}</td>
                            <td>${user.prenume}</td>
                            <td>${user.telefon}</td>
                            <td>${user.telefonMobil}</td>
                            <td>${user.mail}</td>
                            <td>${user.functia}</td>
                            <td>${user.descriere}</td>
                            <td>${user.username}</td>
                        </tr>   
                    </c:forEach>

                </table>
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
            <div class="comm">

                <h1>Users Edit</h1>

               <form action="./UserEditInputServlet" method="POST">

                    <div class="txt_field">  <input type="hidden" name="useridSelect" value="${userSelect.userid}" required></div>
                    <div class="txt_field">  <input type="text" name="name" placeholder="Nume" value="${userSelect.name}" required></div>
                    <div class="txt_field"> <input type="text" name="prenume" placeholder="Prenume" value="${userSelect.prenume}" required></div>
                    <div class="txt_field"> <input type="text" name="telefon" placeholder="Telefon" value="${userSelect.telefon}" required></div>
                    <div class="txt_field">  <input type="text" name="telefonMobil" placeholder="Telefon mobil" value="${userSelect.telefonMobil}" required></div>
                    <div class="txt_field"> <input type="text" name="mail" placeholder="Mail" value="${userSelect.mail}" required></div>
                    <div class="txt_field"> <input type="text" name="functia" placeholder="Functia" value="${userSelect.functia}" required></div>
                    <div class="txt_field"> <input type="text" name="descriere" placeholder="Descriere" value="${userSelect.descriere}" required></div>
                    <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
                    <a href="UserServlet"><button class="btn3" type="button">Back</button></a>
                </form> 
                <br>
                <table>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Prenume</th>
                    <th>Telefon</th>
                    <th>Telefon Mobil</th>
                    <th>Mail</th>
                    <th>Functie</th>
                    <th>Descriere</th>
                    <th>Username</th>
                        <c:forEach items="${allUsers}" var="user">
                        <tr>

                            <td>${user.userid}</td>
                            <td>${user.name}</td>
                            <td>${user.prenume}</td>
                            <td>${user.telefon}</td>
                            <td>${user.telefonMobil}</td>
                            <td>${user.mail}</td>
                            <td>${user.functia}</td>
                            <td>${user.descriere}</td>
                            <td>${user.username}</td>
                        </tr>   
                    </c:forEach>

                </table>
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
                <h1>Users Edit</h1>
                <form action="./UserEditInputServlet" method="POST">

                    <div class="txt_field">  <input type="hidden" name="useridSelect" value="${userSelect.userid}" required></div>
                    <div class="txt_field">  <input type="text" name="name" placeholder="Nume" value="${userSelect.name}" required></div>
                    <div class="txt_field"> <input type="text" name="prenume" placeholder="Prenume" value="${userSelect.prenume}" required></div>
                    <div class="txt_field"> <input type="text" name="telefon" placeholder="Telefon" value="${userSelect.telefon}" required></div>
                    <div class="txt_field">  <input type="text" name="telefonMobil" placeholder="Telefon mobil" value="${userSelect.telefonMobil}" required></div>
                    <div class="txt_field"> <input type="text" name="mail" placeholder="Mail" value="${userSelect.mail}" required></div>
                    <div class="txt_field"> <input type="text" name="functia" placeholder="Functia" value="${userSelect.functia}" required></div>
                    <div class="txt_field"> <input type="text" name="descriere" placeholder="Descriere" value="${userSelect.descriere}" required></div>
                    <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
                    <a href="UserServlet"><button class="btn3" type="button">Back</button></a>
                </form> 
                <br>
                <table>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Prenume</th>
                    <th>Telefon</th>
                    <th>Telefon Mobil</th>
                    <th>Mail</th>
                    <th>Functie</th>
                    <th>Descriere</th>
                    <th>Username</th>
                        <c:forEach items="${allUsers}" var="user">
                        <tr>

                            <td>${user.userid}</td>
                            <td>${user.name}</td>
                            <td>${user.prenume}</td>
                            <td>${user.telefon}</td>
                            <td>${user.telefonMobil}</td>
                            <td>${user.mail}</td>
                            <td>${user.functia}</td>
                            <td>${user.descriere}</td>
                            <td>${user.username}</td>
                        </tr>   
                    </c:forEach>

                </table>
                <br>
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