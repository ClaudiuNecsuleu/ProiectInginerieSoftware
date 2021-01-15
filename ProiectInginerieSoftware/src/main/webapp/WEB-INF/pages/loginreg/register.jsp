<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="Register">
    <div class="centereg"> 
        <h2><fmt:message key="Register"/></h2>
        <form action="./RegisterServlet" method="POST" enctype="multipart/form-data"  >     
            <div class="txt_field"> <input pattern=".{3,}" required title="Minimum 3 characters required" type="text" placeholder="<fmt:message key="Nume"/>" name="name" required/></div>
            <div class="txt_field">  <input pattern=".{3,}" required title="Minimum 3 characters required" type="text" placeholder="<fmt:message key="Prenume"/>" name="prenume" required/></div>
            <div class="txt_field"> <input type="text" pattern=".{10,}" required title="Number required" maxlength="10" placeholder="<fmt:message key="Telefon"/>" name="telefon" required/></div>
            <div class="txt_field">  <input type="text" pattern=".{10,}" required title="Phone number required" maxlength="10" placeholder="<fmt:message key="Telefon.mobil"/>" name="telefonMobil"  required/></div>
            <div class="txt_field"><input type="email" placeholder="<fmt:message key="Mail"/>" name="mail" required/></div>
            <div class="txt_field"> <input type="text" placeholder="<fmt:message key="Descriere"/>" name="descriere" required/></div>
            <div>
                <div>
                    <label for="file"><fmt:message key="Photo"/></label>
                    <input type="file" class="custom-file-input" name="file" required>                      
                </div>
            </div>
            <c:if test="${message != null}">
                <div class="alert alert-warning" role="alert">
                    <fmt:message key="${message}"/>
                </div>   
            </c:if>
            <button type="submit" name="action" value="Add"><fmt:message key="Register"/></button>
            <a href="${pageContext.request.contextPath}"><button type="button" class="cancelbtn" ><fmt:message key="Cancel"/></button></a>
            <br>
        </form>
        <br>
    </div>
</t:pageTemplate>