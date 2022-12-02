<%-- 
    Document   : usuario2
    Created on : 30-abr-2021, 18:24:13
    Author     : jaumo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>&nbsp;</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
        <body>
            <%
            String usuarioActual = (String)session.getAttribute("usuario");
            session.removeAttribute("mensaje");
            %>
                <div class="centrar-contenido">
                    <div class="recuadro">
                         <table class="ancho">
                            <tr>
                                <td></td>
                                <td><h1>Mi Perfil</h1>
                                <hr class="hr-naranja"></td>
                            </tr>
                        </table>
                        <br>
                        <table class="centrar-tabla">
                            <tr class="centro">
                                <td colspan="3"><img src="imagenes/usuario.png" alt="usuario" width="150"></td>
                            </tr>
                            <tr class="centro">
                                <td colspan="3">¡Bienvenido, <%=usuarioActual%>! </td>
                            </tr>
                            <tr>
                                 <td colspan="3"><hr class="hr-gris"></td>
                            </tr>
                            <tr class="centro">
                                <td><input type="button" value="Cambiar datos" class="btn intro" onclick='Cargar("cambiar.jsp","cuerpo")'></td>
                                <td><input type="button" value="Gestionar pedidos" class="btn intro" onclick='Cargar("pedidos.jsp","cuerpo")'></td>
                                <td><input type="button" value="Cerrar sesión" class="btn intro" onclick='Cargar("../CerrarSesion","cuerpo")'></td>
                                <!--Cargar("loginPerfil.jsp","cuerpo")-->
                            </tr>
                        </table>
                    <br><br>
                </div>
            <br><br><br><br>
        </div>
        <%
        if(usuarioActual == null){
        %>
        <script>Cargar("loginPerfil.jsp","cuerpo");</script>
       <% 
        }
        %>           
    </body>
</html>
