
<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Modelo.Tabs.ProductoTab"%>
<%@page import="Modelo.Tabs.ClienteTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "cliente.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Cliente")) {
                acc = a;
            }
        }
        if (acc.isRpLeer()) {
            if (Ses.getAttribute("lisC") != null) {
                if (Ses.getAttribute("lisU") != null) {
                    List<UsuarioTab> LisUsc = (List<UsuarioTab>) Ses.getAttribute("lisU");


%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Variedad</title>
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
            <h5>Cliente</h5>

            <%
                List<ClienteTab> LisC = (List<ClienteTab>) Ses.getAttribute("lisC");
            %>
            <table class="centered striped responsive-table" id="tabla" >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cliente</th>
                        <th>Comercial</th>
                        <th>Localización</th>
                        <th>Logo</th>
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
                    <% for (ClienteTab ct : LisC) {%>
                    <tr>
                        <td><%=ct.getId()%></td>
                        <td><%=ct.getNombre()%></td>
                        <td><%=ct.getNombreUsu()%></td>
                        <td><%=ct.getLocal()%></td>
                        <td>
                            <div class="user-view">
                                <a href="#">
                                    <img class="circle materialboxed" style="height: 3.5rem; width: 3.5rem" src="<%if (ct.getLogo() != null) {
                                            out.println(ct.getLogo());
                                        } else {
                                            out.println("img/en proceso.png");

                                        }%>">
                                </a>
                            </div>
                        </td>
                        <td>
                            <a href="#">
                                <i class="material-icons medium<% if (ct.isEstado()) {%> green-text <% } else { %> brown-text text-lighten-5 <%}%>"> settings_power</i>
                            </a>
                        </td>
                        <%if (acc.isRpEditar()) {%>
                        <td>
                            <a href="#">
                                <i class="material-icons medium purple-text" onclick="consultar(<%=ct.getId()%>)" > edit </i>
                            </a>
                        </td>
                        <%}
                            if (acc.isRpEliminar()) {%>

                        <td>
                            <a href="#">
                                <i class="material-icons medium purple-text" onclick="msjConf(<%=ct.getId()%>)"> delete </i>
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
        <div id="modalNuevo" class="modal modal-fixed-footer">
            <form method="get" action="variedads.do" enctype="multipart/form-data">
                <div class="modal-content">
                    <h4><i class="material-icons medium">filter_vintage</i> Nueva Variedad</h4>
                    <p>Registra la informacion de la nueva Variedad</p>
                    <div class="row">
                        <div class="input-field col s4">
                            <select name="UsuId">>
                                <option value="" disabled selected>Comercial</option>
                                <%                        for (UsuarioTab ul : LisUsc) {%>
                                <option value="<%=ul.getCedula()%>"><%=ul.toFullName()%></option>
                                <%}%>
                            </select>
                            <label>Comercial</label>
                        </div>
                        <div class="input-field col s4">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s4">
                            <i class="material-icons prefix">color_lens</i>
                            <input type="text" id="Color" name="Color" class="autocomplete">
                            <label for="Color">Color</label>
                        </div>
                        <div class="file-field input-field col s3">

                            <i class="material-icons prefix">image</i>
                            <input type="file" name="image">
                            <input class="file-path validate" name ="Archivo" type="text">

                        </div>
                        <div class="switch center col s4">
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
        <%if (Ses.getAttribute("Cli") != null) {
                ClienteTab cS = (ClienteTab) Ses.getAttribute("Cli");
        %>
        <div id="modalModificar" class="modal modal-fixed-footer">
            <form method="get" action="variedads.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">filter_vintage</i> Nueva Variedad</h4>
                    <p>Registra la informacion lo cambios de la Variedad</p>
                    <div class="row">

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
                                                        window.location = 'clientes.do?accion=Eliminar&Id=' + id;
                                                    }
                                                });
                                    }
                                    ;
                                    function consultar(id) {
                                        var url = 'clientes.do';
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
        response.sendRedirect("usuarios.do?accion=Listar");
    }
    Ses.setAttribute("lisU", null);
    Ses.setAttribute("lisC", null);
    Ses.setAttribute("Cli", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="clientes.do" method="post" >
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
