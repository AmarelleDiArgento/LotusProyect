
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
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Elite Flower</title>
        <link rel="shortcut icon" href="img\favicon.png" type="image/x-icon"/>

        <!-- CSS  -->
        <link href="css/material-icons.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    </head>

    <%        if (Ses.getAttribute("msj") != null) {
            msj = (Mensajes) Ses.getAttribute("msj");
            out.println(msj.getBody());

        } else {%><body><%}%>
        <%=msj.getTipo()%>
        <%=msj.getDetalles()%>
        <%=msj.getMsj()%>

        <header>
            <%@include file="Segmentos\menu.jspf" %>
        </header>


        <div class="container">



        </div>


        <footer class="footer">
            <div>
                <div>
                    <p class="center-align">
                        LOTUS - ELITE FLOWER � 2017 Copyright Text
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
                title: "�Excelente!",
                text: "<%=msj.getMsj()%>",
                icon: "success"
            });
        }
        ;
        <%}%>
        function msjConf(id)
        {
            swal({
                title: "�Estas seguro?",
                text: "Se eliminara el registro con el ID: " + id,
                icon: "warning",
                buttons: true,
                dangerMode: true
            })
                    .then((willDelete) => {
                        if (willDelete) {
                            window.location = 'usuarios.do?accion=Eliminar&Id=' + id;
                        }
                    });
        }
        ;
    </script>
    <%

            Ses.setAttribute("msj", null);
        }
    %>
</html>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>
