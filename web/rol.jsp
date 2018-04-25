
<%@page import="Modelo.Tabs.RolTab"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "rol.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {

%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Rol</title>
        <link rel="shortcut icon" href="img\favicon.png" type="image/x-icon"/>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

    </head>
    <body>
        <header>
            <%@include file="Segmentos\menu.jsp" %>
        </header>


        <div class="container">
            <h4>Rol Mensaje:</h4>
            <%String msj = (String) Ses.getAttribute("msj");%>
            <p><%=msj%></p>
            <br>
            <% if (Ses.getAttribute("lisR") != null) {
                    List<RolTab> LisR = (List<RolTab>) Ses.getAttribute("lisR");

            %>
            <table class="centered striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Estado</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>

                <tbody>
                    <%                        for (RolTab rt : LisR) {
                    %>
                    <tr>
                        <td><%=rt.getRolId()%></td>
                        <td><%=rt.getRolNombre()%></td>
                        <td><%=rt.getRolDescripcion()%></td>
                        <td><%=rt.isRolEstado()%></td>
                        <td><i class="material-icons">edit</i></td>
                        <td><i class="material-icons">delete</i></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%} else {
                    response.sendRedirect("rols.do?accion=Listar");
                }%>
            <div class="fixed-action-btn">
                <a class="btn-floating btn-large pink">
                    <i class="large material-icons">settings</i>
                </a>
                <ul>
                    <li><a href="#" class="btn-floating light-green tooltipped" data-position="left" data-tooltip="Nuevo Usuario"><i class="material-icons">person_add</i></a></li>
                    <li><a href="#" class="btn-floating light-pink tooltipped" data-position="left" data-tooltip="Subir xls"><i class="material-icons">attach_file</i></a></li>
                    <li><a href="#" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Roles"><i class="material-icons">assignment_ind</i></a></li>
                    
                </ul>
            </div>
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
    <%@include file="Segmentos\scriptJs.jsp" %>%>
</html>
<%
    } else {

        response.sendRedirect("main.jsp");
    }
%>
