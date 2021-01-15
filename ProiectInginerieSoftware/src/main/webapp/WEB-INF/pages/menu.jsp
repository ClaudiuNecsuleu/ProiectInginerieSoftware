<%@page import="com.ulbs.proiectingineriesoftware.Common.LanguageBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% LanguageBean languageBean = ((LanguageBean) (session.getAttribute("languageLocale")));%>
<fmt:setLocale value="<%=languageBean.getLocale()%>" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<nav>
    <img src="logoo.png" alt="logoo" width="210" height="110">
    <ul>

        <li> 
            <a href="${pageContext.request.contextPath}">ABC.DLL</a>
        </li>
        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() != null}">
                <li ${activePage eq 'ProfileServlet' ? ' active' : ''}>
                    <a href="${pageContext.request.contextPath}/ProfileServlet"><fmt:message key="menu.Profile"/></a>
                </li>
            </c:when>
        </c:choose>

        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() != null}">
                <c:if test="${pageContext.request.isUserInRole('DirGenRole')}">
                    <li ${activePage eq 'RoleServlet' ? ' active' : ''}>
                        <a href="${pageContext.request.contextPath}/RoleServlet"><fmt:message key="menu.Role"/></a>
                    </li>
                </c:if>
            </c:when>
        </c:choose>

        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() != null}">
                <c:if test="${pageContext.request.isUserInRole('UserRole')}">
                    <li  ${activePage eq 'CommentServlet' ? ' active' : ''}>
                        <a class="nav-link" href="${pageContext.request.contextPath}/CommentServlet"><fmt:message key="menu.Comment"/></a>
                    </li>
                </c:if>
            </c:when>
        </c:choose>

        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() != null}">
                <c:if test="${pageContext.request.isUserInRole('DirGenRole')||pageContext.request.isUserInRole('AdminRole')}">
                    <li ${activePage eq 'UserServlet' ? ' active' : ''}>
                        <a  href="${pageContext.request.contextPath}/UserServlet"><fmt:message key="menu.User"/></a>
                    </li>
                </c:if>
            </c:when>
        </c:choose>

        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() != null}">
                <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirGenRole')}">
                    <li ${activePage eq 'JobsServlet' ? ' active' : ''}>
                        <a  href="${pageContext.request.contextPath}/JobsServlet"><fmt:message key="menu.Job"/></a>
                    </li>
                </c:if>
            </c:when>
        </c:choose>

        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() != null}">
                <c:if test="${pageContext.request.isUserInRole('UserRole')&&!pageContext.request.isUserInRole('DirGenRole')}">
                    <li ${activePage eq 'JobApplicantServlet' ? ' active' : ''}>
                        <a  href="${pageContext.request.contextPath}/JobApplicantServlet"><fmt:message key="menu.Applicant"/></a>
                    </li>
                </c:if>
            </c:when>    
        </c:choose>
        <li>
            <a  href="${pageContext.request.contextPath}/contactServlet"><fmt:message key="menu.Contact"/></a>
        </li>

        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() == null}">
                <li ${activePage eq 'RegisterServlet' ? ' active' : ''}>
                    <a  href="${pageContext.request.contextPath}/RegisterServlet"><fmt:message key="Register"/></a>
                </li>
            </c:when>    
        </c:choose>

        <li>
            <c:choose>
                <c:when test="${pageContext.request.getRemoteUser() == null}">
                    <a  href="${pageContext.request.contextPath}/LoginServlet?language=en_US"><fmt:message key="Login"/></a>
                </c:when>
                <c:otherwise>
                    <a  href="${pageContext.request.contextPath}/LogoutServlet"><fmt:message key="Logout"/> </a>
                </c:otherwise>
            </c:choose>
        </li>

    </ul>
</nav>