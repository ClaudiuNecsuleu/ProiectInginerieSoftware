<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />


<t:pageTemplate pageTitle="RoleInfo">
            <div class="center">
                <form>
                    <h2><fmt:message key="Role.List"/></h2>
                    <a href="RoleAddServlet"><button class="btn" type="button"><fmt:message key="Add.role"/></button></a>
                    <a href="RoleDeleteServlet"><button class="btn" type="button"><fmt:message key="Delete.role"/></button></a>
                    <a href="RoleAddUserServlet"><button class="btn" type="button"><fmt:message key="AddUserRole"/></button></a>
                    <br><br>
                </form>
            </div>
            <br><br>
            <div class="centerr1">
                <br>
                <form>
                    <p><strong><fmt:message key="Role.List"/></strong></p>
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
                    <br><br>
                </form>
            </div>
            <div class="centerr2">
                <form>  
                    <p><strong><fmt:message key="Role.User.List"/></strong></p>
                    <table>
                        <th><fmt:message key="Username"/></th>
                        <th><fmt:message key="Role.List"/></th>
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