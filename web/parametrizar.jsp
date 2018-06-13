
<%@page import="Modelo.Tabs.GradosTab"%>
<%@page import="Modelo.Tabs.VariedadTab"%>
<%@page import="Modelo.Tabs.ProductoTab"%>
<%@page import="Modelo.Tabs.MaestroTab"%>
<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Modelo.Tabs.ParametrosTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "parametrizar.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Parametro")) {
                acc = a;
            }
        }
        if (acc.isRpLeer()) {
            if (Ses.getAttribute("lisPar") != null) {
                if (Ses.getAttribute("lisG") != null) {
                    if (Ses.getAttribute("lisMae") != null) {
                        if (Ses.getAttribute("lisPro") != null) {
                            if (Ses.getAttribute("lisV") != null) {


%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Parametros</title>
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
            <h5>Parametros</h5>


            <%
                List<ParametrosTab> lisPar = (List<ParametrosTab>) Ses.getAttribute("lisPar");
                List<GradosTab> lisG = (List<GradosTab>) Ses.getAttribute("lisG");
                List<MaestroTab> lisM = (List<MaestroTab>) Ses.getAttribute("lisMae");
                List<ProductoTab> lisPr = (List<ProductoTab>) Ses.getAttribute("lisPro");
                List<VariedadTab> lisV = (List<VariedadTab>) Ses.getAttribute("lisV");

            %>
            <div class="row">
                <div class="input-field col s3">
                    <select>
                        <option value="" disabled selected>Choose your option</option>
                        <% for (GradosTab gt : lisG) {%>
                        <option value="<%=gt.getGraId()%>"> <%=gt.getGraNombre()%> </option>
                        <%}%>
                    </select>
                    <label>Grado</label>
                </div>
                <div class="input-field col s3">
                    <select>
                        <option value="" disabled selected>Choose your option</option>
                        <% for (MaestroTab mt : lisM) {%>
                        <option value="<%=mt.getMaeId()%>"> <%=mt.getMaeNombre()%> </option>
                        <%}%>
                    </select>
                    <label>Maestro</label>
                </div>
                <div class="input-field col s3">
                    <select>
                        <option value="" disabled selected>Choose your option</option>
                        <% for (ProductoTab prt : lisPr) {%>
                        <option value="<%=prt.getProId()%>"> <%=prt.getProNombre()%> </option>
                        <%}%>
                    </select>
                    <label>Producto</label>
                </div>
                <div class="input-field col s3">
                    <select>
                        <option value="" disabled selected>Choose your option</option>
                        <% for (VariedadTab vt : lisV) {%>
                        <option value="<%=vt.getVarId()%>"> <%=vt.getVarNombre()%> </option>
                        <%}%>
                    </select>
                    <label>Variedad</label>
                </div>
            </div>


            <form id="myForm">
                <div id="input1" style="margin-bottom:4px;" class="clonedInput">
                    <div class="row">
                        <div class="input-field col s4">

                            <i class="material-icons prefix">mode_edit</i>
                            <select>
                                <option value="" disabled selected>Choose your option</option>
                                <% for (ParametrosTab pt : lisPar) {%>
                                <option value="<%=pt.getParId()%>"> <%=pt.getParNombre()%> </option>
                                <%}%>
                            </select>
                            <label>Materialize Select</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">mode_edit</i>
                            <textarea id="icon_prefix2" class="materialize-textarea"></textarea>
                            <label for="icon_prefix2">First Name</label>
                        </div>
                        <div class="file-field input-field col s2">
                            <div class="material-icons transparent blue-text z-depth-0">

                                <i class="material-icons small">image</i>
                                <input type="file">
                                <input class="file-path validate" type="text">
                            </div>
                        </div>

                    </div>
                </div>

                <div>
                    <input type="button" id="btnAdd" value="+" />
                    <input type="button" id="btnDel" value="-" />
                </div>
            </form>


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
                                window.location = 'parametros.do?accion=Eliminar&Id=' + id;
                            }
                        });
            }
            ;
            function consultar(id) {
                var url = 'parametros.do';
                var form = $('<form action="' + url + '" method="post">' +
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
                $('#btnAdd').click(function () {
                    var num = $('.clonedInput').length; // how many "duplicatable" input fields we currently have
                    var newNum = new Number(num + 1); // the numeric ID of the new input field being added

                    // create the new element via clone(), and manipulate it's ID using newNum value
                    var newElem = $('#input' + num).clone().attr('id', 'input' + newNum);

                    // manipulate the name/id values of the input inside the new element
                    newElem.children(':first').attr('id', 'name' + newNum).attr('name', 'name' + newNum);

                    // insert the new element after the last "duplicatable" input field
                    $('#input' + num).after(newElem);

                    // enable the "remove" button
                    $('#btnDel').attr('disabled', '');

                    // business rule: you can only add 5 names
                    if (newNum == 5)
                        $('#btnAdd').attr('disabled', 'disabled');
                });

                $('#btnDel').click(function () {
                    var num = $('.clonedInput').length; // how many "duplicatable" input fields we currently have
                    $('#input' + num).remove(); // remove the last element

                    // enable the "add" button
                    $('#btnAdd').attr('disabled', '');

                    // if only one element remains, disable the "remove" button
                    if (num - 1 == 1)
                        $('#btnDel').attr('disabled', 'disabled');
                });

                $('#btnDel').attr('disabled', 'disabled');
            });
        </script>
    </body>
</html>
<%

                } else {
                    response.sendRedirect("variedads.do?accion=Listar");
                }

            } else {
                response.sendRedirect("productos.do?accion=Listar");
            }

        } else {
            response.sendRedirect("maestros.do?accion=Listar");
        }

    } else {
        response.sendRedirect("grados.do?accion=Listar");
    }

    Ses.setAttribute("lisPar", null);
    Ses.setAttribute("Par", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="parametros.do" method="post" >
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