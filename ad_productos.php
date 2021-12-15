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
        <script src="listaProductos.js"></script>
    </head>
    <body>
        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1>Gestión de Productos</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table> 
            <br>
            <table class="inputbox tabla-espacio centrar-tabla">
                <tr class="centro">
                    <td><a href="nuevoProducto.php" class="btn intro">Insertar nuevo producto</a></td>
<!--                    <td><input type="button" value="Insertar nuevo producto" class="btn intro"></td>-->
                    
                    <td><a href="administracion2.php" class="btn intro">Volver</a>
                    <!--<td colspan="5"><input type="button" value="Volver" class="btn intro" onclick='Cargar("../html/administracion2.html","cuerpo")'></td>-->
                </tr>
            </table>
            <table class="inputbox tabla-espacio centrar-tabla">
                <tr class="centro">
                    <td colspan="8"><h2><?php  if(isset($_SESSION['mensaje'])){ echo $_SESSION['mensaje']; unset($_SESSION['mensaje']);}?></h2></td>
                </tr>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Marca</th>
                    <th>Precio (€)</th>
                    <th>Existencias</th>
                    <th>URL de la imagen</th>
                    <th>&nbsp;</th>
                </tr>
                <?php getProductos(); ?>
            </table>
                <br><br>
            </div>
            <br><br><br><br><br><br><br> 
        </div>
    </body>
</html>
<?php         
                
}
else{
    header("Location: administracion.php");
}

?>
