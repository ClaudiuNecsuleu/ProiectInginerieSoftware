<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="UserEdit">

    <div class="comm">
        <h1>Users Edit</h1>
        <form action="./UserEditInputServlet" method="POST">

            <div class="txt_field">  <input type="hidden" name="useridSelect" value="${userSelect.userid}"></div>
            <div class="txt_field">  <input type="text" name="name" placeholder="Nume" value="${userSelect.name}" required></div>
            <div class="txt_field">  <input type="text" name="password" placeholder="Password" ></div>
            <div class="txt_field"> <input type="text" name="prenume" placeholder="Prenume" value="${userSelect.prenume}" required></div>
            <div class="txt_field"> <input type="text" name="telefon" placeholder="Telefon" value="${userSelect.telefon}" required></div>
            <div class="txt_field">  <input type="text" name="telefonMobil" placeholder="Telefon mobil" value="${userSelect.telefonMobil}" required></div>
            <div class="txt_field"> <input type="text" name="mail" placeholder="Mail" value="${userSelect.mail}" required></div>
            <div class="txt_field"> <input type="text" name="functia" placeholder="Functia" value="${userSelect.functia}" required></div>
            <div class="txt_field"> <input type="text" name="descriere" placeholder="Descriere" value="${userSelect.descriere}" required></div>
            <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
            <a href="UserServlet"><button class="btn3" type="button">Back</button></a>
        </form> 
        <br>
        <table>
            <th>ID</th>
            <th>Name</th>
            <th>Prenume</th>
            <th>Telefon</th>
            <th>Telefon Mobil</th>
            <th>Mail</th>
            <th>Functie</th>
            <th>Descriere</th>
            <th>Username</th>
                <c:forEach items="${allUsers}" var="user">
                <tr>
                    <td>${user.userid}</td>
                    <td>${user.name}</td>
                    <td>${user.prenume}</td>
                    <td>${user.telefon}</td>
                    <td>${user.telefonMobil}</td>
                    <td>${user.mail}</td>
                    <td>${user.functia}</td>
                    <td>${user.descriere}</td>
                    <td>${user.username}</td>
                </tr>   
            </c:forEach>
        </table>
        <br>
    </div>
            
</t:pageTemplate>