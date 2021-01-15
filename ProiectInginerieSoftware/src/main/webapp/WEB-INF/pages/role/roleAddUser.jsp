<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="RoleAddUser">
            <div class="center">
                <h2><fmt:message key="AddUserRole"/></h2>
                <form action="./RoleAddUserServlet" method="POST">
                    <select name="NameRole" required>
                        <option value=""><fmt:message key="Choose.role"/></option>
                        <c:forEach var="role" items="${allRoles}" varStatus="status">
                            <option value="${role.rolename}">${role.rolename}</option>
                        </c:forEach>
                    </select>
                    <select name="username" required>
                        <option value=""><fmt:message key="Choose.User"/></option>
                        <c:forEach var="user" items="${allUsers}" varStatus="status">
                            <option value="${user.username}">${user.username}</option>
                        </c:forEach>
                    </select>

                    <button type="submit" class="btn3"   name="action" value="AddToUser"><fmt:message key="AddUserRole"/></button>
                    <a href="RoleServlet"><button class="btn3"  type="button"><fmt:message key="Back"/></button>    </a>
                    
                      </form>
                      </div>
                   <br>
                <div class="center2">
                <br>
                <form>

                    <table>
                        <th>ID</th>
                        <th><fmt:message key="NameRole"/></th>

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
        </div>
</t:pageTemplate>