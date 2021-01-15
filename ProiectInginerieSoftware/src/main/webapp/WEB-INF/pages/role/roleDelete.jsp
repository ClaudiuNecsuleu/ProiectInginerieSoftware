<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="RoleDelete">
            <div class="center">
                <h2><fmt:message key="Delete.role"/></h2>
                <form action="./RoleDeleteServlet" method="POST">

                    <select name="deleteRole" required>
                        <option value=""><fmt:message key="Choose.role"/></option>
                        <c:forEach var="role" items="${allRoles}" varStatus="status">
                            <option value="${role.rolename}">${role.rolename}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <button type="submit" class="btn3"  name="action" value="deleteRole"><fmt:message key="Delete.role"/></button>
                    <a href="RoleServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
                </form>
                      </div>
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
  </t:pageTemplate>