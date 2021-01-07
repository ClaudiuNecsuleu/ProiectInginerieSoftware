<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="User">
    <div class="center">
        <form>
            <h2>Users</h2>
            <c:if test="${pageContext.request.isUserInRole('DirGenRole')||pageContext.request.isUserInRole('AdminRole')}">
                <a href="UserAddServlet"><button class="btn" type="button">Add</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('DirGenRole')||pageContext.request.isUserInRole('AdminRole')}">
                <a href="UserEditServlet"><button class="btn" type="button">Edit</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('DirGenRole')||pageContext.request.isUserInRole('AdminRole')}">
                <a href="UserDeleteServlet"><button class="btn" type="button">Delete</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('DirGenRole')||pageContext.request.isUserInRole('AdminRole')}">
                <a href="UserFindServlet"><button class="btn" type="button">Search</button></a>
            </c:if>

            <br><br>
        </form>
    </div>
</t:pageTemplate>