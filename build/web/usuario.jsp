
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "usuario.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);

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

    </head>
    <body>
        <header>
            <%@include file="menu.jsp" %>
        </header>


        <div class="container">
            <h4>Usuario Mensaje:</h4>
            <%String msj = (String) Ses.getAttribute("msj");%>
            <p><%=msj%></p>
            <br>
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
                        LOTUS - ELITE FLOWER � 2017 Copyright Text
                    </p>
                </div>
            </div>
        </footer>

        <!--Scripts-->

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/init.js"></script>

        <script language="JavaScript" type="text/JavaScript">
            function msj(id) {
            swal({
            title: "Are you sure?",
            text: "Once deleted, you will not be able to recover this imaginary file!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
            })
            .then((willDelete) => {
            if (willDelete) {
            window.location = 'permisos.do?accion=Eliminar&Id=' + id;
            }
            });
            }
            ;
        </script>
    </body>
</html>
<%
    } else {

        response.sendRedirect("index.jsp");
    }
%>