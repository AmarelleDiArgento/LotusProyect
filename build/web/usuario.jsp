
<%@page import="Modelo.Tabs.UsuarioTab"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "usuario.jsp";
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
        <title>Lotus QA - Usuario</title>
        <link rel="shortcut icon" href="img\favicon.png" type="image/x-icon"/>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link rel="stylesheet" href="sweetalert2.min.css">
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

            <% if (Ses.getAttribute("lisU") != null) {
                    List<UsuarioTab> LisU = (List<UsuarioTab>) Ses.getAttribute("lisU");

            %>
            <table class="centered striped">
                <thead>
                    <tr>
                        <th>Cedula</th>
                        <th>Nombre</th>
                        <th>Usuario</th>
                        <th>Ext.</th>
                        <th>Cel.</th>
                        <th>Email</th>
                        <th>Rol</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>

                <tbody>
                    <%                        for (UsuarioTab ut : LisU) {
                    %>
                    <tr>
                        <td><%=ut.getCedula()%></td>
                        <td><%=ut.toFullName()%></td>
                        <td><%=ut.getLoger()%></td>
                        <td><%=ut.getExtencion()%></td>
                        <td><%=ut.getTelefono()%></td>
                        <td><%=ut.getEmail()%></td>
                        <td><%=ut.getnRol()%></td>
                        <td><i class="material-icons">edit</i></td>
                        <td><i class="material-icons">delete</i></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%} else {
                    response.sendRedirect("usuarios.do?accion=Listar");
                }%>
            <div class="fixed-action-btn">
                <a class="btn-floating btn-large pink">
                    <i class="large material-icons">settings</i>
                </a>
                <ul>
                    <li><a href="#" class="btn-floating light-green tooltipped" data-position="left" data-tooltip="Nuevo Usuario"><i class="material-icons">person_add</i></a></li>
                    <li><a href="#" class="btn-floating light-pink tooltipped" data-position="left" data-tooltip="Subir xls"><i class="material-icons">attach_file</i></a></li>
                    <li><a href="rol.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Roles"><i class="material-icons">assignment_ind</i></a></li>

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
    <%@include file="Segmentos\scriptJs.jspf" %>
</html>
<%    } else {

        response.sendRedirect("index.jsp");
    }
%>
