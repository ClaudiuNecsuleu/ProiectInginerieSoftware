<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>

<t:pageTemplate pageTitle="Show CV">
    <center>
        <embed src="${pageContext.request.contextPath}/File?id=${user.getUsername()}" width="1200px" height="2100px" />
    </center>

</t:pageTemplate>



