/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var header = document.getElementById("myTopnav");
var btns = header.getElementsByClassName("selec");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  if (current.length > 0) { 
    current[0].className = current[0].className.replace(" active", "");
  }
  this.className += " active";
  });
}
/*
function cambiopestanya(id){
    var x = document.getElementsByClassName('active');
    x[0].classList.remove('active');
    var y = document.getElementById(id).classList.add('active');
}
*/
