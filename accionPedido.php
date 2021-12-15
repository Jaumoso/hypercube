<?php
include('basedatos.php');

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 

if(isset($_POST['enviar'])){
    enviarPedido($_POST['id_pedido']);
}
if(isset($_POST['entregado'])){
    pedidoEntregado($_POST['id_pedido']);
}
else{
    echo 'Error';
    echo $_POST['id_pedido'];
}
?>
