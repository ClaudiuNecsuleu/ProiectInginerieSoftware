<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="JobApplicant">

    <div class="comm">
        <h2>Applicant</h2>

        <a href="JobApplicantServletAplica"><button class="btn3" type="button">Aplica</button></a>
        <a href="JobApplicantServletChoose"><button class="btn3" type="button">Recomanda</button></a>
        <a href="JobApplicantServletAdd"><button class="btn3" type="button">AddApplicant</button></a>
        <a href="JobApplicantServletDelete"><button class="btn3" type="button">DeleteApplicant</button></a>
        <a href="JobApplicantServletEdit"><button class="btn3" type="button">EditApplicant</button></a>
    </div>

</t:pageTemplate>


