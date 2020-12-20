<%@page import="com.ulbs.proiectingineriesoftware.Models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.ulbs.proiectingineriesoftware.Common.UserBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="role.css">
        <title>Profile Page</title>
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
                    <li>  <a href="userLogout.jsp"  class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
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
                    <li>  <a href="userLogout.jsp"  class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
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
                    <li>  <a href="userLogout.jsp"  class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
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
        </div>
        <h1>Salut, <%=currentUser.getUsername()%>!</h1>
        <div class="centerprof">
        <form>
            <br><br>
        <table>
            <tr>
                <td><strong>Nume:</strong></td>
                <td>${user.getName()}</td>
            </tr>
            <tr>
                <td><strong>Prenume:</strong></td>
                <td>${user.getPrenume()}</td>
            </tr>
            <tr>
                <td><strong>Telefon:</strong></td>
                <td>${user.getTelefon()}</td>
            </tr>
            <tr>
                <td><strong>Telefon mobil:</strong></td>
                <td>${user.getTelefonMobil()}</td>
            </tr>
            <tr>
                <td><strong>Mail:</strong></td>
                <td>${user.getMail()}</td>
            </tr>
            <tr>
                <td><strong>Rol:</strong></td>
                <td>${user.getRole().getRolename()}</td>
            </tr>
            <tr>
                <td><strong>Job:</strong> </td>
                <td>${user.getJob().getJobname()}</td>
            </tr>
            <tr>
                <td><strong>Job pentru care ai aplicat: </strong></td>
                <td>${user.getJobApplicant().getJobname()}</td>
            </tr>
            <tr>
                <td><strong>Photo </strong></td>
                <td>  <img src="${pageContext.request.contextPath}/Photo?id=${user.getUserid()}" width="48"/></td>
            </tr>

        </table>
            <br><br>
        </form>
        </div>
            <br><br>
            <div class="centerprofc2">
            <form>
            <p><strong> Comentariile pentru tine:</strong></p>
        <table >
            <th>
                Comentariu
            </th>
            <th>
                Data
            </th>
            <th>
                Ora
            </th>
            <th>
                Autor
            </th>

            <c:forEach items="${user.getCommentsList()}" var="comment">
                <tr>
                    <td>${comment.comment}</td>
                    <td>${comment.date}</td>
                    <td>${comment.time}</td>
                    <td>${comment.publisherUsername}</td>
                </tr> 
            </c:forEach>
        </table>
            <br><br>
            </form>
            </div>
        
            <br><br>
            <div class="centerprofc">
            <form>
            <p><strong> Comentariile tale:</strong></p>
        <table >
            <th>
                Comentariu
            </th>
            <th>
                Data
            </th>
            <th>
                Ora
            </th>

            <c:forEach items="${getCommentsByUsername}" var="comment">
                <tr>
                    <td>${comment.comment}</td>
                    <td>${comment.date}</td>
                    <td>${comment.time}</td>
                </tr> 
            </c:forEach>
        </table>
                        <br><br>
            </form>
            </div>
        
        

        <!--        <form action="userEdit.jsp  ">
                    <input type="hidden" name="userId" value="${user.getUserid()}"/>
                    
                </form>-->
    </body>
</html>