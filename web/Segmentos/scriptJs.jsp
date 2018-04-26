<%-- 
    Document   : scriptJs
    Created on : 25/04/2018, 05:14:28 PM
    Author     : Amarelle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/init.js"></script>
        <script type="text/javascript" src="js/sweetalert.min.js"></script>


        <script type="text/javascript">


            function msjError(Msj)
            {
                swal({
                    title: "¡Error!",
                    text: "Detalles: " + Msj,
                    icon: "error"
                });
            }
            ;
            function msjConf(id)
            {
                swal({
                    title: "¿Estas seguro?",
                    text: "Se eliminara el registro con el ID: " + id,
                    icon: "warning",
                    buttons: true,
                    dangerMode: true
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                window.location = 'usuarios.do?accion=Eliminar&Id=' + id;
                            }
                        });
            }
            ;

            function msjMsj(Msj)
            {
                swal({
                    title: "¡Excelente!",
                    text: "Detalles: " + Msj,
                    icon: "success"
                });
            }
            ;
        </script>
    </body>
</html>
<%--
function msj(id) {
                swal({
                title: "Are you sure?",
                        text: "Once deleted, you will not be able to recover this imaginary file!",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                })
                        .then((willDelete) => {
                        if (willDelete) {
                        window.location = 'permisos.do?accion=Eliminar&Id=' + id;
                        }
                        });
                };

--%>