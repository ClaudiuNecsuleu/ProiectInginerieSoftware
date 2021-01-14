<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="UserEdit">

    <div class="centeruinput">
        <h2><fmt:message key="Users Edit"/></h2>
        <form action="./UserEditInputServlet" method="POST">

            <div class="txt_field">  <input type="hidden" name="useridSelect" value="${userSelect.userid}"></div>
            <div class="txt_field">  <input type="text" name="name" placeholder="<fmt:message key="Nume"/>" value="${userSelect.name}" required></div>
            <div class="txt_field">  <input type="text" name="password" placeholder="<fmt:message key="Password"/>" ></div>
            <div class="txt_field"> <input type="text" name="prenume" placeholder="<fmt:message key="Prenume"/>" value="${userSelect.prenume}" required></div>
            <div class="txt_field"> <input type="text" name="telefon" placeholder="<fmt:message key="Telefon"/>" value="${userSelect.telefon}" required></div>
            <div class="txt_field">  <input type="text" name="telefonMobil" placeholder="<fmt:message key="Telefon mobil"/>" value="${userSelect.telefonMobil}" required></div>
            <div class="txt_field"> <input type="text" name="mail" placeholder="<fmt:message key="Mail"/>" value="${userSelect.mail}" required></div>
            <div class="txt_field"> <input type="text" name="functia" placeholder="<fmt:message key="Functia"/>" value="${userSelect.functia}" required></div>
            <div class="txt_field"> <input type="text" name="descriere" placeholder="<fmt:message key="Descriere"/>" value="${userSelect.descriere}" required></div>
            <button type="submit" class="btn3" name="action" value="Edit"><fmt:message key="Edit"/></button>
            <a href="UserServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
         <br> <br>
        </form> 
    </div>
       <div class="centeruedinput">
           <form>
               <br><br>
        <table>
            <th>ID</th>
            <th><fmt:message key="Name"/></th>
            <th><fmt:message key="Prenume"/></th>
            <th><fmt:message key="Telefon"/></th>
            <th><fmt:message key="Telefon Mobil"/></th>
            <th><fmt:message key="Mail"/></th>
            <th><fmt:message key="Functie"/></th>
            <th><fmt:message key="Descriere"/></th>
            <th><fmt:message key="Username"/></th>
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
        <br> <br>
           </form>
    </div>
            
</t:pageTemplate>