<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="UserEdit">
    
    <div class="comm">
        <h1>Users Edit</h1>
        <form action="./UserEditInputServlet" method="POST">
            <label><strong>Select user to edit:</strong></label>
            <select  name="userid" required>
                <option value="">Username</option>
                <c:forEach var="user" items="${allUsers}" varStatus="status">
                    <option value="${user.userid}">  ${user.username}</option>
                </c:forEach>
            </select>

            <button type="submit" class="btn3" name="action" value="Edit">Edit</button>
            <a href="UserServlet"><button class="btn3" type="button">Back</button></a>
            <br><br>
        </form> 
    </div>
    <div class="center1">
        <br>
        <form>
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
        </form>

    </div>

</t:pageTemplate>