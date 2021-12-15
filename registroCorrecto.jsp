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
        <link rel="stylesheet" href="../css/style.css" type="text/css"/>
        <title>Registro Correcto</title>
    </head>
    <body>
        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1>¡Usuario registrado correctamente!</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td></td>
                        <td>
                            <p class="recuadro">Será redirigido en breves instantes... <img src="../imagenes/rubik-gif.gif" alt="rubik-gif" width="50"></p>
                        </td>
                    </tr>
                </table>
                <br>
            </div>
        </div>
        <script>  
            setTimeout(function(){Cargar('loginPerfil.jsp', 'cuerpo'); }, 5000);
        </script>
    </body>
</html>
