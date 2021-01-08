<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="CommentEdit">

    <div class="center">  
        <h2>Comments Edit User</h2>
        <form action="./CommentEditUserNextServlet" method="POST">


            <select name="commentIDUser" required>
                <option value="">Choose comment</option>
                <d:forEach var="comment" items="${user.getCommentsList()}" varStatus="status">
                    <option value="${comment.commentid}">  ${comment.comment}</option>
                </d:forEach>
            </select>

            <div class="txt_field"> <input type="text" placeholder="New Comment" name="newCommentUser" value="${comment.comment}" required></div>
                <c:if test="${message != null}">
                <div class="alert alert-warning" role="alert">
                    ${message}
                </div>   
            </c:if>
            
            <input type="hidden" name="userid" value="${user.userid}">
            <button type="submit" class="btn3" name="action" value="EditUser" >Edit</button>
            <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
            <br>
        </form>
    </div>

</t:pageTemplate>