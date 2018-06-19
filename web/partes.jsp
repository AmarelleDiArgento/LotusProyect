<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Modelo.Tabs.PartesTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "partes.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Parte")) {
                acc = a;
            }
        }
        if (acc.isRpLeer()) {
            if (Ses.getAttribute("lisPrt") != null) {


%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Partes</title>
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
            <h5>Partes</h5>


            <%
                List<PartesTab> LisPrt = (List<PartesTab>) Ses.getAttribute("lisPrt");
            %>
            <table class="centered striped responsive-table" id="tabla" >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                            <%if (acc.isRpEditar()) {%>
                        <th>Editar</th>
                            <%}
                                if (acc.isRpEliminar()) {%>

                        <th>Eliminar</th>
                            <%}%>
                    </tr>
                </thead>

                <tbody>
                    <% for (PartesTab at : LisPrt) {%>
                    <tr>
                        <td><%=at.getprtId()%></td>
                        <td><%=at.getPrtNombre()%></td>
                        <td><%=at.getPrtDescripcion()%></td>

                        <%if (acc.isRpEditar()) {%>
                        <td>
                            <a href="#">
                                <i class="material-icons purple-text" onclick="consultar(<%=at.getprtId()%>)" > edit </i>
                            </a>
                        </td>
                        <%}
                            if (acc.isRpEliminar()) {%>

                        <td>
                            <a href="#">
                                <i class="material-icons purple-text" onclick="msjConf(<%=at.getprtId()%>)"> delete </i>
                            </a>
                        </td>
                        <%}%>
                    </tr>

                    <%}%>
                </tbody>
            </table>

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

        <%if (acc.isRpNuevo()) {%>
        <div id="modalNuevo" class="modal modal-fixed-footer">
            <form method="get" action="partes.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">flip</i> Nueva Parte</h4>
                    <p>Registra la informacion de la nueva parte</p>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
                            <label for="Descripcion">Descripción</label>
                        </div>

                    </div>    
                </div>


                <div class="modal-footer">
                    <input name="accion" value="Registrar" type="submit" class="modal-action waves-effect waves-light btn-flat">
                </div>
            </form>
        </div>
        <%}%>

        <!-- Modal Modificar Registro -->

        <%if (acc.isRpNuevo()) {%>
        <%if (Ses.getAttribute("Prt") != null) {
                PartesTab pS = (PartesTab) Ses.getAttribute("Prt");
        %>
        <div id="modalModificar" class="modal modal-fixed-footer">
            <form method="get" action="partes.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">flip</i> Nueva Parte</h4>
                    <p>Registra la informacion de la nueva parte</p>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate" value="<%=pS.getPrtNombre()%>" required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required><%=pS.getPrtDescripcion()%></textarea>
                            <label for="Descripcion">Descripción</label>
                        </div>

                    </div>    
                </div>


                <div class="modal-footer">
                    <input name="accion" value="Registrar" type="submit" class="modal-action waves-effect waves-light btn-flat">
                </div>
            </form>
        </div>

        <%}%>
        <%}%>
        <!--Scripts-->
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/init.js"></script>
        <script type="text/javascript" src="js/sweetalert.min.js"></script>

        <script type="text/javascript">
                                    document.querySelector("#buscar").onkeyup = function () {
                                        $TableFilter("#tabla", this.value);
                                    }
                                    $TableFilter = function (id, value) {
                                        var rows = document.querySelectorAll(id + ' tbody tr');
                                        for (var i = 0; i < rows.length; i++) {
                                            var showRow = false;
                                            var row = rows[i];
                                            row.style.display = 'none';
                                            for (var x = 0; x < row.childElementCount; x++) {
                                                if (row.children[x].textContent.toLowerCase().indexOf(value.toLowerCase().trim()) > -1) {
                                                    showRow = true;
                                                    break;
                                                }
                                            }
                                            if (showRow) {
                                                row.style.display = null;
                                            }
                                        }
                                    };
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
                                                        window.location = 'partes.do?accion=Eliminar&Id=' + id;
                                                    }
                                                });
                                    }
                                    ;
                                    function consultar(id) {
                                        var url = 'partes.do';
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

    Ses.setAttribute("lisPrt", null);
    Ses.setAttribute("Prt", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="partes.do" method="post" >
            <input name="accion" value="Listar" hidden/>
        </form>
    </body>
</html>
<%

            }

        } else {

            response.sendRedirect("main.jsp");
        }
    } else {

        response.sendRedirect("index.jsp");
    }
%>
