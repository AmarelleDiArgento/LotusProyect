
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "main.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {

%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Elite Flower</title>
        <link rel="shortcut icon" href="img\favicon.png" type="image/x-icon"/>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    </head>

    <%        if (Ses.getAttribute("msj") != null) {

            msj = (Mensajes) Ses.getAttribute("msj");

            out.println(msj.toBody());
        } else {%>
    <body>


        <%}%>
        
        <header>
            <%@include file="Segmentos\menu.jspf" %>
        </header>


        <div class="container">



        </div>


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
    <%@include file="Segmentos\scriptJs.jspf" %>
</html>
<%

        Ses.setAttribute("msj", null);
    } else {
        response.sendRedirect("index.jsp");
    }
%>
