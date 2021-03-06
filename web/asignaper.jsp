<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "asignaper.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Permiso")) {
                acc = a;
            }
        }
        if (acc.isRpLeer()) {
            if (Ses.getAttribute("lisAp") != null) {


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
            <form action="asignapers.do" method="get" />

            <%
                List<AsignaPermisoTab> LisAp = (List<AsignaPermisoTab>) Ses.getAttribute("lisAp");
                if (LisAp.size() >= 1) {%>

            <input name="Rol" value="<%=LisAp.get(1).getRolId()%>" hidden />
            <%}
            %>
            <table class="centered striped responsive-table" id="tabla" >
                <thead>
                    <tr>
                        <th>Rol</th>
                        <th>Permiso</th>
                        <th>Leer</th>
                        <th>Nuevo</th>
                        <th>Editar</th>

                        <th>Eliminar</th>

                    </tr>
                </thead>


                <tbody>

                    <% for (AsignaPermisoTab apt : LisAp) {


                    %>   
                    <tr>
                        <td><%=apt.getRoln()%></td>
                        <td><%=apt.getnPermiso()%></td>
                        <td>
                            <input name="<%=apt.getPerId()%>" class="switchstad" type="checkbox" id="<%=apt.getPerId()%>L" value="L" <%if (apt.isRpLeer()) {%>checked <%}%>/><label class="labelstad" for="<%=apt.getPerId()%>L">Toggle</label>
                        </td>
                        <td>
                            <input name="<%=apt.getPerId()%>" class="switchstad" type="checkbox" id="<%=apt.getPerId()%>N"value="N" <%if (apt.isRpNuevo()) {%>checked <%}%>/><label class="labelstad" for="<%=apt.getPerId()%>N">Toggle</label>
                        </td>
                        <td>
                            <input name="<%=apt.getPerId()%>" class="switchstad" type="checkbox" id="<%=apt.getPerId()%>M" value="M"<%if (apt.isRpEditar()) {%>checked <%}%>/><label class="labelstad" for="<%=apt.getPerId()%>M">Toggle</label>
                        </td>
                        <td>
                            <input name="<%=apt.getPerId()%>" class="switchstad" type="checkbox" id="<%=apt.getPerId()%>E" value="E" <%if (apt.isRpEliminar()) {%>checked <%}%>/><label class="labelstad" for="<%=apt.getPerId()%>E">Toggle</label>
                        </td>
                    </tr>

                    <%}%>
                    <%if (acc.isRpEditar()) {%>

                <div class="row center-align">
                    <input class="waves-effect waves-orange btn-flat" type="submit" name="accion" value="modificar" />
                </div>
                <%}%>
                </tbody>
            </table>


        </form>
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
                        <label for="Descripcion">Descripci�n</label>
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
    <%if (Ses.getAttribute("Asp") != null) {
            AsignaPermisoTab uS = (AsignaPermisoTab) Ses.getAttribute("Asp");
    %>
    <div id="modalModificar" class="modal modal-fixed-footer">
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
                    title: "�Estas seguro?",
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
                var form = $('<form action="' + url + '" method="get">' +
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

    Ses.setAttribute("lisAp", null);
    //Ses.setAttribute("Rol", null);
    Ses.setAttribute("msj", null);
} else {
    if (request.getParameter("Rol") != null) {
        int id = Integer.parseInt(request.getParameter("Rol"));
%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="asignapers.do" method="post" >
            <input name="accion" value="Obtener" hidden/>
            <input name="Rol" value="<%=id%>" hidden/>
        </form>
    </body>
    <%}%>
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
