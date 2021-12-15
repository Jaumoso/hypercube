<%-- 
    Document   : comprobarConexion
    Created on : 15-abr-2021, 18:52:11
    Author     : jaumo
--%>

<%@page contentType="text/html" import="p2.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de comprobación de conexión</title>
    </head>
    <body>
        <%
        AccesoBD con = AccesoBD.getInstance();
        boolean res = con.comprobarAcceso();
        %>
        <h1><%=res%></h1>
        <p>True -> Éxito en la conexión.</p>
        <p>False -> Fallo en la conexión.</p>
    </body>
</html>
