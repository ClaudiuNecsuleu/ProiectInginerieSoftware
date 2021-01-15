<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="pageTitle"%>
<%@attribute name="body" fragment="true" %>

<%-- any content can be specified here e.g.: --%>

<!DOCTYPE html>
<html oncontextmenu="return false">
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <title>${pageTitle}</title>
        <script>
           document.captureEvents(Event.KEYDOWN);
            function fblock(e) {
                if (e.which === 123) {
                    return false;
                }
            }
            document.onkeydown = fblock;
        </script>
    </head>
    <body>
        <jsp:include page="/WEB-INF/pages/menu.jsp" />
        <main role="main" class="container">
            <jsp:doBody />
    </body>
</html>
