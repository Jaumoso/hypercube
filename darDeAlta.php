<?php
include('basedatos.php');
session_start();

////////////////////////////////////////
//                                    //
//      CÓDIGO NO UTILIZADO           //
//                                    //
////////////////////////////////////////

if(isset($_POST["alta"])){

        $id_usuario = $_POST['id_usuario'];

        $bbdd = conectar();
        $resultado;
        if($resultado = mysqli_prepare($bbdd,"UPDATE usuarios SET activo='1' WHERE id_usuario=?;")){
            mysqli_stmt_bind_param($resultado,"i",$id_usuario);

                mysqli_stmt_execute($resultado);
        //        mysqli_stmt_fetch($resultado);
                mysqli_stmt_close($resultado);
                $_SESSION['mensaje'] = "Usuario dado de alta correctamente.";
        }
        else{
//            echo 'Error al ejecutar la consulta a la base de datos.';
            $_SESSION['mensaje'] = "Error al intentar cambiar el estado.";
        }
        desconectar($bbdd);
        header("Location: ad_usuarios.php");
}
