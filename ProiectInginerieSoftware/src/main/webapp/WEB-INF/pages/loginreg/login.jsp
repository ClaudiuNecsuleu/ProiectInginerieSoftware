<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="Login">
     <div class="center"> 
         <h2><fmt:message key="Login"/></h2>

    <form method="POST" action="j_security_check">
        <div class="txt_field"> <input type="text"  name="j_username"  placeholder="<fmt:message key="Username"/>" required autofocus/></div>
        <div class="txt_field"><input type="password"  name="j_password" placeholder="<fmt:message key="Password"/>" required/></div>
            <c:if test="${message != null}">
        <div class="alert alert-warning" role="alert">
            <fmt:message key="${message}"/>
        </div>   
    </c:if>
        <button  type="submit"><fmt:message key="Sign.in"/></button>
        <a href="RegisterServlet"><button type="button" class="cancelbtn" ><fmt:message key="Register"/></button></a>
    </form>
     </div>
</t:pageTemplate>