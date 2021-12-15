<%-- 
    Document   : login
    Created on : 22-abr-2021, 19:26:02
    Author     : jaumo
--%>

<%@page language="java" import="p2.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<title>&nbsp;</title>
</head>
    <body>
        <%
        //Utilizamos una variable en la sesión para informar de los mensajes de Error
        String mensaje = (String)session.getAttribute("mensaje");

        //Se obtiene el usuario actual registrado en el servicio web, del entorno de sesión
        String usuarioActual = (String)session.getAttribute("usuario");
        if (usuarioActual == null){ //No hay usuario registrado
            //Mostramos el formulario para la introducción del usuario y la clave
        %>
        
        <div class="centrar-contenido">
            <form method="post" onsubmit="ProcesarForm(this,'../LoginTienda','cuerpo');return false">
            <table class="tabla-login inputbox centrar-tabla">
                <tr>
                    <td colspan="2" class="centro"><b>Inicio de Sesión</b><br>
                        Personal de Administración<br>
                    <%
                        if (mensaje != null) { //Eliminamos el mensaje consumido
                            session.removeAttribute("mensaje");
                    %>
                    <%=mensaje%>
                    <%
                        }
                        else{
                        %>
                        <br>
                        <%
                        }
                        %>
                    <br></td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td><input type="text" name="usuario" required></td>
                </tr>
                <tr>
                    <td>Clave:</td>
                    <td><input type="password" name="clave" required></td>
                </tr>
                <tr class="centro">
                    <td colspan="2">
                        <input type="submit" name="tipoAcceso" value="Acceder" class="btn intro font-rubik">
                        &nbsp;<input hidden="1" value="admin" name="origen">
                    </td>
                </tr>
            </table>
            </form>
            
            <%
            }
            else {
            //Si existe un usuario, se mostrará las opciones del apartado del usuario
            
            %>
            <script>Cargar("../html/administracion2.html","cuerpo");</script>
            <%
            }
            %>
            
        </div>
        <br><br><br><br><br><br>
        <br><br>
    </body>
</html>
