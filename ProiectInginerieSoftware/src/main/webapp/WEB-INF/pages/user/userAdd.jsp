<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="UserAdd">

    <div class="centereg">
        <h2>Users Add</h2>
        <form action="./UserAddServlet" method="POST">
            <div class="txt_field">  <input type="text" name="name" placeholder="Nume" value="${user.name}" required></div>
            <div class="txt_field"> <input type="text" name="prenume" placeholder="Prenume" value="${user.prenume}" required></div>
            <div class="txt_field"> <input type="text" name="password" placeholder="Password" value="${user.password}" required></div>
            <div class="txt_field"> <input type="text" name="telefon" placeholder="Telefon" value="${user.telefon}" required></div>
            <div class="txt_field">  <input type="text" name="telefonMobil" placeholder="TelefonMobil" value="${user.telefonMobil}" required></div>
            <div class="txt_field"> <input type="text" name="mail" placeholder="Mail" value="${user.mail}" required></div>
            <div class="txt_field"> <input type="text" name="descriere" placeholder="Descriere" value="${user.descriere}" required></div>
            <label for="functia">Functia</label>
            <select  name="functia" required="">
                <option value="">Choose</option>
                <option value="USER">User</option>
                <option value="DIRGEN">Director General</option>
                <option value="DIRHR">Director HR</option>
                <option value="DIRDEP">Director de departament</option>
                <option value="RECRUITER">Recruiter</option>
            </select>
            <br>
            <button type="submit" name="action" value="Add">Add</button>
            <a href="UserServlet"><button type="button">Back</button></a>
            <br> <br>
        </form>
    </div>

</t:pageTemplate>