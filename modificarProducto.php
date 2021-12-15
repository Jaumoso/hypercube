<?php
include('basedatos.php');
session_start();

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

if(isset($_POST["modificarProducto"])){

    if(!empty($_POST['nombre']) && !empty($_POST['descripcion']) && !empty($_POST['marca']) && !empty($_POST['precio']) && !empty($_POST['existencias']) && !empty($_POST['imagen'])) {

        $nombre = $_POST['nombre'];
        $descripcion = $_POST['descripcion'];
        $marca = $_POST['marca'];
        $precio = $_POST['precio'];
        $existencias = $_POST['existencias'];
        $imagen = $_POST['imagen'];
        $id_producto = $_POST['id_producto'];

        $bbdd = conectar();
        $resultado;
        if($resultado = mysqli_prepare($bbdd,"UPDATE productos SET nombre=?, descripcion=?, marca=?, precio=?, existencias=?, imagen=? WHERE id_producto=?;")){
            mysqli_stmt_bind_param($resultado,"sssdisi",$nombre,$descripcion,$marca,$precio,$existencias,$imagen,$id_producto);

                mysqli_stmt_execute($resultado);
        //        mysqli_stmt_fetch($resultado);
                mysqli_stmt_close($resultado);
                $_SESSION['mensaje'] = "Producto con ID: #$id_producto modificado correctamente.";

        }
        else{
            echo 'Error al ejecutar la consulta a la base de datos.';
        }
        desconectar($bbdd);
        header("Location: ad_productos.php");
    } 
}
