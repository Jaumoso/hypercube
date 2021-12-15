<?php
session_start();
include('basedatos.php');

if(isset($_SESSION['usuario'])){
    
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="../css/style.css" type="text/css">
        <title>&nbsp;</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1>Gestión de Usuarios</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <br>
                <h2 class="centro"><?php  if(isset($_SESSION['mensaje'])){ echo $_SESSION['mensaje']; unset($_SESSION['mensaje']);}?></h2>
                <table class="tabla-espacio centrar-tabla">
                    <tr>
                        <th>Identificador</th>
                        <th>Usuario</th>
                        <th>Estado</th>
                        <th>Acción</th>
                    </tr>
                    <tr>
                        <td colspan="4" ><hr class="hr-gris"></td>
                    </tr>
                    
                <?php getUsuarios(); ?>
                    
                    <tr><td colspan="4"><hr class="hr-gris"></td></tr>
                    <tr><td></td></tr>
                    <tr class="centro">
                        <td colspan="4"><a href="administracion2.php" class="btn intro">Volver</a></td>
                    </tr>
                    
<!--                <tr>
                    <td colspan="4"><input type="button" value="Volver"   class="btn intro" onclick='Cargar("../html/administracion2.php","cuerpo")'></td>
                </tr>-->
            </table>
                <br><br><br><br><br><br>
           </div>
        </div>
    </body>
</html>
                
<?php         
                
}
else{
    header("Location: administracion.php");
}

?>
