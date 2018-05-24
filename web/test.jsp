<%-- 
    Document   : test
    Created on : 30/04/2018, 11:05:30 PM
    Author     : Amarelle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Lotus QA - Test</title>
        <link rel="shortcut icon" href="img\favicon.png" type="image/x-icon"/>

        <!-- CSS  -->
        <link href="css/material-icons.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    </head>
    <body>
        <form method="post" action="usuarios.do" enctype="multipart/form-data" >

            <input type="file" name="imagen" accept="image/*">
            <input type="submit" class="waves-effect waves-green btn-flat" name="accion" value="Subir">

<div class="form">
    
    
</div>

        </form>


    </body>
</html>
