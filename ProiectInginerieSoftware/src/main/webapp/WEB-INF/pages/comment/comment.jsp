

<%@page import="com.ulbs.proiectingineriesoftware.Common.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="role.css">
        <title>Comments Page</title>
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
                <h2>Comments</h2>
                <form action="./CommentServlet" method="POST">
                    <center><a href="CommentJobServlet"><button class="btn3" type="button">AddToJob</button></a></center>
                    <br>
                </form>
            </div>
            <div class="centerc3">
                <br>
                <form>

                    <p><strong>Comment for job</strong></p>  
                    <table>
                        <tr>
                            <th>Jobname</th>
                            <th>Comment list</th>
                        </tr>
                        <d:forEach items="${allJobs}" var="job">
                            <tr>
                                <td>${job.jobname}</td>
                                <td>
                                    <table>
                                        <tr>
                                            <th>Comment</th>
                                            <th>Date</th>
                                            <th>Time</th>
                                        </tr>
                                        <c:forEach items="${allComments}" var="comment">
                                            <c:if test="${comment.job.getJobname()!=null}">
                                                <tr>
                                                    <td>${comment.comment}</td>
                                                    <td>${comment.date}</td>
                                                    <td>${comment.time}</td>
                                                </tr>   
                                            </c:if>
                                        </c:forEach>
                                    </table>
                                </td>
                            </tr>
                        </d:forEach>                             
                    </table>   
                    <br><br>
                    </form>
            </div>

        
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
        <h2>Comments</h2>
        <form action="./CommentServlet" method="POST">
            <a href="CommentAddServlet"><button class="btn3" type="button">AddToUser</button></a>
            <a href="CommentJobServlet"><button class="btn3" type="button">AddToJob</button></a>
            <a href="CommentEditServlet"><button class="btn3" type="button">Edit</button></a>
            <a href="CommentDeleteServlet"><button class="btn3" type="button">Delete</button></a>
            <a href="userLogged.jsp"><button class="btn3" type="button">Back</button></a>
            <br><br>
        </form>
    </div>
    <div class="centerc1">
        <br>
        <form>
            <p ><strong>Comment for user</strong></p>
            <table> 
                <tr>
                    <th>Username</th>
                    <th>CommentList</th>
                </tr>
                <d:forEach items="${allUsers}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <div id="${user.username}">  
                                <table> 
                                    <tr>
                                        <th>Comment</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                    </tr>

                                    <c:forEach items="${user.getCommentsList()}" var="comment">
                                        <c:if test="${comment.user.getUsername()!=null}">
                                            <tr>
                                                <td>${comment.comment}</td>
                                                <td>${comment.date}</td>
                                                <td>${comment.time}</td>
                                            </tr>   
                                        </c:if>
                                    </c:forEach>
                                </table>
                            </div>
                        </td>
                    </tr> 
                </d:forEach>
            </table>

            <br><br>
        </form>
    </div>

    <div class="centerc2">
        <br>
        <form>
            <p><strong>Comment for job</strong></p>
            <table>
                <tr>
                    <th>Jobname</th>
                    <th>Comment list</th>
                </tr>
                <d:forEach items="${allJobs}" var="job">
                    <tr>
                        <td>${job.jobname}</td>
                        <td>
                            <table>
                                <tr>
                                    <th>Comment</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                </tr>
                                <c:forEach items="${allComments}" var="comment">
                                    <c:if test="${comment.job.getJobname()!=null}">
                                        <tr>
                                            <td>${comment.comment}</td>
                                            <td>${comment.date}</td>
                                            <td>${comment.time}</td>
                                        </tr>   
                                    </c:if>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                </d:forEach>                             
            </table>   
            <br><br>


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
        <h2>Comments</h2>
        <form action="./CommentServlet" method="POST">
            <a href="CommentAddServlet"><button class="btn3" type="button">AddToUser</button></a>
            <a href="CommentJobServlet"><button class="btn3" type="button">AddToJob</button></a>
            <a href="CommentEditServlet"><button class="btn3" type="button">Edit</button></a>
            <a href="CommentDeleteServlet"><button class="btn3" type="button">Delete</button></a>
            <a href="userLogged.jsp"><button class="btn3" type="button">Back</button></a>
            <br><br>
        </form>
    </div>
    <div class="centerc1">
        <br>
        <form>
            <p ><strong>Comment for user</strong></p>
            <table> 
                <tr>
                    <th>Username</th>
                    <th>CommentList</th>
                </tr>
                <d:forEach items="${allUsers}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <div id="${user.username}">  
                                <table> 
                                    <tr>
                                        <th>Comment</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                    </tr>

                                    <c:forEach items="${user.getCommentsList()}" var="comment">
                                        <c:if test="${comment.user.getUsername()!=null}">
                                            <tr>
                                                <td>${comment.comment}</td>
                                                <td>${comment.date}</td>
                                                <td>${comment.time}</td>
                                            </tr>   
                                        </c:if>
                                    </c:forEach>
                                </table>
                            </div>
                        </td>
                    </tr> 
                </d:forEach>
            </table>

                 <br><br>
        </form>
    </div>

    <div class="centerc2">
        <br>
        <form>
            <p><strong>Comment for job</strong></p>
            <table>
                <tr>
                    <th>Jobname</th>
                    <th>Comment list</th>
                </tr>
                <d:forEach items="${allJobs}" var="job">
                    <tr>
                        <td>${job.jobname}</td>
                        <td>
                            <table>
                                <tr>
                                    <th>Comment</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                </tr>
                                <c:forEach items="${allComments}" var="comment">
                                    <c:if test="${comment.job.getJobname()!=null}">
                                        <tr>
                                            <td>${comment.comment}</td>
                                            <td>${comment.date}</td>
                                            <td>${comment.time}</td>
                                        </tr>   
                                    </c:if>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                </d:forEach>                             
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
        <h2>Comments</h2>
        <form action="./CommentServlet" method="POST">
            <a href="CommentAddServlet"><button class="btn3" type="button">AddToUser</button></a>
            <a href="CommentJobServlet"><button class="btn3" type="button">AddToJob</button></a>
            <a href="CommentEditServlet"><button class="btn3" type="button">Edit</button></a>
            <a href="CommentDeleteServlet"><button class="btn3" type="button">Delete</button></a>
            <a href="userLogged.jsp"><button class="btn3" type="button">Back</button></a>
            <br><br>
        </form>
    </div>
    <div class="centerc1">
        <br>
        <form>
            <p ><strong>Comment for user</strong></p>
            <table> 
                <tr>
                    <th>Username</th>
                    <th>CommentList</th>
                </tr>
                <d:forEach items="${allUsers}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <div id="${user.username}">  
                                <table> 
                                    <tr>
                                        <th>Comment</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                    </tr>

                                    <c:forEach items="${user.getCommentsList()}" var="comment">
                                        <c:if test="${comment.user.getUsername()!=null}">
                                            <tr>
                                                <td>${comment.comment}</td>
                                                <td>${comment.date}</td>
                                                <td>${comment.time}</td>
                                            </tr>   
                                        </c:if>
                                    </c:forEach>
                                </table>
                            </div>
                        </td>
                    </tr> 
                </d:forEach>
            </table>

                  <br><br>
        </form>
    </div>

    <div class="centerc2">
        <br>
        <form>
            <p><strong>Comment for job</strong></p>
            <table>
                <tr>
                    <th>Jobname</th>
                    <th>Comment list</th>
                </tr>
                <d:forEach items="${allJobs}" var="job">
                    <tr>
                        <td>${job.jobname}</td>
                        <td>
                            <table>
                                <tr>
                                    <th>Comment</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                </tr>
                                <c:forEach items="${allComments}" var="comment">
                                    <c:if test="${comment.job.getJobname()!=null}">
                                        <tr>
                                            <td>${comment.comment}</td>
                                            <td>${comment.date}</td>
                                            <td>${comment.time}</td>
                                        </tr>   
                                    </c:if>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
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
            <li>  <a href="ProfileServlet"><strong>Profile</strong></a></li>
            <li>  <a href="CommentServlet"><strong>Comment</strong></a></li>
            <li>  <a href="JobsServlet"><strong>Job</strong></a></li>
            <li>  <a href="JobApplicantServlet"><strong>ListApplicants</strong></a></li>
            <li>  <a href="userLogout.jsp" class="bttn bttn-one">LogOut</a></li>
        </ul>
    </nav>
    <div class="comm">
        <h2>Comments</h2>
        <form action="./CommentServlet" method="POST">
            <a href="CommentAddServlet"><button class="btn3" type="button">AddToUser</button></a>
            <a href="CommentJobServlet"><button class="btn3" type="button">AddToJob</button></a>
            <a href="CommentEditServlet"><button class="btn3" type="button">Edit</button></a>
            <a href="CommentDeleteServlet"><button class="btn3" type="button">Delete</button></a>
            <a href="userLogged.jsp"><button class="btn3" type="button">Back</button></a>
            <br><br>
        </form>
    </div>
    <div class="centerc1">
        <br>
        <form>
            <p ><strong>Comment for user</strong></p>
            <table> 
                <tr>
                    <th>Username</th>
                    <th>CommentList</th>
                </tr>
                <d:forEach items="${allUsers}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <div id="${user.username}">  
                                <table> 
                                    <tr>
                                        <th>Comment</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                    </tr>

                                    <c:forEach items="${user.getCommentsList()}" var="comment">
                                        <c:if test="${comment.user.getUsername()!=null}">
                                            <tr>
                                                <td>${comment.comment}</td>
                                                <td>${comment.date}</td>
                                                <td>${comment.time}</td>
                                            </tr>   
                                        </c:if>
                                    </c:forEach>
                                </table>
                            </div>
                        </td>
                    </tr> 
                </d:forEach>
            </table>

                 <br><br>
        </form>
    </div>

    <div class="centerc2">
        <br>
        <form>
            <p><strong>Comment for job</strong></p>
            <table>
                <tr>
                    <th>Jobname</th>
                    <th>Comment list</th>
                </tr>
                <d:forEach items="${allJobs}" var="job">
                    <tr>
                        <td>${job.jobname}</td>
                        <td>
                            <table>
                                <tr>
                                    <th>Comment</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                </tr>
                                <c:forEach items="${allComments}" var="comment">
                                    <c:if test="${comment.job.getJobname()!=null}">
                                        <tr>
                                            <td>${comment.comment}</td>
                                            <td>${comment.date}</td>
                                            <td>${comment.time}</td>
                                        </tr>   
                                    </c:if>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                </d:forEach>                             
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
        <h2>Comments</h2>
        <form action="./CommentServlet" method="POST">
            <a href="CommentAddServlet"><button class="btn3" type="button">AddToUser</button></a>
            <a href="CommentJobServlet"><button class="btn3" type="button">AddToJob</button></a>
            <a href="CommentEditServlet"><button class="btn3" type="button">Edit</button></a>
            <a href="CommentDeleteServlet"><button class="btn3" type="button">Delete</button></a>
            <a href="userLogged.jsp"><button class="btn3" type="button">Back</button></a>
            <br><br>
        </form>
    </div>
    <div class="centerc1">
        <br>
        <form>
            <p ><strong>Comment for user</strong></p>
            <table> 
                <tr>
                    <th>Username</th>
                    <th>CommentList</th>
                </tr>
                <d:forEach items="${allUsers}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <div id="${user.username}">  
                                <table> 
                                    <tr>
                                        <th>Comment</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                    </tr>

                                    <c:forEach items="${user.getCommentsList()}" var="comment">
                                        <c:if test="${comment.user.getUsername()!=null}">
                                            <tr>
                                                <td>${comment.comment}</td>
                                                <td>${comment.date}</td>
                                                <td>${comment.time}</td>
                                            </tr>   
                                        </c:if>
                                    </c:forEach>
                                </table>
                            </div>
                        </td>
                    </tr> 
                </d:forEach>
            </table>

                 <br><br>
        </form>
    </div>

    <div class="centerc2">
        <br>
        <form>
            <p><strong>Comment for job</strong></p>
            <table>
                <tr>
                    <th>Jobname</th>
                    <th>Comment list</th>
                </tr>
                <d:forEach items="${allJobs}" var="job">
                    <tr>
                        <td>${job.jobname}</td>
                        <td>
                            <table>
                                <tr>
                                    <th>Comment</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                </tr>
                                <c:forEach items="${allComments}" var="comment">
                                    <c:if test="${comment.job.getJobname()!=null}">
                                        <tr>
                                            <td>${comment.comment}</td>
                                            <td>${comment.date}</td>
                                            <td>${comment.time}</td>
                                        </tr>   
                                    </c:if>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                </d:forEach>                             
            </table>   
            <br><br>


        </form>
    </div>    
</div>    
</body>
</html>
