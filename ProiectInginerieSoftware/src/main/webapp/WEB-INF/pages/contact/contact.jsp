<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setAttribute("name", request.getRemoteUser());%>

<t:pageTemplate pageTitle="Contact">

    <div class="about-section">
        <h1>About Us Page</h1>
        <center>
            <p><strong>Some text about who we are and what we do.</strong></p>
            <p><strong>Resize the browser window to see that this page is responsive by the way.</strong></p>
        </center>
    </div>
    <h2 style="text-align:center">Our Team</h2>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="clau.jpg" alt="Clau" width="80px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Clau</h2>

                    <p><strong>CEO & Founder</strong></p>
                    <p>Some text </p>
                    <p>claudiu.necsuleu@ulbsibiu.ro</p>
                    <button class="btn1">Contact</button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="alex.jpg" alt="Alex" width="80px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Alex</h2>

                    <p><strong>CEO & Founder</strong></p>
                    <p>Some text </p>
                    <p>alexandruc.stoian@ulbsibiu.ro</p>
                    <button class="btn1">Contact</button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="bobo.jpg" alt="Bobo" width="80px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Bogdan</h2>

                    <p><strong>CEO & Founder</strong></p>
                    <p>Some text </p>
                    <p>bogdan.paicu@ulbsibiu.ro</p>

                    <button class="btn1">Contact</button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="larisa.jpg" alt="Larisa" width="80px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Larisa</h2>

                    <p><strong>CEO & Founder</strong></p>
                    <p>Some text </p>
                    <p>larisa.giubega@ulbsibiu.ro</p>
                    <button class="btn1">Contact</button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="dani.jpg" alt="Dani" width="80px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Dani</h2>

                    <p><strong>CEO & Founder</strong></p>
                    <p>Some text</p>
                    <p>daniel.dumitrana@ulbsibiu.ro</p>
                    <button class="btn1">Contact</button>
                </center>
            </div>
        </div>
    </div>
    <div class="column">
        <div class="card">
            <center>
                <br>
                <img src="leo.jpg" alt="Leo" width="80px" height="100px">
            </center>
            <div class="container">
                <center>
                    <h2>Leo</h2>

                    <p><strong> CEO & Founder</strong></p>
                    <p>Some text </p>
                    <p>leonard.otesanu@ulbsibiu.ro</p>
                    <button class="btn1">Contact</button>
                </center>
            </div>
        </div>
    </div>

</t:pageTemplate>