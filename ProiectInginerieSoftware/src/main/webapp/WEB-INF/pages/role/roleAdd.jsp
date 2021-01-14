<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<t:pageTemplate pageTitle="RoleAdd">
            <div class="center">
                <h2>Role Add</h2>
                <form action="./RoleAddServlet" method="POST">
                    <div class="txt_field"> <input type="text" placeholder="Rol" name="nameRole" value="${role.rolename}"/> </div>

                    <button type="submit" class="btn3"  name="action" value="AddRole" required>Adauga</button>
                    <a href="RoleServlet"><button class="btn3" type="button">Back</button></a>
                    <br>
                </form>
                      </div>
                    <br><br>
                <div class="center2">
                    <br>
                <form>

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
                    <br>
                </form>
            </div>
     </t:pageTemplate>