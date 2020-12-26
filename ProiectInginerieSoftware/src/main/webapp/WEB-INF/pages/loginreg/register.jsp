<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Register">
    <div class="centereg"> 
        <h2>Register</h2>
        <form action="./RegisterServlet" method="POST" enctype="multipart/form-data" novalidate >     
            <div class="txt_field"> <input type="text" placeholder="Nume" name="name" value="${users.name}" required/></div>
            <div class="txt_field">  <input type="text" placeholder="Prenume" name="prenume" value="${users.prenume}" required/></div>
            <div class="txt_field">  <input type="text" placeholder="Password" name="password" value="${users.password}" required/></div>
            <div class="txt_field"> <input type="text" placeholder="Telefon" name="telefon" value="${users.telefon}" required/></div>
            <div class="txt_field">  <input type="text" placeholder="Telefon Mobil" name="telefonMobil" value="${users.telefonMobil}" required/></div>
            <div class="txt_field"><input type="text" placeholder="Mail" name="mail" value="${users.mail}" required/></div>
            <div class="txt_field"> <input type="text" placeholder="Descriere" name="descriere" value="${users.descriere}" required/></div>
            <div>
                <div>
                    <label for="file">Photo</label>
                    <input type="file" name="file" required>                      
                </div>
            </div>
            <c:if test="${message != null}">
                <div class="alert alert-warning" role="alert">
                    ${message}
                </div>   
            </c:if>
            <button type="submit" name="action" value="Add">Register</button>
            <a href="${pageContext.request.contextPath}"><button type="button" class="cancelbtn" >Cancel</button></a>
            <br>
        </form>
        <br>
    </div>
</t:pageTemplate>