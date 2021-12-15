/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function mostrar(dato){
    var t = "";
    
    // TARJETA
    if(dato == 0){
        t += "<td colspan='4'>Número de la tarjeta:<br><input type='text' placeholder='XXXX XXXX XXXX XXXX'></td>";
        document.getElementById("elemento1").innerHTML=t;
        t = "";
        t += "<td colspan='2'>Fecha de Validez:</td>";
        t += "<td colspan='2'>Código de Seguridad:</td>";
        document.getElementById("elemento2").innerHTML=t;
        t = "";
        t += "<tr class='centro'>";
        t += "<td colspan='2'><input type='text' placeholder='MM/YY'></td>";
        t += "<td colspan='2'><input type='text' placeholder='XXX'></td>";
        document.getElementById("elemento3").innerHTML=t;
    }
    
    // TRANSFERENCIA
    if(dato == 1){
        t += "<td colspan='4'>Nombre del titular de la cuenta:<br><input type='text' placeholder='Nombre Apellido Apellido'></td>";
        document.getElementById("elemento1").innerHTML=t;
        t = "";
        t += "<td colspan='4'>Numero IBAN de la cuenta:<br><input type='text' placeholder='XXXX XXXX XXXX XXXX'></td>";
        document.getElementById("elemento2").innerHTML=t;
        t = "";
        document.getElementById("elemento3").innerHTML=t;
    }
}
