<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<% request.setAttribute("name", request.getRemoteUser());%>

<t:pageTemplate pageTitle="Upload File">


    <div class="centeruinput">
    <form action="UploadFileServlet" method="POST" enctype="multipart/form-data" novalidate>
        <div>
                <br>           
                <input type="file" class="custom-file-input" name="file" required>                      
        </div>
        <input type="hidden" name="username" value="${name}">
        <button type="submit" name="action" value="Add"><fmt:message key="Upload"/></button>

    </form>
    </div>
</t:pageTemplate>