<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
    <img src="logoo.png" alt="logoo" width="210" height="110">
    <ul>

        <li> 
            <a href="${pageContext.request.contextPath}">ABC.DLL</a>
        </li>
        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() != null}">
                <li ${activePage eq 'ProfileServlet' ? ' active' : ''}>
                    <a href="${pageContext.request.contextPath}/ProfileServlet">Profile</a>
                </li>
            </c:when>
        </c:choose>

        <li ${activePage eq 'RoleServlet' ? ' active' : ''}>
            <a href="${pageContext.request.contextPath}/RoleServlet">Role</a>
        </li>

        <li  ${activePage eq 'CommentServlet' ? ' active' : ''}>
            <a class="nav-link" href="${pageContext.request.contextPath}/CommentServlet">Comment</a>
        </li>

        <li ${activePage eq 'UserServlet' ? ' active' : ''}>
            <a  href="${pageContext.request.contextPath}/UserServlet">User</a>
        </li>

        <li ${activePage eq 'JobsServlet' ? ' active' : ''}>
            <a  href="${pageContext.request.contextPath}/JobsServlet">Job</a>
        </li>
        <li ${activePage eq 'JobApplicantServlet' ? ' active' : ''}>
            <a  href="${pageContext.request.contextPath}/JobApplicantServlet">Applicant</a>
        </li>
        <c:choose>
            <c:when test="${pageContext.request.getRemoteUser() == null}">
                <li ${activePage eq 'RegisterServlet' ? ' active' : ''}>
                    <a  href="${pageContext.request.contextPath}/RegisterServlet">Register</a>
                </li>
            </c:when>    
        </c:choose>

        <li>
            <c:choose>
                <c:when test="${pageContext.request.getRemoteUser() == null}">
                    <a  href="${pageContext.request.contextPath}/LoginServlet">Login</a>
                </c:when>
                <c:otherwise>
                    <a  href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
                </c:otherwise>
            </c:choose>
        </li>
    </ul>
</nav>