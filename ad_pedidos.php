<?php
session_start();
include('basedatos.php');
if(isset($_SESSION['usuario'])){
    
    $filtro_fecha = "";
    $filtro_producto = "";
    $filtro_usuario = "";
    
    if(isset($_POST['filtrar'])){
        if(isset($_POST['filtro-usuario'])){
            $filtro_usuario = $_POST['filtro-usuario'];
        }
        if(isset($_POST['filtro-producto'])){
            $filtro_producto = $_POST['filtro-producto'];
        }
        if(isset($_POST['filtro-fecha'])){
            $filtro_fecha = $_POST['filtro-fecha'];
        }
    }
    
    
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <title>&nbsp;</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script src="js/listaProductos.js"></script>
    </head>
    <body>
        <div class="centrar-contenido">
          <div class="recuadro">
                <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1>Gestión de Pedidos</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table> 
                <br>
                    <table class="centrar-tabla tabla-espacio" >
                        <tr class="centro"><td><a href="administracion2.php" class="btn intro">Volver</a></td></tr>
                    </table>
                    <!--<input type="button" value="Volver" class="btn intro" onclick='Cargar("../html/administracion2.html","cuerpo")'>-->
                <br>
                <h2 class="centro"><?php  if(isset($_SESSION['mensaje'])){ echo $_SESSION['mensaje']; unset($_SESSION['mensaje']);}?></h2>
                    <form method="post" action="ad_pedidos.php">
                        <table class="inputbox tabla-espacio centrar-tabla">
                            <tr><th colspan="4">Filtrar por:</th></tr>
                            <tr>
                                <td>Usuario:<br><input type="text" name="filtro-usuario" value="" placeholder="usuario"></td>
                                <td>Producto:<br><input type="text" name="filtro-producto" value="" placeholder="producto"></td>
                                <td>Fecha:<br><input type="text" name="filtro-fecha" value="" placeholder="YYYY-MM-DD"></td>
                                <td>&nbsp;<br><input type="submit" value="Filtrar" name="filtrar" class="btn intro"></td>
                            </tr>
                        </table>
                    </form>
                <br><br>
                    <table class="tabla-espacio centrar-tabla"> 
                        <tr class="centro">
                            <th>ID Pedido</th>
                            <th>Fecha</th>
                            <th>ID Usuario</th>
                            <th>Usuario</th>
                            <th>Productos (ID:nombre)</th>
                            <th>Estado</th>
                            <th>Acción</th>
                        </tr>
                        <tr>
                            <td colspan="6"><hr class="hr-gris" style="width: 100%"></td>
                        </tr>

                        <?php getPedidos($filtro_usuario,$filtro_producto,$filtro_fecha); ?>
                        
                    </table>
                <script>
                var toggler = document.getElementsByClassName("flecha");
                var i;

                for (i = 0; i < toggler.length; i++) {
                  toggler[i].addEventListener("click", function() {
                    this.parentElement.querySelector(".oculta").classList.toggle("activa");
                    this.classList.toggle("flecha-abajo");
                  });
                }
                </script>
                <br><br>
                </div>
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
