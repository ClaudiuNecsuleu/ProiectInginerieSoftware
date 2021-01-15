<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="RoleAdd">
            <div class="center">
                <h2><fmt:message key="Add.role"/></h2>
                <form action="./RoleAddServlet" method="POST">
                    <div class="txt_field"> <input type="text" placeholder="<fmt:message key="Rol"/>" name="nameRole" value="${role.rolename}"/> </div>

                    <button type="submit" class="btn3"  name="action" value="Add.role" required><fmt:message key="Adauga"/></button>
                    <a href="RoleServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
                    <br>
                </form>
                      </div>
                    <br><br>
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