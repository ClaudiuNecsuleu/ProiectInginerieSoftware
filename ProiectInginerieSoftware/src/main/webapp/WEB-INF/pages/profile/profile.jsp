<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Profile">
        <div class="centerprof">
        <form>
            <br><br>
        <table>
            <tr>
                <td><strong>Nume:</strong></td>
                <td>${user.getName()}</td>
            </tr>
            <tr>
                <td><strong>Prenume:</strong></td>
                <td>${user.getPrenume()}</td>
            </tr>
            <tr>
                <td><strong>Telefon:</strong></td>
                <td>${user.getTelefon()}</td>
            </tr>
            <tr>
                <td><strong>Telefon mobil:</strong></td>
                <td>${user.getTelefonMobil()}</td>
            </tr>
            <tr>
                <td><strong>Mail:</strong></td>
                <td>${user.getMail()}</td>
            </tr>
            <tr>
                <td><strong>Rol:</strong></td>
                <td>${user.getRole().getRolename()}</td>
            </tr>
            <tr>
                <td><strong>Job:</strong> </td>
                <td>${user.getJob().getJobname()}</td>
            </tr>
            <tr>
                <td><strong>Job pentru care ai aplicat: </strong></td>
                <td>${user.getJobApplicant().getJobname()}</td>
            </tr>
            <tr>
                <td><strong>Photo </strong></td>
                <td>  <img src="${pageContext.request.contextPath}/Photo?id=${user.getUserid()}" width="48"/></td>
            </tr>
        </table>
            <br><br>
        </form>
        </div>
            <br><br>
            <div class="centerprofc2">
            <form>
            <p><strong> Comentariile pentru tine:</strong></p>
        <table >
            <th>
                Comentariu
            </th>
            <th>
                Data
            </th>
            <th>
                Ora
            </th>
            <th>
                Autor
            </th>

            <c:forEach items="${user.getCommentsList()}" var="comment">
                <tr>
                    <td>${comment.comment}</td>
                    <td>${comment.date}</td>
                    <td>${comment.time}</td>
                    <td>${comment.publisherUsername}</td>
                </tr> 
            </c:forEach>
        </table>
            <br><br>
            </form>
            </div>
            <br><br>
            <div class="centerprofc">
            <form>
            <p><strong> Comentariile tale:</strong></p>
        <table >
            <th>
                Comentariu
            </th>
            <th>
                Data
            </th>
            <th>
                Ora
            </th>
            <c:forEach items="${getCommentsByUsername}" var="comment">
                <tr>
                    <td>${comment.comment}</td>
                    <td>${comment.date}</td>
                    <td>${comment.time}</td>
                </tr> 
            </c:forEach>
        </table>
            <br><br>
            </form>
            </div>
        </t:pageTemplate>