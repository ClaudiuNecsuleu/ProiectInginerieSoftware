<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="pageTitle"%>
<%@attribute name="body" fragment="true" %>

<%-- any content can be specified here e.g.: --%>

<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="style.css" media="all" />
        <title>${pageTitle}</title>
        <script>
            var isNS = (navigator.appName == "Netscape") ? 1 : 0;
            if (navigator.appName == "Netscape")
                document.captureEvents(Event.MOUSEDOWN || Event.MOUSEUP);
            function mischandler() {
                return false;
            }
            function mousehandler(e) {
                var myevent = (isNS) ? e : event;
                var eventbutton = (isNS) ? myevent.which : myevent.button;
                if ((eventbutton == 2) || (eventbutton == 3))
                    return false;
            }
            document.oncontextmenu = mischandler;
            document.onmousedown = mousehandler;
            document.onmouseup = mousehandler;
        </script>
    </head>
    <body>
        <jsp:include page="/WEB-INF/pages/menu.jsp" />
        <main role="main" class="container">
            <jsp:doBody />
    </body>
</html>
