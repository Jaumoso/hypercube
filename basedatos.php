<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function conectar(){
    
    $bbdd = mysqli_connect("localhost", "root", "", "hypercube");
    
    if (mysqli_connect_error()) {
        printf("Error conectando a la base de datos: %s\n",mysqli_connect_error());
        exit();
    }
return $bbdd;
}

function desconectar($bbdd){
    mysqli_close($bbdd);
}


////////////////////////////////////////
//                                    //
//      ADMINISTRACION USUARIOS       //
//                                    //
////////////////////////////////////////

function darDeBaja($id_usuario){

        $bbdd = conectar();
        $resultado;
        if($resultado = mysqli_prepare($bbdd,"UPDATE usuarios SET activo='0' WHERE id_usuario=?;")){
            mysqli_stmt_bind_param($resultado,"i",$id_usuario);

                mysqli_stmt_execute($resultado);
        //        mysqli_stmt_fetch($resultado);
                mysqli_stmt_close($resultado);
                $_SESSION['mensaje'] = "Usuario dado de baja correctamente.";
        }
        else{
//            echo 'Error al ejecutar la consulta a la base de datos.';
            $_SESSION['mensaje'] = "Error al intentar cambiar el estado.";
        }
        desconectar($bbdd);
        header("Location: ad_usuarios.php");
}


