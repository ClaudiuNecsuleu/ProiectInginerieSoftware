<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>

<t:pageTemplate pageTitle="Profile Edit">
    <div class="centeruinput">
        <h2>Users Edit</h2>
        <form action="./ProfileEditServlet" method="POST">
            <div class="txt_field">  <input type="hidden" name="username" value="${name}"></div>
            <div class="txt_field"> <input type="text" name="telefon" placeholder="Telefon" value="${user.telefon}" required></div>
            <div class="txt_field">  <input type="text" name="telefonMobil" placeholder="Telefon mobil" value="${user.telefonMobil}" required></div>
            <div class="txt_field"> <input type="text" name="descriere" placeholder="Descriere" value="${user.descriere}" required></div>
            <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
            <a href="ProfileServlet"><button class="btn3" type="button">Back</button></a>
            <br> <br>
        </form> 
    </div>


</t:pageTemplate>