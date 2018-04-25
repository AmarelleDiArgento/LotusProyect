<%--
    Document   : menu
    Created on : 22/04/2018, 11:07:30 PM
    Author     : Amarelle
--%>

<%@page import="Modelo.Tabs.UsuarioTab"%>
<%@page import="Modelo.Tabs.PermisoTab"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%

        HttpSession SesM = request.getSession(true);
        List<PermisoTab> menu = (List<PermisoTab>) SesM.getAttribute("Menu");
        UsuarioTab u = (UsuarioTab) SesM.getAttribute("log");

        if (menu != null && menu.size() > 0) {

    %>
    <body><nav class="z-depth-0">
            <div class="nav-wrapper white">
                <a href="#!" class="brand-logo">Lotus Proyect</a>

                <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">more_vert</i></a>

                <ul class="right hide-on-med-and-down">
                    <li>
                        <form>
                            <div class="input-field">
                                <input id="search" type="search" required>
                                <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                                <i class="material-icons">close</i>
                            </div>
                        </form>
                    </li>


            <%        for (PermisoTab m : menu) {

            %>
            <li><a href="<%=m.getPerUrl()%>" class="tooltipped" data-position="bottom" data-tooltip="<%=m.getPerNombre()%>"><i class="material-icons"><%=m.getPerIco()%></i></a></li>
            <%}%>
            <li><a href="sessionFinally.jsp" class="tooltipped" data-position="bottom" data-tooltip="Cerrar sesión"><i class    ="material-icons">exit_to_app</i></a></li>

                </ul>
            </div>

        </nav>

        <ul id="slide-out" class="sidenav">
            <li>
                <div class="user-view">
                    <div class="background">
                        <img src="img\LotoLila.jpg">
                    </div>
                    <a href="#"><img class="circle" src="img\Usuario.jpg"></a>
                    <a href="#!name"><span class="white-text name"><%=u.toFullName()%></span></a>
                    <a href="#!email"><span class="white-text email"><%=u.getnRol()%></span></a>
                </div>
            </li>

            <li>
                <div class="divider"></div>
            </li>
            <%        for (PermisoTab m : menu) {%>
            <li ><a href="<%=m.getPerUrl()%>"><i class="material-icons"><%=m.getPerIco()%></i><%=m.getPerNombre()%></a></li>
                    <%}%>
            <li><div class="divider"></div></li>
            <li ><a href="sessionFinally.jsp"><i class="material-icons">exit_to_app</i>Cerrar session</a></li>
        </ul>


        <%    } else {
                response.sendRedirect("permisos.do?accion=menu");

            }

        %>
    </body>
</html>
