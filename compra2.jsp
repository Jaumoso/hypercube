<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" import="p2.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>&nbsp;</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <% AccesoBD con = AccesoBD.getInstance();
        ArrayList<Producto> productos = (ArrayList) session.getAttribute("carritoProcesado");
        String usuario = (String)session.getAttribute("usuario");
        UsuarioBD user = con.descargaDatosUsuario(usuario);
        
        String nombre = user.getNombre();
        String apellidos = user.getApellidos();
        String domicilio = user.getDomicilio();
        String cp = user.getCp();
        String poblacion = user.getPoblacion();
        float total = 0;
        boolean block = false;
        boolean stop = productos.isEmpty();
        int diferencia = 0;
        %>

        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho" >
                    <tr>
                        <td></td>
                        <td><h1>Tiquet Pedido</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <br>
                
                <div>
                    <table class='tabla-espacio centrar-tabla inputbox borde-tabla-gris'>
                        <tr class="centro">
                            <th colspan="4">DATOS DEL PEDIDO</th>
                        </tr>
                        <tr class="centro">
                            <th>ID</th>
                            <th>Producto</th>
                            <th>Unidades</th>
                            <th>Precio</th>
                        </tr>
                    <%
                        for(Producto producto : productos){
                        int id_producto = producto.getId_producto();
                        String nombre_prod = producto.getNombre();
                        float precio = producto.getPrecio();
                        int cantidad = producto.getCantidad();
                      
                        total = total + precio * cantidad;
                        
                        int resultado = 0;
                        resultado = con.comprobarExistencias(usuario,producto);
                        if(resultado < 0){
                            block = true;
                        }
                        
                        // esto es para que el numero no sea negativo cuando se muestre. Vaya lío.
                        diferencia = resultado - resultado * 2;
                    %>
                    <tr>
                            <td><%=id_producto%></td>
                            <td><%=nombre_prod%></td>
                            <%
                            if(resultado < 0){
                            %>
                            <td class="centro rojo"><%=cantidad%> ❌ Excede en: <%=diferencia%></td>
                            <%
                            }
                            else{
                            %>
                            <td class="centro"><%=cantidad%></td>
                            <%
                            }
                            %>
                            <td class="centro"><%=precio%> €</td>
                        </tr>
                    <%
                    }
                    %>
                    <tr class='centro'>
                            <td colspan='3' id='izquierda'><b>Total:</b></td>
                            <td><b><%=total%> €</b></td>
                    </tr>
                    <tr>
                        <td colspan='4'><hr class='hr-gris'></td>
                    </tr>
                    <tr>
                        <th colspan="4" class="centro">DATOS DE FACTURACIÓN</th>
                    </tr>
                    <tr class="centro">
                        <td colspan="4">Método de pago:</td>
                    </tr>
                    <tr class="centro">
                        <td colspan="2"><input type="radio" name="metodo-pago" value="0" onchange="mostrar(this.value);" required>Tarjeta de crédito / débito.</td>
                        <td colspan="2"><input type="radio" name="metodo-pago" value="1" onchange="mostrar(this.value)" required>Transferencia.</td>
                    </tr>
                    <tr><td colspan="4"></td></tr>
                    <tr id="elemento1" class="centro"></tr>
                    <tr id="elemento2" class="centro"></tr>
                    <tr id="elemento3" class="centro"></tr>
                    <tr>
                        <td colspan='4'><hr class='hr-gris'></td>
                    </tr>
                    <tr class="centro">
                        <th colspan="4">DATOS DE ENVÍO</th>
                    </tr>
                    <tr class="centro">
                        <td colspan="4">Puedes cambiar la dirección de entrega aquí</td>
                    </tr>
                    <tr><td colspan="4"></td></tr>
                    <tr>
                        <td colspan='2'><%=apellidos%>, <%=nombre%></td>
                        <td colspan="2"></td>
                    </tr>
                    <tr class="centro">
                        <td colspan="4"><input type="text" name="domicilio" value="<%=domicilio%>" placeholder="Domicilio" required></td>
                    </tr>
                    <tr class="centro">
                        <td colspan="2"><input type="text" name="cp" value="<%=cp%>" placeholder="Código Postal" required></td>
                        <td colspan="2"><input type="text" name="poblacion" value="<%=poblacion%>" placeholder="Población" required>
                    </tr>
                    <tr><td></td></tr>
                    </table>
                </div>
                
                <table class="tabla-espacio centrar-tabla">
                <tr>
                    
                    <%
                    if(block == true){
                    %>
                    <td><input type="button" value="Formalizar compra" class="btn intro-sinexistencias" onclick='alert("No tenemos suficientes existencias. Su pedido excede el número de productos que tenemos en los almacenes. Disculpe las molestias.")'></td>
                    <%
                    }
                    if(stop == true){
                    %>
                    <td><input type="button" value="Formalizar compra" class="btn intro-sinexistencias" onclick='alert("El carrito está vacío, no puedes proceder con la compra.")'></td>
                    <%
                    }
                    if(block == false && stop == false){
                    %>
                    <td><input type="button" value="Formalizar compra" class="btn intro" onclick='EnviarCarrito("../TramitarPedido","cuerpo",carrito)'></td>
                    <%
                    }
                    %>
                    <td><input type="button" value="Cancelar compra" class="btn intro" onclick='Cargar("../html/compra.html","cuerpo")'></td>
                </tr>
            </table>
                <br>
           </div>
        </div>
        <br><br><br><br><br><br><br>
    </body>
</html>
