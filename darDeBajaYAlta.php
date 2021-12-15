<?php
include('basedatos.php');

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 

if(isset($_POST['alta'])){
    darDeAlta($_POST['id_usuario']);
}
if(isset($_POST['baja'])){
    darDeBaja($_POST['id_usuario']);
}
else{
    echo 'Error';
    echo $_POST['id_usuario'];
}

?>
