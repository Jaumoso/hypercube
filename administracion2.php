<?php

session_start();

if(!isset($_SESSION['usuario'])){
    header("Location: administracion.php");
}

?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>&nbsp;</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="centrar-contenido">
            <br>
            <table class="centrar-tabla">
                <tr>
                    <td><a href="ad_usuarios.php" class="btn intro">Usuarios</a>
                    <td><a href="ad_productos.php" class="btn intro">Productos</a>
                    <td><a href="ad_pedidos.php" class="btn intro">Pedidos</a>
                    <td><a href="cerrarSesion.php" class="btn intro">CerrarSesion</a>
                    <!--<td><input type="button" class="btn intro" value="Usuarios" onclick='Cargar("ad_usuarios.html","cuerpo")'></td>
                    <td><input type="button" class="btn intro" value="Productos" onclick='Cargar("ad_productos.html","cuerpo")'></td>
                    <td><input type="button" class="btn intro" value="Pedidos" onclick='Cargar("ad_pedidos.html","cuerpo")'></td>
                    <td><input type="submit" class="btn intro" id="cerrarSesion" value="Cerrar sesión" onclick='Cargar("../CerrarSesion","cuerpo")'></td>-->
                </tr>
            </table>
        </div>
    </body>
</html>
