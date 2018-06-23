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
    <style>
        .row > .column {
            padding: 0 8px;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Create four equal columns that floats next to eachother */
        .column {
            float: left;
            width: 25%;
        }

        /* The Modal (background) */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 75px;
            width: 100%;
            height: 100%;
            max-height: 90% !important;
            overflow: auto;
            background-color: black;
        }

        /* Modal Content */lara
        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            width: 100%;
            max-width: 1200px;
        }

        /* The Close Button */
        .close {
            color: white;
            position: absolute;
            top: 10px;
            right: 25px;
            font-size: 35px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #999;
            text-decoration: none;
            cursor: pointer;
        }

        /* Hide the slides by default */
        .mySlides {
            display: none;
        }

        /* Next & previous buttons */
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* Caption text */
        .caption-container {
            text-align: center;
            background-color: black;
            padding: 2px 16px;
            color: white;
        }

        img.demo {
            opacity: 0.6;
        }

        .active,
        .demo:hover {
            opacity: 1;
        }

        img.hover-shadow {
            transition: 0.3s;
        }

        .hover-shadow:hover {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
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


            <div class="row">
                <%
                    for (PasoTab pt : LisP) {

                %>
                <div class="column">
                    <img src="<%=pt.getPasImagen()%>" width="100%" onclick="openModal();currentSlide(<%=pt.getPasId()%>)" class="hover-shadow">
                </div>
                <%}%>
            </div>
        </div>

            <!-- The Modal/Lightbox -->
            <div id="myModal" class="modal" tabindex="none!important">
                <span class="close cursor" onclick="closeModal()">&times;</span>
                <div class="modal-content card">

                    <%
                        for (PasoTab pt : LisP) {
                    %>
                    <div class="mySlides center">
                        <div class="numbertext"><%=pt.getPasId()%> / <%=LisP.size()%> </div><span class="close cursor" onclick="closeModal()">&times;</span>
                        <img width="60%" src="<%=pt.getPasImagen()%>">
                    </div>
                    <%}%>

                    <!-- Next/previous controls -->
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>

                    <div class="card-content">
                      <span class="card-title activator grey-text text-darken-4">Card Title<i class="material-icons right">more_vert</i></span>
                    </div>
                    <div class="card-reveal">
                      <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
                      <p>Here is some more information about this product that is only revealed once clicked on.</p>
                    </div>                   

                </div>
            </div>




<!-- <div class="row">
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
</div> -->

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
<script>
                            // Open the Modal
                            function openModal() {
                                document.getElementById('myModal').style.display = "block";
                            }

                            // Close the Modal
                            function closeModal() {
                                document.getElementById('myModal').style.display = "none";
                            }

                            var slideIndex = 1;
                            showSlides(slideIndex);

                            // Next/previous controls
                            function plusSlides(n) {
                                showSlides(slideIndex += n);
                            }

                            // Thumbnail image controls
                            function currentSlide(n) {
                                showSlides(slideIndex = n);
                            }

                            function showSlides(n) {
                                var i;
                                var slides = document.getElementsByClassName("mySlides");
                                var dots = document.getElementsByClassName("demo");
                                var captionText = document.getElementById("caption");
                                if (n > slides.length) {
                                    slideIndex = 1
                                }
                                if (n < 1) {
                                    slideIndex = slides.length
                                }
                                for (i = 0; i < slides.length; i++) {
                                    slides[i].style.display = "none";
                                }
                                for (i = 0; i < dots.length; i++) {
                                    dots[i].className = dots[i].className.replace(" active", "");
                                }
                                slides[slideIndex - 1].style.display = "block";
                                dots[slideIndex - 1].className += " active";
                                captionText.innerHTML = dots[slideIndex - 1].alt;
                            }
</script>
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

