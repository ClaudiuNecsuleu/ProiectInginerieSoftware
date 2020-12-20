<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="User">
            <div class="center">
                <h1>Users</h1>
                <a href="UserAddServlet"><button class="btn" type="button">Add</button></a>
                <a href="UserEditServlet"><button class="btn" type="button">Edit</button></a>
                <a href="UserDeleteServlet"><button class="btn" type="button">Delete</button></a>
                <a href="UserFindServlet"><button class="btn" type="button">Search</button></a>
                <br><br>
            </div>
       </t:pageTemplate>