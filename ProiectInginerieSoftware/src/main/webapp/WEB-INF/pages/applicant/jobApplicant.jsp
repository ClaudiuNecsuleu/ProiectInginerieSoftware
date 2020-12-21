<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("stuff", request.getRemoteUser());%>
<t:pageTemplate pageTitle="JobApplicant">
    <jsp:body>
        <div class="comm">
            <h2>Applicant</h2>
            ${stuff}
            <a href="JobApplicantServletAdd"><button class="btn3" type="button">AddApplicant</button></a>
            <a href="JobApplicantServletDelete"><button class="btn3" type="button">DeleteApplicant</button></a>
            <a href="JobApplicantServletDelete"><button class="btn3" type="button">EditApplicant</button></a>
        </div>
    </jsp:body>
</t:pageTemplate>


