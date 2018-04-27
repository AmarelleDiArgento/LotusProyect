<!DOCTYPE html>

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
    <body>
        <header class="header">
            <div>
                <img style="z-index: 99; position: relative;"  src="img/logo.png" width="100%">
            </div>
            <div>
                <a class=" btn-session floating waves-effect waves-light modal-trigger" href="#buscar"><i class="material-icons large green-text darken-3">search</i></a>
                <a class=" btn-session floating waves-effect waves-light modal-trigger" href="#sesion"><i class="material-icons large green-text darken-4 ">person</i></a>
            </div>
        </header>
        <div id="sesion" class="modal modal-session">
            <div class="modal-content center-align">
                <form class="col s12" method="get" action="usuarios.do">
                    <div class="row">
                        <h2>Iniciar sesion</h2>
                        <div class="input-field col s12">
                            <input id="text" type="text" name="Loger" class="validate">
                            <label for="text">Usuario</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="password" type="password" name="Password" class="validate">
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <a href="#" class="text-hover">�olvidaste tu contrase�a?</a> <br>
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
    <%@include file="Segmentos\scriptJs.jsp" %>%>

</html>
