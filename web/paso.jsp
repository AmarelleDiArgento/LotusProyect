<%@page import="Modelo.Tabs.PasoTab"%>
<%@page import="Servicios.Mensajes"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
// nombrar jsp de estancia
    String jsp = "paso.jsp";
    HttpSession Ses = request.getSession(true);
    Ses.setAttribute("jsp", jsp);
    Mensajes msj = null;

//Confirmar sesion del usuario
    if (Ses.getAttribute("log") != null) {
        if (Ses.getAttribute("lisPa") != null) {


%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Paso</title>
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
            <h5>Pasos</h5>


            <%
                List<PasoTab> LisP = (List<PasoTab>) Ses.getAttribute("lisPa");
            %>

       <div class="carousel carousel-slider">

                <% for (PasoTab pt : LisP) {%>
        <a class="carousel-item" href="#one!">
        <div class="col s12 m7">
                <h2 class="header">Paso <%=pt.getPasorden()%></h2>
                <div class="card horizontal">
                  <div class="card-image">
                    <img width="500px" src="<%=pt.getPasImagen()%>" class="materialboxed">
                  </div>
                  <div class="card-stacked">
                    <div class="card-content">
                      <p><%=pt.getPasDescripcion()%></p>
                    </div>
                  </div>
                </div>
            </div>
        </a>
                <%}%>
        
      </div>




            <div class="row">
                <% for (PasoTab pt : LisP) {%>
                <div class="col s3">
                    <div class="card">
                        <div class="card-image">
                            <img src="<%=pt.getPasImagen()%>" style="max-height: 6.5rem;" class="materialboxed" >
                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons" onclick="consultar(<%=pt.getPasId()%>)">edit</i></a>
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Paso <%=pt.getPasorden()%><i class="material-icons right">more_vert</i></span>

                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">paso <%=pt.getPasorden()%><i class="material-icons right">close</i></span>
                            <p><%=pt.getPasDescripcion()%></p>
                        </div>
                    </div>
                </div>
                <%}%>
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
    <form method="get" action="Pasos.do">
        <div class="modal-content">
            <h4><i class="material-icons medium">assignment_ind</i> Nuevo Paso</h4>
            <p>Registra la informacion del nuevo Paso</p>
            <div class="row">
                <div class="input-field col s6">
                    <input id="Nombre" type="number" name="Orden" class="validate" required="">
                    <label for="Orden">Orden</label>
                </div>
                <div class="input-field col s12">
                    <textarea id="Descripcion" class="materialize-textarea" name="Descripcion" class= "validate" required></textarea>
                    <label for="Descripcion">Descripción</label>
                </div>
                
                <div class="file-field input-field col s3">
                            <i class="material-icons prefix">image</i>
                            <input type="file" name="image">
                            <input class="file-path validate" name ="Archivo" type="text">
                        </div>
                

            </div>    
        </div>


        <div class="modal-footer">
            <input name="accion" value="Registrar" type="submit" class="modal-action waves-effect waves-light btn-flat">
        </div>
    </form>
</div>


<!-- Modal Modificar Registro -->
<%if (Ses.getAttribute("Pas") != null) {
        PasoTab pS = (PasoTab) Ses.getAttribute("Rol");
%>
<div id="modalModificar" class="modal modal-fixed-footer">
    <form method="get" action="pasos.do">
        <div class="modal-content">
            <h4><i class="material-icons medium">assignment_ind</i> Nuevo Paso</h4>
            <p>Registra la informacion del nuevo Paso</p>
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
                                            window.location = 'pasos.do?accion=Eliminar&Id=' + id;
                                        }
                                    });
                        }
                        ;
                        function consultar(id) {
                            var url = 'pasos.do';
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

    Ses.setAttribute("lisP", null);
    Ses.setAttribute("Pas", null);
    Ses.setAttribute("msj", null);
} else {%>
<html>
    <body onload="document.getElementById('lista').submit()">
        <form id="lista" action="pasos.do" method="post" >
            <input name="accion" value="Listar" hidden/>
        </form>
    </body>
</html>
<%

        }

    } else {

        response.sendRedirect("index.jsp");
    }
%>

