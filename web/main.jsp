
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "main.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);

    Mensajes msj = new Mensajes();
//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {

%>
<html lang="es" style="height: 100%;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Elite Flower</title>
        <link rel="shortcut icon" href="img\favicon.png" type="image/x-icon"/>
        <!-- CSS  -->
        <link href="css/material-icons.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>


        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">

    </head>
    <body
        <%        if (Ses.getAttribute("msj") != null) {
                msj = (Mensajes) Ses.getAttribute("msj");
                out.println(msj.getBody());

            } %> class="bodyfull"
        >

        <header>
            <%@include file="Segmentos\menu.jspf" %>
        </header>

        <div class="container" style="width: 100%;">
            <div class="slider" >
                <ul class="slides">
                    <li>
                        <img src="img/pexels-photo-135224.jpeg">

                    </li>
                    <li>
                        <img src="img/pexels-photo-135224.jpeg">

                    </li>
                    <li>
                        <img src="img/pexels-photo-135224.jpeg">

                    </li>
                </ul>
            </div>



            <%--<a href="test.jsp">Test</a>--%>



            <footer class="footer">
                <div>
                    <div>
                        <p class="center-align">
                            LOTUS - ELITE FLOWER © 2017 Copyright Text
                        </p>
                    </div>
                </div>
            </footer>


    </body>
    <!--Scripts-->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script type="text/javascript" src="js/init.js"></script>
    <script type="text/javascript" src="js/sweetalert.min.js"></script>
    <%
        if (msj != null) {
    %>
    <script type="text/javascript">

        <%if (msj.getTipo().equals("Error")) {%>
        function msjError() {
            swal({
                title: "<%=msj.getMsj()%>",
                text: "<%=msj.getDetalles()%>",
                icon: "error"
            });
        }
        ;


        <%} else if (msj.getTipo().equals("Msj")) {%>
        function msjMsj() {

            swal("<%=msj.getMsj()%>", {
                button: false
            });
        }
        ;

        <%} else if (msj.getTipo().equals("Ok")) {%>
        function msjOk()
        {
            swal({
                title: "¡Excelente!",
                text: "<%=msj.getMsj()%>",
                icon: "success"
            });
        }
        ;
        <%}%>
    </script>
    <%
            Ses.setAttribute("msj", null);

        }
    %>
</html>
<%
    } else {

        if (msj.getTipo() != null) {
            Ses.setAttribute("msj", msj);
        }
        response.sendRedirect("index.jsp");
    }
%>
