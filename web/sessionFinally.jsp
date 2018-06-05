<%-- 
    Document   : sessionFinally
    Created on : 11/02/2018, 11:48:53 PM
    Author     : Freyd
--%>

<%@page import="Servicios.Mensajes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            session.invalidate();
            
            Mensajes m = new Mensajes();
            m.setTipo("Msj");
            m.setMsj("Vuelve pronto");
            HttpSession Ses = request.getSession(true);
            Ses.setAttribute("msj", m);
            response.sendRedirect("index.jsp");

        %> 
    </body>
</html>
