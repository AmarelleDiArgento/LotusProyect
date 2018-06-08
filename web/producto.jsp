<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Modelo.Tabs.ProductoTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "producto.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Producto")) {
                acc = a;
            }
        }
        if (acc.isRpLeer()) {
            if (Ses.getAttribute("lisPro") != null) {
                if (Ses.getAttribute("lisMae") != null) {

%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Producto</title>
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


        <div class="">

            <%
                List<ProductoTab> LisPr = (List<ProductoTab>) Ses.getAttribute("lisPro");
            %>

            <!-- <div class="carousel">
            <%     for (ProductoTab pc : LisPr) {%>
             
            <a class="carousel-item" href="#one!"><img src="<%=pc.getProImagen()%>"></a>

            <%}%>
        </div> -->

            <div class="carousel carousel-slider center">
                <%     for (ProductoTab pc : LisPr) {%>
                <div class="carousel-item white black-text" href="#two!">
                    <h1 class="carousel-fixed-item left"><%=pc.getProNombre()%></h1>
                    <img style="width: auto;height: 100%;" src="<%=pc.getProImagen()%>">

                    <%if (acc.isRpEditar()) {%>
                    <a class="btn-floating btn-session waves-effect waves-light grey text-lighten-4 z-depth-0" style="bottom: 2rem"><i class="material-icons" onclick="consultar(<%=pc.getProId()%>)">image</i></a>
                    <%}%>
                </div>
                <%}%>
            </div>
            <!--    <table class="centered striped responsive-table">
                   <thead>
                       <tr>
                           <th>ID</th>
                           <th>Nombre</th>
                           <th>Detalles</th>
                           <th>Estado</th>
                           <th>Editar</th>
                           <th>Eliminar</th>
                       </tr>
                   </thead>
   
                   <tbody>
            <% for (ProductoTab pt : LisPr) {%>
            <tr>
                <td><%=pt.getProId()%></td>
                <td><%=pt.getProNombre()%></td>

                <td>
                    <label>
                        <input type="checkbox" <% if (pt.isProEstado()) {%> checked="checked" <% }%> /> 
                        <span></span>
                    </label>
                </td>
                <td>
                    <a href="#">
                        <i class="material-icons purple-text" onclick="consultar(<%=pt.getProId()%>)" > edit </i>
                    </a>
                </td>
                <td>
                    <a href="#">
                        <i class="material-icons purple-text" onclick="msjConf(<%=pt.getProId()%>)"> delete </i>
                    </a>
                </td>
            </tr>

            <%}%>
        </tbody>
    </table> -->

            <div class="fixed-action-btn">
                <a class="btn-floating btn-large pink">
                    <i class="large material-icons">settings</i>
                </a>
                <ul>
                    <%if (acc.isRpNuevo()) {%>
                    <li><a href="#modalNuevo" class="btn-floating light-green tooltipped modal-trigger" data-position="left" data-tooltip="Nuevo Producto"><i class="material-icons">local_florist</i></a></li>
                    <li><a href="#" class="btn-floating light-pink tooltipped" data-position="left" data-tooltip="Subir xls"><i class="material-icons">attach_file</i></a></li>
                        <%}%>
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
        <%%>

        <!-- Modal Insertar Nuevo registro -->
        <%if (acc.isRpNuevo()) {%>

        <div id="modalNuevo" class="modal modal-fixed-footer">
            <form method="get" action="productos.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">assignment_ind</i> Nuevo Producto</h4>
                    <p>Registra la informacion del nuevo Producto</p>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
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

        <%}%>
        <!-- Modal Modificar Registro -->
        <%if (Ses.getAttribute("Pro") != null) {
                ProductoTab aS = (ProductoTab) Ses.getAttribute("Rol");
        %>
        <div id="modalModificar" class="modal modal-fixed-footer">
            <form method="get" action="productos.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">assignment_ind</i> Nuevo Producto</h4>
                    <p>Registra la informacion del nuevo Producto</p>
                    <div class="row">
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s6">
                            <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
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
                                            window.location = 'productos.do?accion=Eliminar&Id=' + id;
                                        }
                                    });
                        }
                        ;
                        function consultar(id) {
                            var url = 'productos.do';
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

        response.sendRedirect("maestros.do?accion=Listar");
    }

    Ses.setAttribute("lisMae", null);
    Ses.setAttribute("lisPro", null);
    Ses.setAttribute("Pro", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="productos.do" method="post" >
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

