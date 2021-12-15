<%@page contentType="text/html" import="p2.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <title>&nbsp;</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
        int id_pedido = (Integer) session.getAttribute("id_pedido");
        String mensaje = (String) session.getAttribute("mensaje");
        session.removeAttribute("id_pedido");
        session.removeAttribute("mensaje");
        session.removeAttribute("carritoProcesado");
        session.removeAttribute("precioTotal");
        %>
        <!-- BORRAMOS CARRITO -->
        <script>borrarCarritoTrasPedido();</script>
        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1><%=mensaje%></h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <br>
                <table>
                    <tr>
                        <td></td>
                        <td>
                            <p class="recuadro">Su ID del pedido es: <b><%=id_pedido%></b></p>
                        </td>
                    </tr>
                </table>
                <br>
                <table class="tabla-espacio centrar-tabla">
                    <tr>
                        <td><input type="submit" value="Volver" class="btn intro" onclick="Cargar('../html/usuario2.jsp','cuerpo')"></td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
