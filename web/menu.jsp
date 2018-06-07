
<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Modelo.Tabs.MarcacionTab"%>
<%@page import="Modelo.Tabs.MenuTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "menu.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Menú")) {
                acc = a;
            }
        }
        if (acc.isRpLeer()) {
            if (Ses.getAttribute("lisMen") != null) {
                if (Ses.getAttribute("lisMar") != null) {
                    List<MarcacionTab> lisMar = (List<MarcacionTab>) Ses.getAttribute("lisMar");


%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Menu</title>
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
            <h5>Menu</h5>

            <%
                List<MenuTab> LisM = (List<MenuTab>) Ses.getAttribute("lisM");
            %>
            <table class="centered striped responsive-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Orden</th>
                        <th>Portada</th>
                        <th>Superior</th>
                        <th>Longitud</th>
                        <th>Cauchos</th>
                        <th>Estado</th>
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
                    <% for (MenuTab mt : LisM) {%>
                    <tr>
                        <td><%=mt.getId()%></td>
                        <td><%=mt.getMarId()%></td>
                        <td><%=mt.getPortada()%></td>
                        <td><%=mt.getSuperior()%></td>
                        <td><%=mt.getLongitud()%></td>
                        <td><%=mt.getCauchos()%></td>
                        <td><%=mt.getDescripcion()%></td>

                        <td>
                            <label>
                                <input type="checkbox" <% if (mt.isEstado()) {%> checked="checked" <% }%> /> 
                                <span></span>
                            </label>
                        </td>

                        <%if (acc.isRpEditar()) {%>
                        <td>
                            <a href="#">
                                <i class="material-icons purple-text" onclick="consultar(<%=mt.getId()%>)" > edit </i>
                            </a>
                        </td>
                        <%}
                            if (acc.isRpEliminar()) {%>
                        <td>
                            <a href="#">
                                <i class="material-icons purple-text" onclick="msjConf(<%=mt.getId()%>)"> delete </i>
                            </a>
                        </td>
                    </tr>
                    <%}%>



                    <%}%>
                </tbody>
            </table>

            <div class="fixed-action-btn">
                <a class="btn-floating btn-large pink">
                    <i class="large material-icons">settings</i>
                </a>
                <ul>
                    <%if (acc.isRpNuevo()) {%>
                    <li><a href="#modalNuevo" class="btn-floating light-green tooltipped modal-trigger" data-position="left" data-tooltip="Nuevo Menu"><i class="material-icons">extension</i></a></li>
                    <li><a href="#" class="btn-floating light-pink tooltipped" data-position="left" data-tooltip="Subir xls"><i class="material-icons">attach_file</i></a></li>
                        <%}%>
                    <li><a href="paso.jsp" class="btn-floating purple tooltipped" data-position="left" data-tooltip="Usuarios"><i class="material-icons">extension</i></a></li>

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
        <%if (acc.isRpNuevo()) {%>
        <div id="modalNuevo" class="modal modal-fixed-footer">
            <form method="get" action="menus.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">assignment_ind</i> Nuevo Menu</h4>
                    <p>Registra la informacion del nuevo Menu</p>
                    <div class="row">
                        <div class="input-field col s4">
                            <select name="MarId">>
                                <option value="" disabled selected>Marcacion</option>
                                <%  for (MarcacionTab ml : lisMar) {%>
                                <option value="<%=ml.getMarId()%>"><%=ml.getMarNombre()%></option>
                                <%}%>
                            </select>
                            <label>Marcacion</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
                            <label for="Descripcion">Descripción</label>
                        </div>

                        <div class="input-field col s12">
                            <textarea id="Portada" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
                            <label for="Portada">Portada</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Superior" class="materialize-textarea" name="Superior" class="validate" required></textarea>
                            <label for="Superior">Superior</label>
                        </div> 
                        <div class="input-field col s12">
                            <textarea id="Longitud" class="materialize-textarea" name="Longitud" class="validate" required></textarea>
                            <label for="Longitud">Longitud</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Cauchos" class="materialize-textarea" name="Cauchos" class="validate" required></textarea>
                            <label for="Cauchos">Cauchos</label>
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

        <%}%>
        <!-- Modal Modificar Registro -->

        <%if (acc.isRpEditar()) {%>
        <%if (Ses.getAttribute("Me") != null) {
                MenuTab mS = (MenuTab) Ses.getAttribute("Menu");
        %>
        <div id="modalModificar" class="modal modal-fixed-footer">
            <form method="get" action="menus.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">assignment_ind</i> Nuevo Menu</h4>
                    <p>Registra la informacion del nuevo Menu</p>
                    <div class="row">
                        <div class="input-field col s4">
                            <input id="Nombre" type="text" name="Id" class="validate" required value="<%=mS.getId()%>" hidden>
                            <select name="MarId">>
                                <option value="" disabled >Marcacion</option>
                                <%  for (MarcacionTab ml : lisMar) {%>
                                <option value="<%=ml.getMarId()%>"  <%if (mS.getMarId() == ml.getMarId()) {%> selected <%}%> ><%=ml.getMarNombre()%> </option>
                                <%}%>
                            </select>
                            <label>Marcacion</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
                            <label for="Descripcion">Descripción</label>
                        </div>

                        <div class="input-field col s12">
                            <textarea id="Portada" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
                            <label for="Portada">Portada</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Superior" class="materialize-textarea" name="Superior" class="validate" required></textarea>
                            <label for="Superior">Superior</label>
                        </div> 
                        <div class="input-field col s12">
                            <textarea id="Longitud" class="materialize-textarea" name="Longitud" class="validate" required></textarea>
                            <label for="Longitud">Longitud</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Cauchos" class="materialize-textarea" name="Cauchos" class="validate" required></textarea>
                            <label for="Cauchos">Cauchos</label>
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
                <%}%>

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
                                                        window.location = 'menus.do?accion=Eliminar&Id=' + id;
                                                    }
                                                });
                                    }
                                    ;
                                    function consultar(id) {
                                        var url = 'menus.do';
                                        var form = $('<form action="' + url + '" method="Post">' +
                                                '<input type="text" name="id" value="' + id + '" hidden/>' +
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
        response.sendRedirect("marcacions.do?accion=Listar");
    }

    Ses.setAttribute("lisM", null);
    Ses.setAttribute("Me", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="menus.do" method="post" >
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