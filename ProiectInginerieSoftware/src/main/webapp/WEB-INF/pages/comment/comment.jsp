<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<t:pageTemplate pageTitle="Comment">

    <div class="center">
        <h2>Comments</h2>
        <form action="./CommentServlet" method="POST">
            <c:if test="${pageContext.request.isUserInRole('UserRole')}">
                <a href="CommentAddServlet"><button class="btn3" type="button">AddToUser</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('UserRole')}">
                <a href="CommentJobServlet"><button class="btn3" type="button">AddToJob</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
                <a href="CommentEditServlet"><button class="btn3" type="button">Edit</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
                <a href="CommentDeleteServlet"><button class="btn3" type="button">Delete</button></a>
            </c:if>
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
</t:pageTemplate>
