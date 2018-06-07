
<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Modelo.Tabs.TipoTab"%>
<%@page import="Modelo.Tabs.MaterialSecoTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "materialseco.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Material Seco")) {
                acc = a;
            }
        }
        if (acc.isRpLeer()) {
            if (Ses.getAttribute("lisMs") != null) {
                if (Ses.getAttribute("lisT") != null) {
                    List<TipoTab> lisT = (List<TipoTab>) Ses.getAttribute("lisT");


%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Materialseco</title>
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
            <h5>Material Seco</h5>


            <%
                List<MaterialSecoTab> lisMs = (List<MaterialSecoTab>) Ses.getAttribute("lisMs");
            %>
            <table class="centered striped responsive-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Estado</th>
                        <th>Alto</th>
                        <th>Ancho</th>
                        <th>Profundo</th>
                            <%if (acc.isRpEditar()) {%>
                        <th>Editar</th>
                            <%}
                                if (acc.isRpEliminar()) {%>

                        <th>Eliminar</th>
                            <%}%>
                    </tr>
                </thead>

                <tbody>
                    <% for (MaterialSecoTab mt : lisMs) {%>
                    <tr>
                        <td><%=mt.getMsId()%></td>
                        <td><%=mt.getTipoMs_TimId()%></td>
                        <td><%=mt.getMsNombre()%></td>
                        <td><%=mt.getMsImagen()%></td>
                        <td><%=mt.getMsDescripcion()%></td>
                        <td><%=mt.getMsAlto()%></td>
                        <td><%=mt.getMsAncho()%></td>
                        <td><%=mt.getMsProfundo()%></td>
                        <td>
                            <label>
                                <input type="checkbox" <% if (mt.isMsEstado()) {%> checked="checked" <% }%> /> 
                                <span></span>
                            </label>
                        </td>
                        <%if (acc.isRpEditar()) {%>
                        <td>
                            <a href="#">
                                <i class="material-icons purple-text" onclick="consultar(<%=mt.getMsId()%>)" > edit </i>
                            </a>
                        </td>
                        <%}
                            if (acc.isRpEliminar()) {%>
                        %>
                        <td>
                            <a href="#">
                                <i class="material-icons purple-text" onclick="msjConf(<%=mt.getMsId()%>)"> delete </i>
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
                    <%if (acc.isRpNuevo()) {%>
                    <li><a href="#modalNuevo" class="btn-floating light-green tooltipped modal-trigger" data-position="left" data-tooltip="Nuevo Materialseco"><i class="material-icons">extension</i></a></li>
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
                        LOTUS - ELITE FLOWER � 2017 Copyright Text
                    </p>
                </div>
            </div>
        </footer>


        <!-- Modal Insertar Nuevo registro -->
        <%if (acc.isRpNuevo()) {%>
        <div id="modalNuevo" class="modal modal-fixed-footer">
            <form method="get" action="materialsecos.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">assignment_ind</i> Nuevo MaterialSeco</h4>
                    <p>Registra la informacion del nuevo MaterialSeco</p>
                    <div class="row">
                        <div class="input-field col s4">
                            <select name="ProId">>
                                <option value="" disabled selected>Producto</option>
                                <%                        for (TipoTab pl : lisT) {%>
                                <option value="<%=pl.getTiMId()%>"><%=pl.getTiMNombre()%></option>
                                <%}%>
                            </select>
                            <label>Tipo</label>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                                <label for="Nombre">Nombre</label>
                            </div>
                            <div class="input-field col s12">
                                <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
                                <label for="Descripcion">Descripci�n</label>
                            </div>

                            <div class="file-field input-field col s4">

                                <i class="material-icons prefix">image</i>
                                <input type="file" name="image">
                                <input class="file-path validate" name ="Archivo" type="text">

                            </div>

                            <div class="input-field col s6">
                                <input id="Alto" type="number" name="Alto" class="validate" required="">
                                <label for="Alto">Alto</label>
                            </div>

                            <div class="input-field col s6">
                                <input id="Ancho" type="number" name="Ancho" class="validate" required="">
                                <label for="Ancho">Ancho</label>
                            </div>

                            <div class="input-field col s6">
                                <input id="Profundo" type="number" name="Profundo" class="validate" required="">
                                <label for="Profundo">Profundo</label>
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
        <%if (Ses.getAttribute("Mat") != null) {
                MaterialSecoTab mS = (MaterialSecoTab) Ses.getAttribute("Mat");
        %>
        <div id="modalModificar" class="modal modal-fixed-footer">
            <form method="get" action="materialsecos.do">
                <div class="modal-content">
                    <h4><i class="material-icons medium">assignment_ind</i> Nuevo Material Seco</h4>
                    <p>Registra la informacion del nuevo Material Seco</p>
                    <div class="row">
                        <div class="input-field col s4">
                            <input id="Nombre" type="text" name="Id" class="validate" required value="<%=mS.getMsId()%>" hidden>
                            <select name="TiMId">>
                                <option value="" disabled >Tipo</option>
                                <%                        for (TipoTab tl : lisT) {%>
                                <option value="<%=tl.getTiMId()%>"  <%if (mS.getMsId() == tl.getTiMId()) {%> selected <%}%> ><%=tl.getTiMNombre()%> </option>
                                <%}%>
                            </select>
                            <label>Tipo Materialseco</label>
                        </div>
                        <div class="input-field col s6">
                            <input id="Nombre" type="text" name="Nombre" class="validate" required="">
                            <label for="Nombre">Nombre</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class="validate" required></textarea>
                            <label for="Descripcion">Descripci�n</label>
                        </div>

                        <div class="input-field col s6">
                            <input id="Alto" type="number" name="Alto" class="validate" required="">
                            <label for="Alto">Alto</label>
                        </div>

                        <div class="input-field col s6">
                            <input id="Ancho" type="number" name="Ancho" class="validate" required="">
                            <label for="Ancho">Ancho</label>
                        </div>

                        <div class="input-field col s6">
                            <input id="Profundo" type="number" name="Profundo" class="validate" required="">
                            <label for="Profundo">Profundo</label>
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
                                            title: "�Estas seguro?",
                                            text: "Se eliminara el registro con el ID: " + id,
                                            icon: "warning",
                                            buttons: true,
                                            dangerMode: true
                                        })
                                                .then((willDelete) => {
                                                    if (willDelete) {
                                                        window.location = 'materialsecos.do?accion=Eliminar&Id=' + id;
                                                    }
                                                });
                                    }
                                    ;
                                    function consultar(id) {
                                        var url = 'materialsecos.do';
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
        response.sendRedirect("tipos.do?accion=Listar");
    }
    Ses.setAttribute("lisMs", null);
    Ses.setAttribute("Mat", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>

    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="materialsecos.do" method="post" >
            <input name="accion" value="Listar" hidden/>
        </form>
    </body>
    <%

                }

            } else {

                response.sendRedirect("main.jsp");
            }

        } else {

            response.sendRedirect("index.jsp");
        }
    %>