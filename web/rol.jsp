<%@page import="Modelo.Tabs.RolTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "rol.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        if (Ses.getAttribute("lisR") != null) {
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Rol</title>
        <link rel="shortcut icon" href="img\favicon.png" type="image/x-icon"/>

        <!-- CSS  -->
        <link href="css/material-icons.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
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


        <div class="container">
            <h5>Rol</h5>


            <%
                List<RolTab> LisR = (List<RolTab>) Ses.getAttribute("lisR");
            %>
            <table class="centered striped responsive-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Detalles</th>
                        <th>Estado</th>
                        <th>Configurar</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>

                <tbody>
                    <% for (RolTab rt : LisR) {%>
                    <tr>
                        <td><%=rt.getRolId()%></td>
                        <td><%=rt.getRolNombre()%></td>
                        <td><%=rt.getRolDescripcion()%></td>
                        <td>
                            <a href="#">
                                <i class="material-icons medium<% if (rt.isRolEstado()) {%> green-text <% } else { %> brown-text text-lighten-5 <%}%>"> settings_power</i>
                            </a>
                        </td>
                        <td>
                            <a href="asignaper.jsp?Rol=<%=rt.getRolId()%>">
                                <i class="material-icons small purple-text"> settings_applications</i>
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <i class="material-icons small purple-text" onclick="consultar(<%=rt.getRolId()%>)" > edit </i>

                        </td>
                        <td>
                            <a href="#">
                                <i class="material-icons small purple-text" onclick="msjConf(<%=rt.getRolId()%>)"> delete </i>
                            </a>
                        </td>
                    </tr>

                    <%}%>
                </tbody>
            </table>

            <div class="fixed-action-btn">
                <a class="btn-floating btn-large pink">
                    <i class="large material-icons">settings</i>
                </a>
                <ul>
                    <li><a href="#modalNuevo" class="btn-floating light-green tooltipped modal-trigger" data-position="left" data-tooltip="Nuevo Rol"><i class="material-icons">assignment_ind</i></a></li>
                    <li><a href="#" class="btn-floating light-pink tooltipped" data-position="left" data-tooltip="Subir xls"><i class="material-icons">attach_file</i></a></li>
                    <li><a href="usuario.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Usuarios"><i class="material-icons">face</i></a></li>
                    <li><a href="permiso.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Permisos"><i class="material-icons">developer_board</i></a></li>

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


        <!-- Modal Insertar Nuevo registro -->
        <div id="modalNuevo" class="modal modal-fixed-footer">
            <form method="get" action="rols.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">assignment_ind</i> Nuevo Rol</h4>
                    <p>Registra la informacion del nuevo rol</p>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
                            <label for="Descripcion">Descripción</label>
                        </div>
                        <div class="input-field col s4 center">
                            <div class="switch">
                                <label>
                                    Inactivo
                                    <input type="checkbox" name="Estado">
                                    <span class="lever"></span>
                                    Activo
                                </label>
                            </div>
                        </div>

                    </div>    
                </div>


                <div class="modal-footer">
                    <input name="accion" value="Registrar" type="submit" class="modal-action waves-effect waves-light btn-flat">
                </div>
            </form>
        </div>


        <!-- Modal Modificar Registro -->
        <%if (Ses.getAttribute("Rol") != null) {
                RolTab rS = (RolTab) Ses.getAttribute("Rol");
        %>
        <div id="modalModificar" class="modal modal-fixed-footer">
            <form method="get" action="rols.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">assignment_ind</i> Nuevo Rol</h4>
                    <p>Registra la informacion del nuevo rol</p>
                    <div class="row">
                        <div class="input-field col s6" hidden>
                            <input id="Id" type="text" name="Id" class="validate" value="<%=rS.getRolId()%>"required="">
                            <label for="Id">Id</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate" value="<%=rS.getRolNombre()%>"required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required><%=rS.getRolDescripcion()%></textarea>
                            <label for="Descripcion">Descripción</label>
                        </div>
                        <div class="input-field col s4 center">
                            <div class="switch">
                                <label>
                                    Inactivo
                                    <input type="checkbox" <%if (rS.isRolEstado()) {%>checked<%}%> name="Estado">
                                    <span class="lever"></span>
                                    Activo
                                </label>
                            </div>
                        </div>

                    </div>    
                </div>


                <div class="modal-footer">
                    <input name="accion" value="Modificar" type="submit" class="modal-action waves-effect waves-light btn-flat">
                </div>
            </form>
        </div>



        <%}%>
        <!--Scripts-->
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/init.js"></script>
        <script type="text/javascript" src="js/sweetalert.min.js"></script>

        <script type="text/javascript">
                                    function modalMod() {

                                        var elem = document.querySelector('#modalModificar');
                                        var instance = M.Modal.init(elem);
                                        instance.open();
                                    }
                                    ;
                                    function msjConf(id) {
                                        swal({
                                            title: "¿Estas seguro?",
                                            text: "Se eliminara el registro con el ID: " + id,
                                            icon: "warning",
                                            buttons: true,
                                            dangerMode: true
                                        })
                                                .then((willDelete) => {
                                                    if (willDelete) {
                                                        window.location = 'rols.do?accion=Eliminar&Id=' + id;
                                                    }
                                                });
                                    }
                                    ;
                                    function consultar(id) {
                                        var url = 'rols.do';
                                        var form = $('<form action="' + url + '" method="Post">' +
                                                '<input type="text" name="Id" value="' + id + '" hidden/>' +
                                                '<input type="text" name="accion" value="Obtener" hidden/>' +
                                                '</form>');
                                        $('body').append(form);
                                        (form).submit();
                                    }
            <% if (msj != null) {%>

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
                                            title: "<%=msj.getMsj()%>",
                                            text: "<%=msj.getDetalles()%>",
                                            icon: "success"
                                        });
                                    }
                                    ;
            <%}
                }%>

        </script>
    </body>
</html>
<%

    Ses.setAttribute("lisR", null);
    Ses.setAttribute("Rol", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="rols.do" method="post" >
            <input name="accion" value="Listar" hidden/>
        </form>
    </body>
</html>
<%

        }

    } else {

        response.sendRedirect("index.jsp");
    }
%>
