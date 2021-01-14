<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<t:pageTemplate pageTitle="Comment">

    <div class="center">
        <h2><fmt:message key="Comments"/></h2>
        <form action="./CommentServlet" method="POST">
            <c:if test="${pageContext.request.isUserInRole('UserRole')}">
                <a href="CommentAddServlet"><button class="btn3" type="button"><fmt:message key="AddToUser"/></button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('UserRole')}">
                <a href="CommentJobServlet"><button class="btn3" type="button"><fmt:message key="AddToJob"/></button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
                <a href="CommentEditUserRedirectServlet"><button class="btn3" type="button"><fmt:message key="Edit for user"/></button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
                <a href="CommentEditJobRedirectServlet"><button class="btn3" type="button"><fmt:message key="Edit for job"/></button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
                <a href="CommentDeleteServlet"><button class="btn3" type="button"><fmt:message key="Delete"/></button></a>
            </c:if>
            <br><br>
        </form>
    </div>
    <div class="centerc1">
        <br>
        <form>
            <p ><strong><fmt:message key="Comment for user"/></strong></p>
            <table> 
                <tr>
                    <th><fmt:message key="Username"/></th>
                    <th><fmt:message key="CommentList"/></th>
                </tr>
                <d:forEach items="${allUsers}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <table> 
                                <tr>
                                    <th><fmt:message key="Comment"/></th>
                                    <th><fmt:message key="Date"/></th>
                                    <th><fmt:message key="Time"/></th>
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
            <p><strong><fmt:message key="Comment for job"/></strong></p>
            <table>
                <tr>
                    <th><fmt:message key="Jobname"/></th>
                        <th><fmt:message key="Comment list"/></th>
                </tr>
                <d:forEach items="${allJobs}" var="job">
                    <tr>
                        <td>${job.jobname}</td>
                        <td>
                            <table>
                                <tr>
                                    <th><fmt:message key="Comment"/></th>
                                    <th><fmt:message key="Date"/></th>
                                    <th><fmt:message key="Time"/></th>
                                </tr>
                                <c:forEach items="${job.getCommentsList()}" var="comment">
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
