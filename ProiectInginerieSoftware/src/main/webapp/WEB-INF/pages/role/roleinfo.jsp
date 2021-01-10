<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>


<t:pageTemplate pageTitle="RoleInfo">
            <div class="center">
                <form>
                    <h2>Role List</h2>
                    <a href="RoleAddServlet"><button class="btn" type="button">Add</button></a>
                    <a href="RoleDeleteServlet"><button class="btn" type="button">Delete role</button></a>
                    <a href="RoleAddUserServlet"><button class="btn" type="button">AddUserRole</button></a>
                    <br><br>
                </form>
            </div>
            <br><br>
            <div class="centerr1">
                <br>
                <form>
                    <p><strong>Role list</strong></p>
                    <table>
                        <th>ID</th>
                        <th>NameRole</th>
                        <c:forEach items="${allRoles}" var="role">
                            <tr>
                                <td>${role.roleid}</td>
                                <td>${role.rolename}</td>
                            </tr>   
                        </c:forEach>
                    </table>
                    <br><br>
                </form>
            </div>
            <div class="centerr2">
                <form>  
                    <p><strong>Role and User List</strong></p>
                    <table>
                        <th>Username</th>
                        <th>Role List</th>
                        <d:forEach items="${allUsers}" var="user">
                            <tr>
                                <td>${user.username}</td>                  
                                <td>${user.getRole().rolename}</td> 
                            </tr>   
                        </d:forEach>
                    </table>
                    <br><br>
                </form>
            </div>
</t:pageTemplate>