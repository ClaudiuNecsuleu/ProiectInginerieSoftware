<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<t:pageTemplate pageTitle="CommentDelete">

    <div class="center">
        <h2>Comments Delete</h2>
        <form action="./CommentDeleteServlet" method="POST">
            <label><strong>Delete comment for user:</strong></label>
            <select  name="commentIdUser" id="commentIdUser">
                    <option value="">comment</option>
                <c:forEach var="comment" items="${allComments}" varStatus="status">
                    <c:if test ="${comment.getUser()!=null}">
                    <option value="${comment.commentid}">  ${comment.comment}</option>
                    </c:if>
                </c:forEach>
            </select>
            <br>
            <label><strong>Delete comment for job:</strong></label>
            <select  name="commentIdJob" id="commentIdJob" >
                <option value="">comment</option>
                <c:forEach var="comment" items="${allComments}" varStatus="status">
                    <c:if test ="${comment.getJob()!=null}">
                    <option value="${comment.commentid}">  ${comment.comment}</option>
                    </c:if>
                </c:forEach>
            </select>
            <br>
              <c:if test="${message != null}">
                    <div class="alert alert-warning" role="alert">
                        ${message}
                    </div>   
                </c:if>
            <button type="submit" class="btn3" name="action" value="Delete" >Delete</button>
            <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
            <br>
        </form>
    </div>
</t:pageTemplate>