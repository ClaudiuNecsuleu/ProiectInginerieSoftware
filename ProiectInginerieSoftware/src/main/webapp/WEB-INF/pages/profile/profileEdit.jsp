<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>

<t:pageTemplate pageTitle="Profile Edit">
        <div class="centerprof">
             <h1>Salut, ${user.getName()} ${user.getPrenume()} !</h1>
       
        </t:pageTemplate>