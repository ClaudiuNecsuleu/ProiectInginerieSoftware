<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setLocale value="${language}" />
 <fmt:setBundle basename="com.ulbs.proiectingineriesoftware.resourcesI18n.content" />
 
<% request.setAttribute("name", request.getRemoteUser());%>

<t:pageTemplate pageTitle="Profile">


    <h1><fmt:message key="Salut"/>, ${user.getName()} ${user.getPrenume()} !</h1>
           

    <div class="centerprof">
        <form>
            <br><br>
            <table>
                <tr>
                    <td><strong><fmt:message key="Nume"/></strong></td>
                    <td>${user.getName()}</td>
                </tr>
                <tr>
                    <td><strong><fmt:message key="Prenume"/></strong></td>
                    <td>${user.getPrenume()}</td>
                </tr>
                <tr>
                    <td><strong><fmt:message key="Telefon"/></strong></td>
                    <td>${user.getTelefon()}</td>
                </tr>
                <tr>
                    <td><strong><fmt:message key="Telefon.mobil"/></strong></td>
                    <td>${user.getTelefonMobil()}</td>
                </tr>
                <tr>
                    <td><strong><fmt:message key="Mail"/></strong></td>
                    <td>${user.getMail()}</td>
                </tr>
                <d:if test="${user.getJob().getJobname()!=null}">
                    <tr>
                        <td><strong><fmt:message key="Job"/></strong> </td>
                        <td>${user.getJob().getJobname()}</td>
                    </tr>
                </d:if>
                <d:if test="${user.getJobApplicant().getJobname()!=null}">
                    <tr>
                        <td><strong><fmt:message key="job.aplicat"/></strong></td>
                        <td>${user.getJobApplicant().getJobname()}</td>
                    </tr>
                </d:if>

                <d:if test="${user.getFile()!=null}">
                    <tr>
                        <td><strong>CV </strong></td>
                        <td> <a href="ShowCVServlet" > ${user.getFile().getFilename()}</a> </td>
                    </tr>
                </d:if>
            </table>
                <br>



                <a href="RedirectUploadFile"><button class="btn" type="button"><fmt:message key="Upload.CV"/></button></a>

        </form>
        
                 
        
                

        <form action="./ProfileRedirectEdit" method="POST">
            <input type="hidden" name="username" value="${name}" >

            <button class="btn" type="submit"><fmt:message key="Profile.edit"/></button>
        </form>
            <form>
                <a href="ChangePhoto"><button class="btn" type="button"><fmt:message key="Change.photo"/></button></a>
                <a href="ChangePassword"><button class="btn" type="button"><fmt:message key="Change.password"/></button></a>

        <br><br>
            </form>
    </div>
            <div class="circular">
            <center>
                <img src="${pageContext.request.contextPath}/Photo?id=${user.getUserid()}" width="100" height="100"/>

            </center>
              
        </div>
                 <div class="descriere">
                     ${user.getDescriere()}
                </div>
    <br><br>
    <div class="centerprofc2">
        <form>
            <p><strong><fmt:message key="Comentariile.tine"/></strong></p>
            <table >
                <th>
                    <fmt:message key="Comentariu"/>
                </th>
                <th>
                    <fmt:message key="Data"/>
                </th>
                <th>
                    <fmt:message key="Ora"/>
                </th>
                <th>
                    <fmt:message key="Autor"/>
                </th>

                <c:forEach items="${user.getCommentsList()}" var="comment">
                    <tr>
                        <td>${comment.comment}</td>
                        <td>${comment.date}</td>
                        <td>${comment.time}</td>
                        <td>${comment.publisherUsername}</td>
                    </tr> 
                </c:forEach>
            </table>
            <br><br>
        </form>
    </div>
    <br><br>
    <div class="centerprofc">
        <form>
             <p><strong><fmt:message key="Comentariile.tale"/></strong></p>
            <table >
                <th>
                    <fmt:message key="Comentariu"/>
                </th>
                <th>
                    <fmt:message key="Data"/>
                </th>
                <th>
                    <fmt:message key="Ora"/>
                </th>
                <c:forEach items="${getCommentsByUsername}" var="comment">
                    <tr>
                        <td>${comment.comment}</td>
                        <td>${comment.date}</td>
                        <td>${comment.time}</td>
                    </tr> 
                </c:forEach>
            </table>
            <br><br>
        </form>
    </div>
</t:pageTemplate>