function darDeAlta($id_usuario){
    

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


function getUsuarios(){
$bbdd = conectar();

$id_usuario_db;
$usuario_db;
$estado;
    
$fila[] = NULL;
if($resultado = mysqli_query($bbdd,"SELECT id_usuario,usuario,activo FROM usuarios;")){
while($fila = mysqli_fetch_row($resultado)){
    
    $id_usuario_db = $fila[0];
    $usuario_db = $fila[1];
    $activo = $fila[2];
    if($activo == 1){
        $estado = "Activo";
    }
    if($activo == 0){
        $estado = "Inactivo";
    }

?>
    <tr class="centro">
        <td><?php echo $id_usuario_db; ?></td>
        <td><?php echo $usuario_db; ?></td> 
        
        <?php if($activo == 1){ ?>
        <td><span class="usuario-activo"><?php echo $estado; ?></span></td>
        <td>
            <form action="darDeBajaYAlta.php" method="post">
                <input type="hidden" name="id_usuario" value="<?php echo ($id_usuario_db); ?>"/>
                <input type="submit" class="btn intro" name="baja" value="Dar de Baja">
            </form>
            <?php } if($activo == 0){ ?>
            <td><span class="usuario-inactivo"><?php echo $estado; ?></span></td>
            <td>
                <form action="darDeBajaYAlta.php" method="post">
                <input type="hidden" name="id_usuario" value="<?php echo ($id_usuario_db); ?>"/>
                <input type="submit" class="btn intro" name="alta" value="Dar de Alta">
                </form>
            <?php } ?>
        </td>
    </tr>
<?php
}
mysqli_free_result($resultado);
}
else{
    echo 'Error al ejecutar la consulta a la base de datos.';
}
desconectar($bbdd);
}


////////////////////////////////////////
//                                    //
//      ADMINISTRACION PRODUCTOS      //
//                                    //
////////////////////////////////////////


function getProductos(){
    
    
$bbdd = conectar();

$id_producto;
$nombre;
$descripcion;
$marca;
$precio;
$existencias;
$imagen;
    
$fila[] = NULL;
if($resultado = mysqli_query($bbdd,"SELECT id_producto,nombre,descripcion,marca,precio,existencias,imagen FROM productos;")){
while($fila = mysqli_fetch_row($resultado)){
    
    $id_producto = $fila[0];
    $nombre = $fila[1];
    $descripcion = $fila[2];
    $marca = $fila[3];
    $precio = $fila[4];
    $existencias = $fila[5];
    $imagen = $fila[6];

?>
    <tr class="centro">
    <form method="post" action="modificarProducto.php">
        <td><?php echo $id_producto ?><input type="hidden" name="id_producto" value="<?php echo $id_producto ?>"></td>
        <td><input type="text" name="nombre" value="<?php echo $nombre ?>"></td>
        <td><input type="text" name="descripcion" value="<?php echo $descripcion ?>"></td>
        <td><input type="text" name="marca" value="<?php echo $marca ?>"></td>
        <td><input type="text" name="precio" value="<?php echo $precio ?>"></td>
        <td><input type="text" name="existencias" value="<?php echo $existencias ?>"></td>
        <td><input type="text" name="imagen" value="<?php echo $imagen ?>"></td>
        <td><input type="submit" name="modificarProducto" value="Modificar" class="btn intro"></td>
    </form>
    </tr>
    
<?php
}
mysqli_free_result($resultado);
}
else{
    echo 'Error al ejecutar la consulta a la base de datos.';
}
desconectar($bbdd);
}



////////////////////////////////////////
//                                    //
//      ADMINISTRACION PEDIDOS        //
//                                    //
////////////////////////////////////////



function getPedidos($filtro_usuario, $filtro_producto, $filtro_fecha){
    
$bbdd = conectar();

//// CONVERSIÓN DE ID A NOMBRE USUARIO 
//if(is_int($filtro_usuario)){
//    if($obtener_usuario = mysqli_query($bbdd, "SELECT usuario FROM usuarios WHERE usuario='$filtro_usuario';")){
//        $res = mysqli_fetch_row($obtener_usuario);
//        $usuario_filtro = $res[0];
//    }
//    else{
//        echo 'Error al obtener el ID_usuario a partir del nombre de la base de datos';
//    }
//}
//else{
//    $usuario_filtro = $filtro_usuario;
//}
//
//// CONVERSIÓN DE ID A NOMBRE PRODUCTO
//if(is_int($filtro_producto)){
//    if($obtener_producto = mysqli_query($bbdd, "SELECT id_producto FROM productos WHERE nombre='$filtro_producto';")){
//        $res = mysqli_fetch_row($obtener_producto);
//        $producto_filtro = $res[0];
//    }
//    else{
//        echo 'Error al obtener el ID_producto a partir del nombre de la base de datos';
//    }
//}
//else{
//    $producto_filtro = $filtro_producto;
//}

$usuario_filtro = $filtro_usuario;
$producto_filtro = $filtro_producto;

if($filtro_usuario != null && $filtro_producto != null && $filtro_fecha != null){$consulta = "SELECT DISTINCT pedidos.id_pedido, pedidos.persona, pedidos.fecha, pedidos.importe, pedidos.estado FROM pedidos LEFT JOIN usuarios ON pedidos.persona = usuarios.id_usuario, productos WHERE usuarios.usuario LIKE '%$usuario_filtro%' AND productos.nombre LIKE '%$producto_filtro%' AND pedidos.fecha LIKE '%$filtro_fecha%';";}

//CONSULTA GENERAL
$consulta = "SELECT DISTINCT pedidos.id_pedido, pedidos.persona, pedidos.fecha, pedidos.importe, pedidos.estado FROM usuarios JOIN (pedidos JOIN (detalle JOIN productos ON detalle.codigo_producto = productos.id_producto) ON pedidos.id_pedido = detalle.codigo_pedido) ON usuarios.id_usuario = pedidos.persona WHERE usuarios.usuario LIKE '%$usuario_filtro%' AND productos.nombre LIKE '%$producto_filtro%' AND pedidos.fecha LIKE '%$filtro_fecha%';";
// CONSULTA GENERAL CON PREPARED STATEMENT
//$consulta = "SELECT DISTINCT pedidos.id_pedido, pedidos.persona, pedidos.fecha, pedidos.importe, pedidos.estado FROM usuarios JOIN (pedidos JOIN (detalle JOIN productos ON detalle.codigo_producto = productos.id_producto) ON pedidos.id_pedido = detalle.codigo_pedido) ON usuarios.id_usuario = pedidos.persona WHERE usuarios.usuario LIKE '%?%' AND productos.nombre LIKE '%?%' AND pedidos.fecha LIKE '%?%';";
// SELECT DISTINCT para resultados unicos


$id_pedido;
$fecha;
$estado;
$importe;
$id_usuario;
$usuario;
$situacion;

$fila[] = NULL;
if($resultado = mysqli_query($bbdd,$consulta)){
while($fila = mysqli_fetch_row($resultado)){
    
    $id_pedido = $fila[0];
    $id_usuario = $fila[1];
    $fecha = $fila[2];
    $importe = $fila[3];
    $estado = $fila[4];
    
    if($estado == 0){$situacion = "Pendiente";}
    if($estado == 1){$situacion = "Enviado";}
    if($estado == 2){$situacion = "Entregado";}
    if($estado == 3){$situacion = "Cancelado";}
    
    if($obtener_usuario = mysqli_query($bbdd, "SELECT usuario FROM usuarios WHERE id_usuario= $id_usuario")){
        $res = mysqli_fetch_row($obtener_usuario);
        $usuario = $res[0];
    }
    else{
        echo 'Error al filtrar los pedidos en la base de datos';
    }

//if($resultado = mysqli_prepare($bbdd,$consulta)){
//    mysqli_stmt_bind_param($resultado, "sss", $usuario_filtro, $producto_filtro, $filtro_fecha);
//    mysqli_stmt_execute($resultado);
//    mysqli_stmt_bind_result($resultado,$id_pedido,$id_usuario,$fecha,$importe,$estado);
//    while(mysqli_stmt_fetch($resultado)){
//        
//        if($estado == 0){$situacion = "Pendiente";}
//        if($estado == 1){$situacion = "Enviado";}
//        if($estado == 2){$situacion = "Entregado";}
//        if($estado == 3){$situacion = "Cancelado";}
//        
//        if($obtener_usuario = mysqli_query($bbdd, "SELECT usuario FROM usuarios WHERE id_usuario= $id_usuario")){
//            $res = mysqli_fetch_row($obtener_usuario);
//            $usuario = $res[0];
//        }
//        else{
//            echo 'Error al obtener el id_usuario de la base de datos.';
//        }

    ?>
    <tr class="centro">
        <td><?php echo $id_pedido; ?></td>
        <td><?php echo $fecha ?></td>
        <td><?php echo $id_usuario ?></td>
        <td><?php echo $usuario ?></td>
        <td style="min-width: 400px;">
            <ul id="lista-productos">
                <li><span class="flecha">Productos</span>
                    <ul class="oculta">
    <?php
    if($obtener_detalles = mysqli_query($bbdd, "SELECT `detalle`.`codigo_producto`, `productos`.`nombre` FROM `detalle` LEFT JOIN `productos` ON `detalle`.`codigo_producto` = `productos`.`id_producto` WHERE detalle.codigo_pedido = $id_pedido ;")){
        while($detalle = mysqli_fetch_row($obtener_detalles)){
            $id_producto = $detalle[0];
            $nombre_producto = $detalle[1];
    ?>
    <li id="izquierda">
        [<?php echo $id_producto; ?>] - <?php echo $nombre_producto; ?>
    </li>
                        
                        
    <?php

        }
    }
    else{
        echo 'Error en la consulta de los detalles del pedido.';
    }
    ?>
                    </ul>
                </li>
            </ul>
        </td>
        <td><?php echo $situacion ?></td>
            <?php if($estado == 0){ ?> 
        <td>
            <form action="accionPedido.php" method="post">
                <input type="hidden" name="id_pedido" value="<?php echo ($id_pedido); ?>"/>
                <input type="submit" class="btn intro" name="enviar" value="Enviar">
            </form>
        </td> <?php }?>
            <?php if($estado == 1){ ?> 
        <td>

            <form action="accionPedido.php" method="post">
                <input type="hidden" name="id_pedido" value="<?php echo ($id_pedido); ?>"/>
                <input type="submit" class="btn intro" name="entregado" value="Entregado">
            </form>
        </td> <?php }?>
            <?php if($estado == 2){ ?> <td> &nbsp; </td><?php }?>
            <?php if($estado == 3){ ?> <td> &nbsp; </td> <?php }?>
    </tr>
    
<?php
}
mysqli_free_result($resultado);
//    mysqli_stmt_close($resultado);
}
else{
    echo 'Error al ejecutar la consulta a la base de datos.';
}
desconectar($bbdd);
}



function enviarPedido($id_pedido){
    

        $bbdd = conectar();
        $resultado;
        if($resultado = mysqli_prepare($bbdd,"UPDATE pedidos SET estado='1' WHERE id_pedido=?;")){
            mysqli_stmt_bind_param($resultado,"i",$id_pedido);

                mysqli_stmt_execute($resultado);
        //        mysqli_stmt_fetch($resultado);
                mysqli_stmt_close($resultado);
                $_SESSION['mensaje'] = "Pedido enviado";
                
        }
        else{
//            echo 'Error al ejecutar la consulta a la base de datos.';
            $_SESSION['mensaje'] = "Error al intentar cambiar el estado.";
        }
        desconectar($bbdd);
        header("Location: ad_pedidos.php");
}




function pedidoEntregado($id_pedido){
    

        $bbdd = conectar();
        $resultado;
        if($resultado = mysqli_prepare($bbdd,"UPDATE pedidos SET estado='2' WHERE id_pedido=?;")){
            mysqli_stmt_bind_param($resultado,"i",$id_pedido);

                mysqli_stmt_execute($resultado);
        //        mysqli_stmt_fetch($resultado);
                mysqli_stmt_close($resultado);
                $_SESSION['mensaje'] = "Pedido entregado.";
        }
        else{
//            echo 'Error al ejecutar la consulta a la base de datos.';
            $_SESSION['mensaje'] = "Error al intentar cambiar el estado.";
        }
        desconectar($bbdd);
        header("Location: ad_pedidos.php");
}
