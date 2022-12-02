<%-- 
    Document   : registroCorrecto
    Created on : 30-abr-2021, 19:57:51
    Author     : jaumo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <title>Registro Correcto</title>
    </head>
    <body>
        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1>¡Error al registrarse! (╯°□°)╯︵ ┻━┻</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td></td>
                        <td>
                            <p class="recuadro">Ha ocurrido un error al registrarte. Por favor, inténtelo de nuevo. Si el problema persiste, contacte con servicio técnico.</p>
                        </td>
                    </tr>
                </table>
                <br>
                <table class="tabla-espacio centrar-tabla">
                    <tr>
                        <td><input type="submit" value="Volver" class="btn intro" onclick="Cargar('../html/usuario2.jsp','cuerpo')"></td>
                    </tr>
                </table>
                <br>
            </div>
        </div>
    </body>
</html>
