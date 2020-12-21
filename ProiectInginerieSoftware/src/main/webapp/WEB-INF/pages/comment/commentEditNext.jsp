<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="CommentEdit">

    <div class="comm">  
        <h2>Comments Edit</h2>
        <form action="./CommentEditNextServlet" method="POST">

            <select name="commentid" required>
                <option value="">Choose comment</option>
                <d:forEach var="comment" items="${user.getCommentsList()}" varStatus="status">
                    <option value="${comment.commentid}">  ${comment.comment}</option>
                </d:forEach>
            </select>

            <div class="txt_field"> <input type="text" placeholder="New Comment" name="comment" value="${comment.comment}" required></div>

            <button type="submit" class="btn3" name="action" value="Edit" >Edit</button>
            <a href="CommentServlet"><button class="btn3" type="button">Back</button></a>
            <br>
        </form>
    </div>

</t:pageTemplate>