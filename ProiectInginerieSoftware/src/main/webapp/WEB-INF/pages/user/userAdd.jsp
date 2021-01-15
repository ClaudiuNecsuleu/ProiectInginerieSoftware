<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="UserAdd">

    <div class="centereg">
        <h2><fmt:message key="Users.Add"/></h2>
        <form action="./UserAddServlet" method="POST">
            <div class="txt_field">  <input pattern=".{3,}" required title="Minimum 3 characters required" type="text" name="name" placeholder="<fmt:message key="Nume"/>" value="${user.name}" required></div>
            <div class="txt_field"> <input pattern=".{3,}" required title="Minimum 3 characters required" type="text" name="prenume" placeholder="<fmt:message key="Prenume"/>" value="${user.prenume}" required></div>
            <div class="txt_field"> <input pattern=".{10,}" required title="Number required" maxlength="10" type="text" name="password" placeholder="<fmt:message key="Password"/>" value="${user.password}" required></div>
            <div class="txt_field"> <input type="text"   pattern=".{10,}" required title="Phone number required" maxlength="10" name="telefon" placeholder="<fmt:message key="Telefon"/>" value="${user.telefon}" required></div>
            <div class="txt_field">  <input  pattern=".{10,}" required title="Phone number required" maxlength="10" type="text" name="telefonMobil" placeholder="<fmt:message key="Telefon.mobil"/>" value="${user.telefonMobil}" required></div>
            <div class="txt_field"> <input type="email" name="mail" placeholder="<fmt:message key="Mail"/>" value="${user.mail}" required></div>


            <div class="txt_field"> <input type="text" name="descriere" placeholder="<fmt:message key="Descriere"/>" value="${user.descriere}" required></div>
            <label for="functia"><fmt:message key="Functia"/></label>
            <select  name="functia" required="">
                <option value=""><fmt:message key="Choose"/></option>
                <option value="USER"><fmt:message key="user"/></option>
                <option value="DIRGEN"><fmt:message key="Director.General"/></option>
                <option value="DIRHR"><fmt:message key="Director.HR"/></option>
                <option value="DIRDEP"><fmt:message key="Director.departament"/></option>
                <option value="RECRUITER"><fmt:message key="Recruiter"/></option>
            </select>
            <br>
            <button type="submit" name="action" value="Add"><fmt:message key="Add"/></button>
            <a href="UserServlet"><button type="button"><fmt:message key="Back"/></button></a>
            <br> <br>
        </form>
    </div>

</t:pageTemplate>