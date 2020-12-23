<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>

<t:pageTemplate pageTitle="Upload File">


    <form action="UploadFileServlet" method="POST" enctype="multipart/form-data" novalidate>
        <div>
            <div>
                <label for="file">File</label>
                <input type="file" name="file" required>                      
            </div>
        </div>
        <input type="hidden" name="username" value="${name}">
        <button type="submit" name="action" value="Add">Upload</button>

    </form>

</t:pageTemplate>