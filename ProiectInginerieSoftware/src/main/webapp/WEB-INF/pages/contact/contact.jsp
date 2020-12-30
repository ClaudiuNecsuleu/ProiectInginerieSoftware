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
            <img src="clau.jpg" alt="Jane" style="width:100%">
            <div class="container">
                <h2>Clau</h2>
                <p class="title">CEO & Founder</p>
                <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                <p>jane@example.com</p>
                <p><button class="btn3">Contact</button></p>
            </div>
        </div>
    </div>
     <div class="column">
        <div class="card">
            <img src="clau.jpg" alt="Jane" style="width:100%">
            <div class="container">
                <h2>Alex</h2>
                <p class="title">CEO & Founder</p>
                <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                <p>jane@example.com</p>
                <p><button class="btn3">Contact</button></p>
            </div>
        </div>
    </div>
     <div class="column">
        <div class="card">
            
            <img src="leo.jpg" alt="Jane" style="width:100%">
            <div class="container">
                <h2>Bogdan</h2>
                <p class="title">CEO & Founder</p>
                <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                <p>jane@example.com</p>
                <p><button class="btn3">Contact</button></p>
            </div>
        </div>
    </div>

</t:pageTemplate>