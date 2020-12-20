<%-- 
    Document   : userFind
    Created on : Nov 13, 2020, 10:59:41 AM
    Author     : oleof
--%>

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
        <title>Users Find</title>
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
                <h1>Users Information</h1>
                <form action="./UserFindServlet" method="POST">
                    <div class="txt_field"> <input type="text" id="usernameInput" onkeypress="return noenter()" placeholder="Cauta dupa nume si prenume..." required></div>
                    <a href="UserServlet"><button class="btn3" type="button">Back</button></a>
                     <br><br>
                </form>
               </div>
         
            
                <div class="centeruf">
                <br>
                <form>
                <table id="userTable">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Prenume</th>
                        <th>Telefon</th>
                        <th>Telefon Mobil</th>
                        <th>Mail</th>
                        <th>Functie</th>
                        <th>Descriere</th>
                        <th>Username</th>
                    </tr>
                    <tbody id="myTable">
                        <c:forEach items="${allUsers}" var="users">
                            <tr>

                                <td>${users.userid}</td>
                                <td>${users.name}</td>
                                <td>${users.prenume}</td>
                                <td>${users.telefon}</td>
                                <td>${users.telefonMobil}</td>
                                <td>${users.mail}</td>
                                <td>${users.functia}</td>
                                <td>${users.descriere}</td>
                                <td>${users.username}</td>
                            </tr>   
                        </c:forEach>
                    </tbody>
                </table>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script>
                        $(document).ready(function () {
                            $("#usernameInput").on("keyup", function () {
                                var value = $(this).val().toLowerCase();
                                $("#myTable tr").filter(function () {
                                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                });
                            });
                        });
                </script>
                <script type="text/javascript">
                    function noenter() {
                        return !(window.event && window.event.keyCode == 13);
                    }
                </script>

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
                <h1>Users Information</h1>
                <form action="./UserFindServlet" method="POST">
                    <div class="txt_field"> <input type="text" id="usernameInput2" onkeypress="return noenter()" placeholder="Cauta dupa nume si prenume..." required></div>
                    <a href="UserServlet"><button class="btn3" type="button">Back</button></a>
                    <br><br>
                </form>
                   </div>
                <div class="center1">
                <br>
                <form>
                <table id="userTable">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Prenume</th>
                        <th>Telefon</th>
                        <th>Telefon Mobil</th>
                        <th>Mail</th>
                        <th>Functie</th>
                        <th>Descriere</th>
                        <th>Username</th>
                    </tr>
                    <tbody id="myTable2">
                        <c:forEach items="${allUsers}" var="users">
                            <tr>

                                <td>${users.userid}</td>
                                <td>${users.name}</td>
                                <td>${users.prenume}</td>
                                <td>${users.telefon}</td>
                                <td>${users.telefonMobil}</td>
                                <td>${users.mail}</td>
                                <td>${users.functia}</td>
                                <td>${users.descriere}</td>
                                <td>${users.username}</td>
                            </tr>   
                        </c:forEach>
                    </tbody>
                </table>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script>
                        $(document).ready(function () {
                            $("#usernameInput2").on("keyup", function () {
                                var value = $(this).val().toLowerCase();
                                $("#myTable2 tr").filter(function () {
                                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                });
                            });
                        });
                </script>
                <script type="text/javascript">
                    function noenter() {
                        return !(window.event && window.event.keyCode == 13);
                    }
                </script>

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
                <h1>Users Information</h1>
                <form action="./UserFindServlet" method="POST">
                    <div class="txt_field"> <input type="text" id="usernameInput3" onkeypress="return noenter()" placeholder="Cauta dupa nume si prenume..." required></div>
                    <a href="UserServlet"><button class="btn3" type="button">Back</button></a>
                    <br><br>
                </form>
                   </div>
                <div class="center1">
                <br>
                <form>
                <table id="userTable">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Prenume</th>
                        <th>Telefon</th>
                        <th>Telefon Mobil</th>
                        <th>Mail</th>
                        <th>Functie</th>
                        <th>Descriere</th>
                        <th>Username</th>
                    </tr>
                    <tbody id="myTable3">
                        <c:forEach items="${allUsers}" var="users">
                            <tr>

                                <td>${users.userid}</td>
                                <td>${users.name}</td>
                                <td>${users.prenume}</td>
                                <td>${users.telefon}</td>
                                <td>${users.telefonMobil}</td>
                                <td>${users.mail}</td>
                                <td>${users.functia}</td>
                                <td>${users.descriere}</td>
                                <td>${users.username}</td>
                            </tr>   
                        </c:forEach>
                    </tbody>
                </table>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script>
                        $(document).ready(function () {
                            $("#usernameInput3").on("keyup", function () {
                                var value = $(this).val().toLowerCase();
                                $("#myTable3 tr").filter(function () {
                                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                });
                            });
                        });
                </script>
                <script type="text/javascript">
                    function noenter() {
                        return !(window.event && window.event.keyCode == 13);
                    }
                </script>

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
            <center>
                <img src="acc.png" alt="Girl in a jacket" width="600" height="600">
                <p>ACCES INTERZIS!</p>
            </center>
        </div>


    </body>
</html>