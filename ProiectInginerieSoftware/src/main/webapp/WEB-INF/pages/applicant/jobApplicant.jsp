<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="JobApplicant">

    <div class="center">
        <form>
            <h2>Applicant</h2>
            <c:if test="${pageContext.request.isUserInRole('UserRole')&&!pageContext.request.isUserInRole('AdminRole')&&
                          !pageContext.request.isUserInRole('DirDepRole')&&!pageContext.request.isUserInRole('DirGenRole')&&
                          !pageContext.request.isUserInRole('DirHrRole')&&!pageContext.request.isUserInRole('RecruiterRole')}">
                <a href="JobApplicantServletAplica"><button class="btn" type="button">Aplica</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')}">
                <a href="JobApplicantServletChoose"><button class="btn" type="button">Recomanda</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('DirHrRole')||pageContext.request.isUserInRole('DirDepRole')}">
                <a href="JobApplicantServletAdd"><button class="btn" type="button">AddApplicant</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')}">
                <a href="JobApplicantServletDelete"><button class="btn" type="button">DeleteApplicant</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')}">
                <a href="JobApplicantServletEdit"><button class="btn" type="button">EditApplicant</button></a>
            </c:if>
            <c:if test="${pageContext.request.isUserInRole('RecruiterRole')||pageContext.request.isUserInRole('DirDepRole')||pageContext.request.isUserInRole('DirHrRole')}">
                <a href="ViewCVApplicant"><button class="btn" type="button">View CV Applicant</button></a>
            </c:if>
            <br><br>
        </form>
    </div>

</t:pageTemplate>


