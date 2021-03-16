/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function cambiopestanya(id){
    var x = document.getElementsByClassName('active');
    x[0].classList.remove('active');
    var y = document.getElementById(id).classList.add('active');
}

