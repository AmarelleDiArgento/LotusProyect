<%-- 
    Document   : test
    Created on : 30/04/2018, 11:05:30 PM
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
        <h1>Hello World!</h1>
        <%
        String Cedula = request.getParameter("Cedula");
        String Accion = request.getParameter("accion");
        
        
        %>
        
        <%=Cedula%>
        <%=Accion%>
    </body>
</html>
