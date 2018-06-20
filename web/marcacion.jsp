<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Modelo.Tabs.ArmadoTab"%>
<%@page import="Modelo.Tabs.MarcacionTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "marcacion.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Marcación")) {
                acc = a;
            }
        }
        if (acc.isRpLeer()) {
            if (Ses.getAttribute("lisMar") != null) {
                if (Ses.getAttribute("lisA") != null) {
                    List<ArmadoTab> lisA = (List<ArmadoTab>) Ses.getAttribute("lisA");


%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Marcacion</title>
        <link rel="shortcut icon" href="img\favicon.png" type="image/x-icon"/>

        <!-- CSS  -->
        <link href="css/material-icons.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>


        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">
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
            <h5>Marcacion</h5>


            <%
                List<MarcacionTab> lisMar = (List<MarcacionTab>) Ses.getAttribute("lisMar");
            %>
            <table class="centered striped responsive-table" id="tabla" >
                <thead>
                    <tr>
                        <th>Portada</th>
                        <th>ID</th>
                        <th>Cliente</th>
                        <th>Nombre</th>
                        <th>Armado</th>
                        <th>Estado</th>
                            <%if (acc.isRpEditar()) {%>
                        <th>Editar</th>
                            <%}
                                if (acc.isRpEliminar()) {%>

                        <th>Eliminar</th>
                            <%}%>
                    </tr>
                </thead>

                <tbody>
                    <% for (MarcacionTab mt : lisMar) {%>
                    <tr>
                        <td><%=mt.getMarPortada()%></td>
                        <td><%=mt.getMarId()%></td>
                        <td><%=mt.getCliNombre()%></td>
                        <td><%=mt.getMarNombre()%></td>
                        <td><%=mt.getArmNombre()%></td>
                        <td>
                            <a href="#"> 
                                <i class="material-icons medium<% if (mt.isMarEstado()) {%> green-text <% } else { %> brown-text text-lighten-5 <%}%>"> settings_power</i>
                            </a>
                        </td>
                        <%if (acc.isRpEditar()) {%>
                        <td>
                            <a href="#">
                                <i class="material-icons small purple-text" onclick="consultar(<%=mt.getMarId()%>)" > edit </i>
                            </a>
                        </td>
                        <%}
                            if (acc.isRpEliminar()) {%>
                        
                        <td>
                            <a href="#">
                                <i class="material-icons small purple-text" onclick="msjConf(<%=mt.getMarId()%>)"> delete </i>
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
            <form method="post" action="marcacions.do" enctype="multipart/form-data">
                <div class="modal-content">
                    <h4><i class="material-icons medium">local_offer</i> Nueva marcacion</h4>
                    <p>Registra la informacion de la nueva marcacion</p>
                    <div class="row">

                        <div class="input-field col s4">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>

                        <div class="file-field input-field col s3">
                            <i class="material-icons prefix">image</i>
                            <input type="file" name="Portada">
                            <input class="file-path validate" name ="Archivo" type="text">
                        </div>

                        <div class="input-field col s4">
                            <select name="ArmId">>
                                <option value="" disabled selected>Armado</option>
                                <%                        for (ArmadoTab pl : lisA) {%>
                                <option value="<%=pl.getArmId()%>"><%=pl.getArmNombre()%></option>
                                <%}%>
                            </select>
                            <label>Armado</label>
                        </div>

                        <div class="input-field col s4">
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
        <%}%>

        <!-- Modal Modificar Registro -->
        <%if (acc.isRpEditar()) {%>
        <%if (Ses.getAttribute("Mar") != null) {
                MarcacionTab mS = (MarcacionTab) Ses.getAttribute("Mar");
        %>
        <div id="modalModificar" class="modal modal-fixed-footer">
            <form method="get" action="marcacions.do" enctype="multipart/form-data">
                <div class="modal-content">
                    <h4><i class="material-icons medium">assignment_ind</i> Nueva marcacion</h4>
                    <p>Registra la informacion de la nueva marcacion</p>

                    <div class="row">

                        <div class="input-field col s4">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>

                        <div class="file-field input-field col s3">
                            <i class="material-icons prefix">image</i>
                            <input type="file" name="image">
                            <input class="file-path validate" name ="Archivo" type="text">
                        </div>

                        <div class="input-field col s4">
                            <select name="ArmId">>
                                <option value="" disabled selected>Armado</option>
                                <%                        for (ArmadoTab pl : lisA) {%>
                                <option value="<%=pl.getArmId()%>"><%=pl.getArmNombre()%></option>
                                <%}%>
                            </select>
                            <label>Armado</label>
                        </div>

                        <div class="input-field col s4">
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
                    <input name="accion" value="Modificar" type="submit" class="modal-action waves-effect waves-light btn-flat">
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
                                            title: "ï¿½Estas seguro?",
                                            text: "Se eliminara el registro con el ID: " + id,
                                            icon: "warning",
                                            buttons: true,
                                            dangerMode: true
                                        })
                                                .then((willDelete) => {
                                                    if (willDelete) {
                                                        window.location = 'marcacions.do?accion=Eliminar&Id=' + id;
                                                    }
                                                });
                                    }
                                    ;
                                    function consultar(id) {
                                        var url = 'marcacions.do';
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
    } else {
        response.sendRedirect("armados.do?accion=Listar");
    }
    Ses.setAttribute("lisMar", null);
    Ses.setAttribute("Mar", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="marcacions.do" method="post" >
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
