<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<% request.setAttribute("name", request.getRemoteUser());%>

<t:pageTemplate pageTitle="Contact">

    <div class="about-section">
        <h1><fmt:message key="About.Us"/></h1>
        <center>
            <p><center><strong><fmt:message key="Echipa.ULBS12"/></strong></center><p>
            <p><strong><a href="https://docs.google.com/document/d/1TpUNnOcEc6ybwSvgsg2Xp98nsHsJoNJu/edit"><fmt:message key="Documentatie"/></a></strong></p>
            <br>
            <p><strong><fmt:message key="Contact.msg"/></strong></p>
            <p><strong><a href="https://trello.com/b/rmUsWc5v/proiect-inginerie-software">Trello</a></strong></p>
            <p><strong><a href="https://github.com/ClaudiuNecsuleu/ProiectInginerieSoftware/commits/main">GitHub</a></strong></p>
        </center>
    </div>
    <h2 style="text-align:center"><fmt:message key="Our.Team"/></h2>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="clau.jpg" alt="Clau" width="100px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Clau</h2>

                    <p><strong><fmt:message key="Clau"/></strong></p>
                    <p><fmt:message key="Some text"/> </p>
                    <p>claudiu.necsuleu@ulbsibiu.ro</p>
                    <button class="btn1"><fmt:message key="Contact"/></button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="alex.jpg" alt="Alex" width="100px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Alex</h2>

                    <p><strong><fmt:message key="Alex"/></strong></p>
                    <p><fmt:message key="Some text"/> </p>
                    <p>alexandruc.stoian@ulbsibiu.ro</p>
                    <button class="btn1"><fmt:message key="Contact"/></button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="bobo.jpg" alt="Bobo" width="100px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Bogdan</h2>

                    <p><strong><fmt:message key="Bogdan"/></strong></p>
                    <p><fmt:message key="Some text"/> </p>
                    <p>bogdan.paicu@ulbsibiu.ro</p>

                    <button class="btn1"><fmt:message key="Contact"/></button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="larisa.jpg" alt="Larisa" width="100px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Larisa</h2>

                    <p><strong><fmt:message key="Larisa"/></strong></p>
                    <p><fmt:message key="Some text"/> </p>
                    <p>larisa.giubega@ulbsibiu.ro</p>
                    <button class="btn1"><fmt:message key="Contact"/></button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="dani.jpg" alt="Dani" width="100px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Dani</h2>

                    <p><strong><fmt:message key="Dani"/></strong></p>
                    <p><fmt:message key="Some text"/></p>
                    <p>daniel.dumitrana@ulbsibiu.ro</p>
                    <button class="btn1"><fmt:message key="Contact"/></button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="leo.jpg" alt="Leo" width="100px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Leo</h2>

                    <p><strong><fmt:message key="Leo"/></strong></p>
                    <p><fmt:message key="Some text"/> </p>
                    <p>leonard.otesanu@ulbsibiu.ro</p>
                    <button class="btn1"><fmt:message key="Contact"/></button>
                </center>
            </div>
        </div>
    </div>

</t:pageTemplate>