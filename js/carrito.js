/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var carrito = null;

function cargaInicialCarrito(){
    carrito = JSON.parse(localStorage.getItem("carrito"));
    if(carrito === null){
        carrito = new Object();
    }
}

function actualizarCarrito(){
    localStorage.removeItem("carrito");
    localStorage.setItem("carrito", JSON.stringify(carrito));
}


function anyadirCarrito(id_producto, nombre, precio){
    
    var p, encontrado = 0;
    for (p in carrito){
        if(carrito[p].id_producto === id_producto){
            carrito[p].cantidad++;
            encontrado = 1;
            break;
        }
    }
    if(encontrado === 0){
    var producto = { id_producto:id_producto, nombre:nombre, cantidad:1, precio:precio};
    carrito[id_producto] = producto;
    }
    actualizarCarrito();
}


function modificarCantidad(id_producto, unidades){
    var p, encontrado = 0;
    for(p in carrito){
        if(carrito[p].id_producto===id_producto && unidades > 0){
            carrito[p].cantidad = parseInt(unidades);
            alert("Cantidad del producto modificada a: " + carrito[p].cantidad);
            encontrado = 1;
            break;
        }
    }
    if(encontrado === 0){
//        alert("Error en modificarCantidad");
        if(unidades <= 0){
            eliminarProducto(id_producto);
        } 
    }
    
    actualizarCarrito();
}

function eliminarProducto(id_producto){
    var p, encontrado = 0;
    for(p in carrito){
        if(carrito[p].id_producto === id_producto){
            delete carrito[p];
//            alert("Producto eliminado del carrito");
            encontrado = 1;
            actualizarCarrito();
            break;
        }
    }
    if(encontrado === 0){
        alert("Error en eliminarProducto");
    }
    Cargar('../html/carrito.html', 'cuerpo');
}


function eliminarCarrito(){
    var p, encontrado = 0;
    var resp = confirm("¿Desea eliminar el carrito?");
    
    if(resp === true){
        
        for(p in carrito){
            delete carrito[p];
            encontrado = 1;
        }

        if(encontrado === 0){
            alert("Error al borrar carrito");
            alert("El carrito no contiene productos.");
        }

        actualizarCarrito();
        
    }  
Cargar('../html/carrito.html', 'cuerpo');

}

function actualizar(){location.reload(true);}

function getValor(p){
    var v = document.getElementById(p).value;
    return v;
}

function generaTablaCarrito(){
    var texto = "";
    texto += "<table class='inputbox tabla-espacio centrar-tabla class='inputbox-number''>";
    texto += "<tr>";
    texto += "<th>" + "ID" + "</th>";
    texto += "<th>" + "Descripción" + "</th>";
    texto += "<th>" + "Unidades" + "</th>";
    texto += "</tr>";

    for(var p in carrito){
        texto += "<tr>";
        texto += "<td>" + carrito[p].id_producto + "</td>";
        texto += "<td>" + carrito[p].nombre + "</td>";
        texto += "<td>" + "<input type='number'  id='" + p + "' value='" + carrito[p].cantidad + "' >" + "</td>";
        texto += "<td>" + "<input type='button' class='intro btn' value='Modificar cantidad' onclick='modificarCantidad(" + carrito[p].id_producto + "," + "getValor(" + p + ")" + ")'>" + "</td>";
        texto += "<td>" + "<input type='button' class='intro btn' value='Quitar del carrito' onclick='eliminarProducto(" + carrito[p].id_producto + ");generaTablaCarrito()'>" + "</td>";
        texto+= "</tr>";
    }

    texto += "</table>";
    return texto;
}

function sumaPrecios(){
    var n, total = 0;
    for(n in carrito){
        total = total + carrito[n].precio * carrito[n].cantidad;
    }
    return total;
}

function generaTablaCompra(){
    var texto = "";
    texto += "<table class='tabla-espacio centrar-tabla'>";
    texto += "<tr>";
    texto += "<th>" + "Descripción" + "</th>";
    texto += "<th>" + "Unidades" + "</th>";
    texto += "<th>" + "Precio" + "</th>";
    texto += "</tr>";
    
    for(var p in carrito){
        texto += "<tr class='centro'>";
        texto += "<td>" + carrito[p].nombre + "</td>";
        texto += "<td>" + carrito[p].cantidad + "</td>";
        var precio = carrito[p].precio * carrito[p].cantidad;
        texto += "<td>" + precio.toFixed(2) + "</td>";
        texto += "</tr>";
    }
    
    texto += "<tr>" + "<td colspan='3'>" + "<hr class='hr-gris'>" + "</td>" + "</tr>";
    texto += "<tr class='centro'>";
    texto += "<td>" + "<b>" + "Total:" + "</b>" + "</td>";
    texto += "<td></td>";
    texto += "<td><b>" + sumaPrecios().toFixed(2) + "</b></td>";
    texto += "</tr>";
    texto += "</table>";
    
    return texto;
}

//function generaTablaTiquet(){
//    var texto = "";
//    texto += "<table class='tabla-espacio centrar-tabla'>";
//    for(var p in carrito){
//        texto += "<tr class='centro'>";
//        texto += "<td id='izquierda'>" + carrito[p].nombre + "</td>";
//        texto += "<td>" + carrito[p].cantidad + "</td>";
//        var precio = carrito[p].precio * carrito[p].cantidad;
//        texto += "<td>" + precio.toFixed(2) + "</td>";
//        texto += "</tr>";
//    }
//    texto += "<tr>";
//    texto += "<td colspan='3'><hr class='hr-gris'></td>";
//    texto += "</tr>";
//    texto += "<tr class='centro'>";
//    texto += "<td colspan='2' id='izquierda'><b>Total:</b></td>";
//    texto += "<td><b>" + sumaPrecios().toFixed(2) + "</b></td>";
//    texto += "</tr>";
//    texto += "</table>";
//    
////    texto += "<tr>";
////    texto += "<td colspan='3'>Enrique Bonet<br>IRTIC<br>Catedrático Jose Beltrán 2<br>46980 Paterna</td>";
////    texto += "</tr>";
////    texto += "</table>";
//    
//    return texto;
//}

function borrarCarritoTrasPedido(){
    var p, encontrado = 0;
    
        for(p in carrito){
            delete carrito[p];
            encontrado = 1;
        }

        if(encontrado === 0){
            alert("Error al borrar carrito");
        }

        actualizarCarrito();
        
}  

function contacto(){
    var r = Math.floor(Math.random() * 10);
    switch(r){
        case 0:
            alert("NOPE");
            break;
        case 1: 
            alert("Me parece que no");
            break;
        case 2:
            alert("JAJAJAJAJAJAJ");
            break;
        case 3:
            alert("Ni lo intentes");
            break;
        case 4:
            alert("💩");
            break;
        case 5:
            alert(" * Button clicking intensifies... *");
            break;
        case 6:
            alert("¿Para ya no?");
            break;
        case 7:
            alert("Dejame en paz");
            break;
        case 8:
            alert("Compra algo primero o me enfado");
            break;
        case 9:
            alert("MARIA-HI MARIA-HU MARIA-HO MARIA-HA-HA");
            break;
    }
}
