
<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Modelo.Tabs.ProductoTab"%>
<%@page import="Modelo.Tabs.VariedadTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "variedad.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Variedad")) {
                acc = a;
            }
        }
        if (acc.isRpLeer()) {
            if (Ses.getAttribute("lisV") != null) {
                if (Ses.getAttribute("lisPro") != null) {
                    List<ProductoTab> LisPro = (List<ProductoTab>) Ses.getAttribute("lisPro");


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
            <h5>Variedad</h5>

            <%
                List<VariedadTab> LisV = (List<VariedadTab>) Ses.getAttribute("lisV");
            %>
            <table class="centered striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Producto</th>
                        <th>Variedad</th>
                        <th>Color</th>
                        <th>Imagen</th>
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
                    <% for (VariedadTab vt : LisV) {%>
                    <tr>
                        <td><%=vt.getVarId()%></td>
                        <td><%=vt.getProNombre()%></td>
                        <td><%=vt.getVarNombre()%></td>
                        <td><%=vt.getVarColor()%></td>
                        <td>
                            <div class="user-view">
                                <a href="#">
                                    <img class="circle materialboxed" style="height: 3.5rem; width: 3.5rem" src="<%if (vt.getVarImagen() != null) {
                                            out.println(vt.getVarImagen());
                                        } else {
                                            out.println("img/en proceso.png");

                                        }%>">
                                </a>
                            </div>
                        </td>
                        <td>
                            <a href="#">
                                <i class="material-icons medium<% if (vt.isVarEstado()) {%> green-text <% } else { %> brown-text text-lighten-5 <%}%>"> settings_power</i>
                            </a>
                        </td>
                        <%if (acc.isRpEditar()) {%>
                        <td>
                            <a href="#">
                                <i class="material-icons medium purple-text" onclick="consultar(<%=vt.getVarId()%>)" > edit </i>
                            </a>
                        </td>
                        <%}
                                if (acc.isRpEliminar()) {%>

                        <td>
                            <a href="#">
                                <i class="material-icons medium purple-text" onclick="msjConf(<%=vt.getVarId()%>)"> delete </i>
                            </a>
                        </td>
                        <%}%>


                    </tr>

                    <%}%>
                </tbody>
            </table>

            <div class="fixed-action-btn">
                <a class="btn-floating btn-large pink">
                    <i class="large material-icons">settings</i>
                </a>
                <ul>
                    <li><a href="#modalNuevo" class="btn-floating light-green tooltipped modal-trigger" data-position="left" data-tooltip="Nueva Variedad"><i class="material-icons">filter_vintage</i></a></li>
                    <li><a href="#" class="btn-floating light-pink tooltipped" data-position="left" data-tooltip="Subir xls"><i class="material-icons">attach_file</i></a></li>
                    <li><a href="producto.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Producto"><i class="material-icons">local_florist</i></a></li>

                    <li><a href="maestro.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Producto maestro"><i class="material-icons">vpn_key</i></a></li>
                    <li><a href="parametros.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Parametros"><i class="material-icons">tune</i></a></li>
                    <li><a href="grados.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Grados"><i class="material-icons">blur_linear</i></a></li>
                    <li><a href="fitosanidad.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Fitosanidad"><i class="material-icons">bug_report</i></a></li>
                    <li><a href="partes.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Partes"><i class="material-icons">flip</i></a></li>
                    <li><a href="variedad.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Variedades"><i class="material-icons">filter_vintage</i></a></li>

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
            <form method="get" action="variedads.do" enctype="multipart/form-data">
                <div class="modal-content">
                    <h4><i class="material-icons medium">filter_vintage</i> Nueva Variedad</h4>
                    <p>Registra la informacion de la nueva Variedad</p>
                    <div class="row">
                        <div class="input-field col s4">
                            <select name="ProId">>
                                <option value="" disabled selected>Producto</option>
                                <%                        for (ProductoTab pl : LisPro) {%>
                                <option value="<%=pl.getProId()%>"><%=pl.getProNombre()%></option>
                                <%}%>
                            </select>
                            <label>Producto</label>
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
        <%if (Ses.getAttribute("Var") != null) {
                VariedadTab vS = (VariedadTab) Ses.getAttribute("Var");
        %>
        <div id="modalModificar" class="modal modal-fixed-footer">
            <form method="get" action="variedads.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">filter_vintage</i> Nueva Variedad</h4>
                    <p>Registra la informacion lo cambios de la Variedad</p>
                    <div class="row">
                        <div class="input-field col s4">
                            <input id="Nombre" type="text" name="Id" class="validate" required value="<%=vS.getVarId()%>" hidden>
                            <select name="ProId">>
                                <option value="" disabled >Producto</option>
                                <%                        for (ProductoTab pl : LisPro) {%>
                                <option value="<%=pl.getProId()%>"  <%if (vS.getProId() == pl.getProId()) {%> selected <%}%> ><%=pl.getProNombre()%> </option>
                                <%}%>
                            </select>
                            <label>Producto</label>
                        </div>
                        <div class="input-field col s4">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required value="<%=vS.getVarNombre()%>">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s4">
                            <i class="material-icons prefix">color_lens</i>
                            <input type="text" id="Color" name="Color" class="autocomplete" value="<%=vS.getVarColor()%>">
                            <label for="Color">Color</label>
                        </div>
                        <div class="input-field col s4">
                            <input id="Tipo" type="text" name="Tipo" class="validate" required="">
                            <label for="Tipo">Tipo</label>
                        </div>

                        <div class="file-field input-field col s3">

                            <i class="material-icons prefix">image</i>
                            <input type="file" name="image">
                            <input class="file-path validate" name ="Archivo" type="text">

                        </div>
                        <div class="switch center col s4">
                            <label>
                                Inactivo
                                <input type="checkbox" name="Estado"  <%if (vS.isVarEstado()) {%> checked <%}%>>
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
                                                        window.location = 'variedads.do?accion=Eliminar&Id=' + id;
                                                    }
                                                });
                                    }
                                    ;
                                    function consultar(id) {
                                        var url = 'variedads.do';
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



                                    $(document).ready(function () {
                                        $('input.autocomplete').autocomplete({
                                            data: {
                                                "Bicolors": null,
                                                "Bicolor Burgundy Yellow": null,
                                                "Bicolor Cream Pink": null,
                                                "Bicolor Cream Purple": null,
                                                "Bicolor Cream Red": null,
                                                "Bicolor Lavender - Purple": null,
                                                "Bicolor Lavender - White": null,
                                                "Bicolor Lavender Green": null,
                                                "Bicolor Orange": null,
                                                "Bicolor Orange - Red": null,
                                                "Bicolor Orange - Yellow": null,
                                                "Bicolor Orange Hot Pink": null,
                                                "Bicolor Peach - Orange": null,
                                                "Bicolor Peach Pink": null,
                                                "Bicolor Pink": null,
                                                "Bicolor Pink - Hot Pink": null,
                                                "Bicolor Pink - White": null,
                                                "Bicolor Pink Purple": null,
                                                "Bicolor Pink White": null,
                                                "Bicolor Purple": null,
                                                "Bicolor Purple - Pink": null,
                                                "Bicolor Purple - White": null,
                                                "Bicolor Purple Pink": null,
                                                "Bicolor Red - Orange": null,
                                                "Bicolor Red - White": null,
                                                "Bicolor Red Cream": null,
                                                "Bicolor White - Green": null,
                                                "Bicolor White - Lavender": null,
                                                "Bicolor White - Pink": null,
                                                "Bicolor White - Purple": null,
                                                "Bicolor White Hot Pink": null,
                                                "Bicolor White Pink": null,
                                                "Bicolor White Purple": null,
                                                "Bicolor White Red": null,
                                                "Bicolor Yellow": null,
                                                "Bicolor Yellow - Orange": null,
                                                "Bicolor Yellow - Red": null,
                                                "Bicolor Yellow Pink": null,
                                                "Bicolor Yellow-Red": null,
                                                "Blue": null,
                                                "Bronze": null,
                                                "Burgundy": null,
                                                "Cream": null,
                                                "Dark Pink": null,
                                                "Green": null,
                                                "Hot Pink": null,
                                                "Lavender": null,
                                                "Light Blue": null,
                                                "Light Pink": null,
                                                "Medium Pink": null,
                                                "Old": null,
                                                "Orange": null,
                                                "Peach": null,
                                                "Pepermint": null,
                                                "Pink": null,
                                                "Purple": null,
                                                "Red": null,
                                                "White": null,
                                                "Yellow": null

                                            },
                                        });
                                    });

        </script>
    </body>
</html>
<%

    } else {
        response.sendRedirect("productos.do?accion=Listar");
    }
    Ses.setAttribute("lisPro", null);
    Ses.setAttribute("lisV", null);
    Ses.setAttribute("Var", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="variedads.do" method="post" >
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
