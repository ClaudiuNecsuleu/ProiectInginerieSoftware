<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Register">
    <div class="centereg"> 
        <h2>Register</h2>
        <form action="./RegisterServlet" method="POST" enctype="multipart/form-data"  >     
            <div class="txt_field"> <input pattern=".{3,}" required title="Minimum 3 characters required" type="text" placeholder="Nume" name="name" required/></div>
            <div class="txt_field">  <input pattern=".{3,}" required title="Minimum 3 characters required" type="text" placeholder="Prenume" name="prenume" required/></div>
            <div class="txt_field"> <input type="text" pattern=".{10,}" required title="Number required" maxlength="10" placeholder="Telefon" name="telefon"  required/></div>
            <div class="txt_field">  <input type="text" pattern=".{10,}" required title="Phone number required" maxlength="10" placeholder="Telefon Mobil" name="telefonMobil"  required/></div>
            <div class="txt_field"><input type="email" placeholder="Mail" name="mail" required/></div>
            <div class="txt_field"> <input type="text" placeholder="Descriere" name="descriere" required/></div>
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