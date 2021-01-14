<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="UserEdit">
    
    <div class="center">
        <h2><fmt:message key="Users Edit"/></h2>
        <form action="./UserEditInputServlet" method="POST">
            <label><strong><fmt:message key="Select user to edit:"/></strong></label>
            <select  name="userid" required>
                <option value=""><fmt:message key="Username"/></option>
                <c:forEach var="user" items="${allUsers}" varStatus="status">
                    <option value="${user.userid}">  ${user.username}</option>
                </c:forEach>
            </select>

            <button type="submit" class="btn3" name="action" value="Edit"><fmt:message key="Edit"/></button>
            <a href="UserServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
            
        </form> 
         <br>
    </div>
    <div class="centerued">
       
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
                <br><br>
        </form>

    </div>

</t:pageTemplate>