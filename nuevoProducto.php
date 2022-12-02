<?php
include('basedatos.php');
session_start();
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

if(isset($_POST["anyadirProducto"])){

    if(!empty($_POST['nombre']) && !empty($_POST['descripcion']) && !empty($_POST['marca']) && !empty($_POST['precio']) && !empty($_POST['existencias']) && !empty($_POST['imagen'])) {

        $nombre = $_POST['nombre'];
        $descripcion = $_POST['descripcion'];
        $marca = $_POST['marca'];
        $precio = $_POST['precio'];
        $existencias = $_POST['existencias'];
        $imagen = $_POST['imagen'];

        $bbdd = conectar();
        $resultado;
        if($resultado = mysqli_prepare($bbdd,"INSERT INTO productos VALUES (NULL,?,?,?,?,?,?);")){
            mysqli_stmt_bind_param($resultado,"sssdis",$nombre,$descripcion,$marca,$precio,$existencias,$imagen);

                mysqli_stmt_execute($resultado);
        //        mysqli_stmt_fetch($resultado);
                mysqli_stmt_close($resultado);
                $_SESSION['mensaje'] = "Producto añadido correctamente a la base de datos.";

        }
        else{
            echo 'Error al ejecutar la consulta a la base de datos.';
        }
        desconectar($bbdd);
        header("Location: ad_productos.php");
    } 
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
            <div class="recuadro">
                <table class="ancho">
                    <tr>
                        <td><p> </p></td>
                        <td><h1>Nuevo Producto</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <br>
                <form action="nuevoProducto.php" method="post">
                <table class="tabla-espacio inputbox">
                    <tr>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Marca</th>
                        <th>Precio</th>
                        <th>Existencias</th>
                        <th>URL de la imagen</th>
                    </tr>
                    <tr>
                        <td><input type="text" name="nombre" placeholder="Nombre" required></td>
                        <td><textarea name="descripcion" placeholder="Nombre" class="textarea" style="    
                            padding: 15px;
                            margin: 5px 0 5px 0;
                            border: none;
                            background: white;
                            font-family: 'Rubik', sans-serif;
                            outline: none;
                            min-width: 300px;
                            min-height: 100px;
                            max-height: 300px;
                            max-width: 600px;"
                            required></textarea></td>
                        <td><input type="text" name="marca" placeholder="Marca" required></td>
                        <td><input type="text" name="precio" placeholder="XX.XX Є" required></td>
                        <td><input type="number" name="existencias" placeholder="XXXX" required></td>
                        <td><input type="text" name="imagen" placeholder="../imagenes/XXXX.jpg" required></td>
                    </tr>
                </table>
                    <table class="inputbox tabla-espacio centrar-tabla">
                        <tr class="centro">
                        <td>
                            <input type="submit" class="btn intro" name="anyadirProducto" value="Añadir Producto">
                        </td>
                        <td>
                            <a href="ad_productos.php" class="btn intro">Volver</a>
                        </td>
<!--                        <td><input type="button" value="Volver" onclick=""></td>--> 
                        </tr>
                </table>
                </form>
            </div>
    </body>
</html>
    
