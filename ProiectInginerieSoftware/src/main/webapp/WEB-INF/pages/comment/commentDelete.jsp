<%-- 
    Document   : commentsDelete
    Created on : Oct 26, 2020, 4:59:44 PM
    Author     : oleof
--%>



<%@page import="pro.webproject.common.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="role.css">
        <title>Comments Delete Page</title>
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
                    <li>  <a href="ProfileServlet"><strong>Profile</strong></a></li>
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
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one" >LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h2>Comments Delete</h2>
                <form action="./CommentDeleteServlet" method="POST">
                    <label><strong>Delete comment:</strong></label>
                    <select  name="commentid" id="commentid"  required>
                        <option value="">comment</option>
                        <c:forEach var="comment" items="${allComments}" varStatus="status">
                            <option value="${comment.commentid}">  ${comment.comment}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <button type="submit" class="btn3" name="action" value="Delete" >Delete</button>
                    <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
                    <br>
                </form>
            </div>
        </div>
        <div class="DirectorHR ">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li>  <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
                    <li>  <a href="UserServlet"><strong>User</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h2>Comments Delete</h2>

                <form action="./CommentDeleteServlet" method="POST">
                    <label><strong>Delete comment:</strong></label>
                    <select  name="commentid" id="commentid"  required>
                        <option value="">comment</option>
                        <c:forEach var="comment" items="${allComments}" varStatus="status">
                            <option value="${comment.commentid}">  ${comment.comment}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <button type="submit" class="btn3" name="action" value="Delete" >Delete</button>
                    <a href="CommentServlet"> <button class="btn3" type="button">Back</button></a>
                    <br>
                </form>
            </div>
        </div>
        <div class="DirectorGeneral">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li>  <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="UserServlet"><strong>User</strong></a></li>
                    <li>  <a href="RoleServlet"><strong>Role</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h2>Comments Delete</h2>
                <form action="./CommentDeleteServlet" method="POST">
                    <label><strong>Delete comment:</strong></label>
                    <select  name="commentid" id="commentid"  required>
                        <option value="">comment</option>
                        <c:forEach var="comment" items="${allComments}" varStatus="status">
                            <option value="${comment.commentid}">  ${comment.comment}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <button type="submit" class="btn3" name="action" value="Delete" >Delete</button>
                    <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
                    <br>
                </form>
            </div>
        </div>
        <div class="DirectorDep">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li>  <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h2>Comments Delete</h2>
                <form action="./CommentDeleteServlet" method="POST">
                    <label><strong>Delete comment:</strong></label>
                    <select  name="commentid" id="commentid"  required>
                        <option value="">comment</option>
                        <c:forEach var="comment" items="${allComments}" varStatus="status">
                            <option value="${comment.commentid}">  ${comment.comment}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <button type="submit" class="btn3" name="action" value="Delete" >Delete</button>
                    <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
                    <br>
                </form>
            </div>
        </div>
        <div class="Recruiter">
            <nav>
                <ul>
                    <li>  <a href="userLogged.jsp"><strong>Home</strong></a></li>
                    <li>  <a href="ProfileServlet"><strong>Profile</strong></a></li>
                    <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
                    <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
                    <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
                    <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
                </ul>
            </nav>
            <div class="comm">
                <h2>Comments Delete</h2>
                <form action="./CommentDeleteServlet" method="POST">
                    <label><strong>Delete comment:</strong></label>
                    <select  name="commentid" id="commentid"  required>
                        <option value="">comment</option>
                        <c:forEach var="comment" items="${allComments}" varStatus="status">
                            <option value="${comment.commentid}">  ${comment.comment}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <button type="submit" class="btn3" name="action" value="Delete" >Delete</button>
                    <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
                    <br>
                </form>
            </div>
        </div>
    </body>
</html>
