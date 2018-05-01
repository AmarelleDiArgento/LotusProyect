<%@page import="Servicios.Mensajes"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "index.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta charset="UTF-16">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Elite Flower</title>
        <link rel="shortcut icon" href="img\favicon.png" type="image/x-icon"/>
        <!-- CSS  -->
        <link href="css/material-icons.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>


    </head>
    <%
        if (Ses.getAttribute("msj") != null) {

            msj = (Mensajes) Ses.getAttribute("msj");
            out.println(msj.getBody());
        } else {%>
    <body>


        <%}%>
        <header class="header">
            <div>
                <img style="z-index: 99; position: relative;"  src="img/logo.png" width="100%">
            </div>
            <div>
                <a class=" btn-session floating waves-effect waves-light modal-trigger" href="#buscar"><i class="material-icons medium grey-text darken-4">search</i></a>
                <a class=" btn-session floating waves-effect waves-light modal-trigger" href="#sesion"><i class="material-icons medium grey-text darken-4 ">person</i></a>

            </div>
        </header>
        <div id="sesion" class="modal modal-session">
            <div class="modal-content center-align">
                <form class="col s12" method="get" action="usuarios.do">
                    <div class="row">
                        <h2>Iniciar sesion</h2>
                        <div class="input-field col s12">
                            <input id="text" type="text" name="Usuario" class="validate">
                            <label for="text">Usuario</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="password" type="password" name="Password" class="validate">
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <a href="#" class="text-hover">¿Olvidaste tu contraseña?</a> <br>
                    <div class="modal-footer text-center">
                        <input name="accion" value="Ingresar" type="submit" class="modal-action modal-close waves-effect waves-green btn-flat">
                        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>


        <div id="buscar" class="modal">
            <div class="modal-content center-align">
                <form class="col s12">
                    <div class="row">
                        <h2>Buscar</h2>
                        <div class="input-field col s12">
                            <input id="text" type="text" class="validate">
                            <label for="text">buscar</label>
                        </div>
                    </div>
                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">cerrar</a>
                </form>
            </div>
        </div>


        <div class="slider fullscreen">
            <ul class="slides">
                <li>
                    <img src="img/pexels-photo-135224.jpeg"> <!-- random image -->
                    <div class="caption center-align">
                        <h3 class="grey-text text-darken-4">Lotus QA</h3>
                        <h5 class="grey-text text-darken-4">Software.</h5>
                    </div>
                </li>
                <li>
                    <img src="img/pexels-photo-169192.jpeg"> <!-- random image -->
                    <div class="caption left-align">
                        <h3 class="grey-text text-darken-4">Administra</h3>
                        <h5 class="grey-text text-darken-4">tus datos</h5>
                    </div>
                </li>
                <li>
                    <img src="img/pexels-photo-269227.jpeg"> <!-- random image -->
                    <div class="caption right-align">
                        <h3>Gestiona</h3>
                        <h5 class="light grey-text text-lighten-3">tus procesos</h5>
                    </div>
                </li>
                <li>
                    <img src="img/tulips-flowers-tulip-bouquet-violet-54186.jpeg"> <!-- random image -->
                    <div class="caption center-align">
                        <h3>Facilita</h3>
                        <h5 class="light grey-text text-lighten-3">tu trabajo.</h5>
                    </div>
                </li>
            </ul>
        </div>




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
        function msjError(Msj) {
            swal({
                title: "<%=msj.getMsj()%>",
                text: "<%=msj.getDetalles()%>",
                icon: "error"
            });
        }
        ;
        <% } else if (msj.getTipo().equals("Conf")) {

                    %>
        function msjConf(id)
        {
            swal({
                title: "¿Estas seguro?",
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
        <%} else if (msj.getTipo().equals("Ok")) {%>
        function msjMsj()
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
