/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var toggler = document.getElementsByClassName("flecha");
var i;

for (i = 0; i < toggler.length; i++) {
  toggler[i].addEventListener("click", function() {
    this.parentElement.querySelector(".oculta").classList.toggle("activa");
    this.classList.toggle("flecha-abajo");
  });
}
