
<%@page import="Servicios.Mensajes"%>
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
        if (Ses.getAttribute("lisU") != null) {


%>
<html lang="es" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Usuario</title>
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

            <%
                List<UsuarioTab> LisU = (List<UsuarioTab>) Ses.getAttribute("lisU");
            %>
            <table class="centered striped">
                <thead>
                    <tr>
                        <th>Avatar</th>
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
                        <td><div class="user-view">
                                <a href="#">
                                    <img class="circle" style="height: 3.5rem; width: 3.5rem" src="img\<%=ut.getAvatar()%>">
                                </a>
                            </div>
                        </td>
                        <td><%=ut.getCedula()%></td>
                        <td><%=ut.toFullName()%></td>
                        <td><%=ut.getLoger()%></td>
                        <td><%=ut.getExtencion()%></td>
                        <td><%=ut.getTelefono()%></td>
                        <td><%=ut.getEmail()%></td>
                        <td><%=ut.getnRol()%></td>
                        <td>
                            <a href="#">
                                <i class="material-icons purple-text" onclick="consultar(<%=ut.getCedula()%>)">edit</i>
                            </a>
                        </td>
                        <td>
                            <a href="#">
                                <i class="material-icons purple-text" onclick="msjConf(<%=ut.getCedula()%>)">delete</i>
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
                    <li><a href="#modalNuevo" class="btn-floating light-green tooltipped modal-trigger" data-position="left" data-tooltip="Nuevo Usuario"><i class="material-icons">person_add</i></a></li>
                    <li><a href="#" class="btn-floating light-pink tooltipped" data-position="left" data-tooltip="Subir xls"><i class="material-icons">attach_file</i></a></li>
                    <li><a href="rol.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Roles"><i class="material-icons">assignment_ind</i></a></li>
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
            <form method="post" action="usuarios.do" enctype="multipart/form-data">
                

            
                
                <div class="modal-content">
                    <h4><i class="material-icons medium">face</i> Nuevo Usuario</h4>
                    <p>Registra la informacion del nuevo usuario</p>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="Cedula" type="text" name="Cedula" class="validate">
                            <label for="Cedula">Cedula</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="Apellido" type="text" name="Apellido" class="validate">
                            <label for="Apellido">Apellido</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="Usuario" type="text" name="Usuario" class="validate">
                            <label for="Usuario">Usuario</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="Password" type="Password" name="Password" class="validate">
                            <label for="Password">Password</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="Extencion" type="text" name="Extencion" pattern="[0-9]{4}" maxlength="4" class="validate">
                            <label for="Extencion">Extencion</label>
                            <span class="helper-text" data-error="Digita un extencion valida" data-success="right"></span>
                        </div>
                        <div class="input-field col s6">
                            <input id="Celular" type="tel" pattern="^[|3]\d{9}$" name="Celular" class="validate">
                            <label for="Celular">Celular</label>
                            <span class="helper-text" data-error="Digita un numero de corporativo valido" data-success="right"></span>
                        </div>
                        <div class="input-field col s6">
                            <input id="Email" type="Email" name="Email" class="validate">
                            <label for="Email">Email</label>
                        </div>
                        <div class="file-field input-field">
                            <div class="btn">
                                <span>Avatar</span>
                                <input type="file" name="imagen" accept="image/*">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>
                        </div>
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


                <div class="modal-footer">
                    <input name="accion" value="Registrar" type="submit" class="modal-action waves-effect waves-light btn-flat">
                </div>
            </form>
        </div>


        <!-- Modal Modificar Registro -->
        <%if (Ses.getAttribute("Usu") != null) {
                UsuarioTab uS = (UsuarioTab) Ses.getAttribute("Usu");
        %>
        <div id="modalModificar" class="modal modal-fixed-footer">
            <form method="get" action="usuarios.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">face</i> Modificar Usuario</h4>
                    <p>Modifica la informacion del usuario</p>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="CedulaM" type="text" name="Cedula" class="validate" value="<%=uS.getCedula()%>">
                            <label for="CedulaM">Cedula</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="NombreM" type="text" name="Nombre" class="validate" value="<%=uS.getNombre()%>">
                            <label for="NombreM">Nombre</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="ApellidoM" type="text" name="Apellido" class="validate" value="<%=uS.getApellido()%>">
                            <label for="ApellidoM">Apellido</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="UsuarioM" type="text" name="Usuario" class="validate" value="<%=uS.getLoger()%>">
                            <label for="UsuarioM">Usuario</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="PasswordM" type="Password" name="Password" class="validate"value="<%=uS.getPassword()%>">
                            <label for="PasswordM">Password</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="ExtencionM" type="text" name="Extencion" pattern="[0-9]{4}" maxlength="4" class="validate" value="<%=uS.getExtencion()%>">
                            <label for="ExtencionM">Extencion</label>
                            <span class="helper-text" data-error="Digita un extencion valida" data-success="right"></span>
                        </div>
                        <div class="input-field col s6">
                            <input id="CelularM" type="tel" pattern="^[|3]\d{9}$" name="Celular" class="validate" value="<%=uS.getTelefono()%>">
                            <label for="CelularM">Celular</label>
                            <span class="helper-text" data-error="Digita un numero de corporativo valido" data-success="right"></span>
                        </div>
                        <div class="input-field col s6">
                            <input id="EmailM" type="Email" name="Email" class="validate" value="<%=uS.getEmail()%>">
                            <label for="EmailM">Email</label>
                        </div>
                        <div class="switch">
                            <label>
                                Inactivo
                                <input type="checkbox" <%if (uS.getEstado()) {%>checked<%}%> name="Estado">
                                <span class="lever"></span>
                                Activo
                            </label>
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
                                                        window.location = 'usuarios.do?accion=Eliminar&Id=' + id;
                                                    }
                                                });
                                    }
                                    ;
                                    function consultar(id) {
                                        var url = 'usuarios.do';
                                        var form = $('<form action="' + url + '" method="get">' +
                                                '<input type="text" name="Cedula" value="' + id + '" hidden/>' +
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

    Ses.setAttribute("lisU", null);
    Ses.setAttribute("Usu", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="usuarios.do" method="post" >
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
