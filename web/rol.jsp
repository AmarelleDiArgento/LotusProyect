
<%@page import="Modelo.Tabs.RolTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="Modelo.Tabs.UsuarioTab"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "rol.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = new Mensajes();

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        if (Ses.getAttribute("lisR") != null) {


%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Rol</title>
        <link rel="shortcut icon" href="img/favicon" type="image/x-icon"/>

        <!-- CSS  -->
        <link href="css/material-icons.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>



    <%        if (Ses.getAttribute("msj") != null) {
            msj = (Mensajes) Ses.getAttribute("msj");
            out.println(msj.toBody());

        } else {%><body><%}%>


        <header>
            <%@include file="Segmentos\menu.jspf" %>
        </header>


        <div class="container">

            <%
                List<RolTab> LisR = (List<RolTab>) Ses.getAttribute("lisR");
            %>
            <table class="centered striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Detalles</th>
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
                        <td>
                            <form action="usuarios.do" method="post">
                                <input type="text" name="accion" value="Obtener" hidden />
                                <input type="text" name="Id" value="<%=rt.getRolId()%>" hidden />
                                <a><input type="submit" class="waves-effect waves-blue material-icons" value="edit"></a>
                            </form>
                        </td>
                        <td><a href="#"><i class="material-icons purple-text" onclick="msjConf(<%=rt.getRolId()%>)">delete</i></a></td>

                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%

            %> 
            <div class="fixed-action-btn">
                <a class="btn-floating btn-large pink">
                    <i class="large material-icons">settings</i>
                </a>
                <ul>
                    <li><a href="#modalNuevo" class="btn-floating light-green tooltipped modal-trigger" data-position="left" data-tooltip="Nuevo Usuario"><i class="material-icons">person_add</i></a></li>
                    <li><a href="#" class="btn-floating light-pink tooltipped" data-position="left" data-tooltip="Subir xls"><i class="material-icons">attach_file</i></a></li>
                    <li><a href="rol.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Roles"><i class="material-icons">assignment_ind</i></a></li>

                </ul>
            </div>
        </div>


        <a href="#">  <i class="material-icons" onclick="modalMod();">edit</i></a>

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
    <!-- Modal Insertar Nuevo registro -->
    <div id="modalNuevo" class="modal modal-fixed-footer">
        <form method="get" action="rols.do">
            <div class="modal-content">
                <h4><i class="material-icons medium">face</i> Nuevo Rol</h4>
                <p>Registra la informacion del nuevo Ro</p>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="Nombre" type="text" name="Nombre" class="validate">
                        <label for="Nombre">Nombre</label>
                    </div>
                    <div class="input-field col s12">
                        <textarea id="Descripcion" class="materialize-textarea" placeholder="Escriba una breve descripcion de este rol" name="Descripcion"></textarea>
                        <label for="Descripcion">Descripción</label>
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


    <!-- Modal Insertar Nuevo registro -->
    <%if (Ses.getAttribute("Rol") != null) {
            RolTab rO = (RolTab) Ses.getAttribute("Rol");

    %>
    <div id="modalModificar" class="modal modal-fixed-footer">
        <form method="get" action="rols.do">
            <div class="modal-content">
                <h4><i class="material-icons medium">face</i> Modificar Rol</h4>
                <p>Modifica la informacion del rol</p>
                <div class="row">
                    <div class="input-field col s6">
                        <input id="Id" type="text" name="Id" value="<%=rO.getRolId()%>" class="validate">
                        <label for="Id">Id</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="Nombre" type="text" name="Nombre" value="<%=rO.getRolNombre()%>" class="validate">
                        <label for="Nombre">Nombre</label>
                    </div>
                    <div class="input-field col s12">
                        <textarea id="Descripcion" class="materialize-textarea" placeholder="Escriba una breve descripcion de este rol" name="Descripcion" value="<%=rO.getRolDescripcion()%>"></textarea>
                        <label for="Descripcion">Descripción</label>
                    </div>
                    <div class="switch">
                        <label>
                            Inactivo
                            <input type="checkbox" <%if (rO.isRolEstado()) {%>checked<%}%> name="Estado">
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
    <%}%>
    <!--Scripts-->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script type="text/javascript" src="js/init.js"></script>
    <script type="text/javascript" src="js/sweetalert.min.js"></script>
    <script type="text/javascript">
            $(document).ready(function () {
                $('#modal').modal();
                $('#modal').modal('open');
            });
            function modalMod() {
                $('#modalModificar').modal('open');
            }
            ;
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

        <%if (Ses.getAttribute("msj") != null) {%>
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
        <%}
            }%>
    </script>

</html>
<%    } else {
            response.sendRedirect("rols.do?accion=Listar");
        }
        Ses.setAttribute("msj", null);
        Ses.setAttribute("lisR", null);
//        Ses.setAttribute("Usu", null);
    } else {

        response.sendRedirect("index.jsp");
    }
%>
