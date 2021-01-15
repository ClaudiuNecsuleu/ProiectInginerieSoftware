<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="CommentEdit">

    <div class="center">  
        <h2><fmt:message key="Comments Edit Job"/></h2>
        <form action="./CommentEditJobNextServlet" method="POST">

            <select name="commentIDJob" required>
                <option value=""><fmt:message key="Choose.comment"/></option>
                <d:forEach var="comment" items="${job.getCommentsList()}" varStatus="status">
                    <option value="${comment.commentid}">${comment.comment}</option>
                </d:forEach>
            </select>

            <div class="txt_field"> <input type="text" placeholder="<fmt:message key="New.Comment"/>" name="newCommentJob" value="${comment.comment}" required></div>
                <c:if test="${message != null}">
                <div class="alert alert-warning" role="alert">
                    <fmt:message key="${message}"/>
                </div>   
            </c:if>
            
            <input type="hidden" name="jobID" value="${job.jobid}">
            <button type="submit" class="btn3" name="action" value="EditJob" ><fmt:message key="Edit"/></button>
            <a href="CommentServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
            <br>
        </form>
    </div>

</t:pageTemplate>