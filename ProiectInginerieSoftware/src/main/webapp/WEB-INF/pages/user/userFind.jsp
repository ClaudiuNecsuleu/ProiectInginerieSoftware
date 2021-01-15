<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />

<t:pageTemplate pageTitle="UserFind">

    <div class="center">
        <h1><fmt:message key="Users.Information"/></h1>  
        <form action="./UserFindServlet" method="POST">
            <div class="txt_field"> <input type="text" id="usernameInput" onkeypress="return noenter()" placeholder="<fmt:message key="Cauta.dupa.orice"/>" required></div>
            <a href="UserServlet"><button class="btn3" type="button"><fmt:message key="Back"/></button></a>
            <br>
        </form>
    </div>

    <div class="centerued">
     
        <form>
               <br><br>
            <table id="userTable">
                <tr>
                    <th>ID</th>
                    <th><fmt:message key="Nume"/></th>
                    <th><fmt:message key="Prenume"/></th>
                    <th><fmt:message key="Telefon"/></th>
                    <th><fmt:message key="Telefon.mobil"/></th>
                    <th><fmt:message key="Mail"/></th>
                    <th><fmt:message key="Functia"/></th>
                    <th><fmt:message key="Descriere"/></th>
                    <th><fmt:message key="Username"/></th>
                </tr>
                <tbody id="myTable">
                    <c:forEach items="${allUsers}" var="users">
                        <tr>

                            <td>${users.userid}</td>
                            <td>${users.name}</td>
                            <td>${users.prenume}</td>
                            <td>${users.telefon}</td>
                            <td>${users.telefonMobil}</td>
                            <td>${users.mail}</td>
                            <td>${users.functia}</td>
                            <td>${users.descriere}</td>
                            <td>${users.username}</td>
                        </tr>   
                    </c:forEach>
                </tbody>
            </table>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script>
                    $(document).ready(function () {
                        $("#usernameInput").on("keyup", function () {
                            var value = $(this).val().toLowerCase();
                            $("#myTable tr").filter(function () {
                                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                            });
                        });
                    });
            </script>
            <script type="text/javascript">
                function noenter() {
                    return !(window.event && window.event.keyCode == 13);
                }
            </script>

               <br><br>
        </form>
    </div>

</t:pageTemplate>