<%-- 
    Document   : test
    Created on : 30/04/2018, 11:05:30 PM
    Author     : Amarelle
--%>

<%@page import="Modelo.MySql.AdminMs"%>
<%@page import="Modelo.Tabs.AsignaPermisoTab"%>
<%@page import="Modelo.Tabs.PermisoTab"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Tabs.UsuarioTab"%>
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

        <%


        %>


        <form method="post" action="usuarios.do" enctype="multipart/form-data" >

            <input type="file" name="imagen" accept="image/*">
            <input type="submit" class="waves-effect waves-green btn-flat" name="accion" value="Subir">

            <div class="form">


            </div>

        </form>

        <%            
            try{
                AdminMs Asql = new AdminMs();
            
            boolean L, N, M, E;

            int Rol = Integer.parseInt(request.getParameter("Rol"));
            List<PermisoTab> Lp = Asql.getPermiso().listar();
            for (PermisoTab p : Lp) {
                String[] cap = request.getParameterValues(String.valueOf(p.getPerId()));
                L = false;
                N = false;
                M = false;
                E = false;
                for (String a : cap) {
                    out.println(a);
                    switch (a) {
                        case "L":
                            L = true;
                            break;
                        case "N":
                            N = true;
                            break;
                        case "M":
                            M = true;
                            break;
                        case "E":
                            E = true;
                            break;

                    }
                }
                
                AsignaPermisoTab aps = new AsignaPermisoTab(Rol, p.getPerId(), L, N, M, E);
                out.print(aps.toString());
            }
            }catch (Exception ex) {            
                out.println(ex.getCause());
            }

        %>


    </body>
</html>
