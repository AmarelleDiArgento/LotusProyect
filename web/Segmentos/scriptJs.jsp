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
        <script src="sweetalert2.min.js"></script>

        <script language="JavaScript" type="text/JavaScript">
            function error() {
            swal({
            type: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
            footer: '<a href>Why do I have this issue?</a>',
            })};

                
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