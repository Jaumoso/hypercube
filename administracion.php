<?php

session_start();
include_once('basedatos.php');


if(isset($_SESSION["usuario"])){
    header("Location: administracion2.php");
}

?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>Administración - HyperCube</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="centrar-contenido">
            <form method="post" action="">
                <table class="tabla-login inputbox centrar-tabla">
                    <tr>
                        <td colspan="2" class="centro"><b>Inicio de Sesión</b><br> Personal de Administración<br><br>
                        <i><?php  if(isset($_SESSION['mensaje'])){ echo $_SESSION['mensaje']; unset($_SESSION['mensaje']);}?></i><br></td>
                    </tr>
                    <tr>
                        <td>Usuario:</td>
                        <td><input type="text" name="usuario" id="usuario" required></td>
                    </tr>
                    <tr>
                        <td>Clave:</td>
                        <td><input type="password" name="clave" id="clave" required></td>
                    </tr>
                    <tr class="centro">
                        <td colspan="2"><br><input type="submit" name="login" id="login" value="Acceder" class="btn intro font-rubik"><br></td>
                    </tr>
                </table>
            </form>
        </div>
        <br><br><br><br><br><br><br>
    </body>
</html>

<?php
if(isset($_POST["login"])){
    
if(!empty($_POST['usuario']) && !empty($_POST['clave'])) {
$usuario=$_POST['usuario'];
$clave=$_POST['clave'];


$bbdd = conectar();
$usuario_db = "";
$clave_db = "";
$admin = 0;
$resultado;
 if($resultado = mysqli_prepare($bbdd,"SELECT usuario,clave,admin FROM usuarios WHERE usuario=? AND clave=?")){
    mysqli_stmt_bind_param($resultado,"ss",$usuario,$clave);
    mysqli_stmt_execute($resultado);
    mysqli_stmt_bind_result($resultado, $usuario_db, $clave_db, $admin);
    mysqli_stmt_fetch($resultado);
    mysqli_stmt_close($resultado);
    
}
else{
    echo 'Error al ejecutar la consulta a la base de datos.';
    $_SESSION['mensaje'] = 'Error al ejecutar la consulta a la base de datos.';
}
desconectar($bbdd);
    

//    echo "usuario: $usuario\n";
//    echo "usaruio bd: $usuario_db\n";
//    echo "clave: $clave\n";
//    echo "calve bd: $clave_db\n";
//    echo "admin: $admin";
    if($usuario == $usuario_db && $clave == $clave_db && $admin == 1){
        
        $_SESSION['usuario']=$usuario;
        
        /* Redirect browser */
        header("Location: administracion2.php");
        
    }
    else {
    $_SESSION['mensaje'] = "Solo puede acceder <br> personal de administración.";
    header("Location: administracion.php");
    }
} 
}
