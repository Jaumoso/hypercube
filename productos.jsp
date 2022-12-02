<%@page import="java.util.List"%>
<%@page contentType="text/html" import="p2.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>Productos - HyperCube</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <% AccesoBD con = AccesoBD.getInstance();
        List<ProductoBD> productos = con.obtenerProductosBD();
        %>
        
        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1>Cat&aacute;logo de Productos</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <br>
                <!--<div class="row-prod">-->
                <% 
                    int i = 0;
                    for(ProductoBD producto : productos){
                        int id_producto = producto.getIdProducto();
                        String nombre = producto.getNombre();
                        float precio = producto.getPrecio();
                        int existencias = producto.getStock();
                        String imagen = producto.getImagen();
                        String descripcion = producto.getDescripcion();
                        String marca = producto.getMarca();
                        
                        if(i%5 == 0){
                %>
                <div class="row-prod">
                <%
                        }
                        i++;
                %>
                    <div class="column-prod">
                        <div class="card">
                            <img src="<%=imagen%>" alt="<%=nombre%>" class="foto-cubo">
                            <p class="nombre-cubo"><b><%=nombre%></b></p>
                            <p class="marca-cubo"><%=marca%></p>
                            <p class="precio-cubo"><%=precio + "€"%></p>
                            <p class="descripcion-cubo">
                                <%=descripcion%>
                            </p>
                            <%
                            if(existencias > 0){
                            %>
                            <input type="button" value="Añadir al carrito" class="btn intro" onclick="anyadirCarrito(<%=id_producto%>, '<%=nombre%>', <%=precio%>);Cargar('../html/carrito.html', 'cuerpo')">
                            <%
                            }
                            else{
                            %>
                            <p class="existencias">SIN EXISTENCAS</p>
                            <%
                            }
                            %>
                        </div>
                    </div>
                    <%
                        if(i%5 == 0){
                    %>
                </div>
                    <%
                        }    
                    }
                    %>
                    
        <!--
        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1>Cat&acute;logo de Productos</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <br>
                
                <div class="row-prod">
                    <div class="column-prod">
                        <div class="card">
                            <img src="../imagenes/rubik3x3.jpg" alt class="foto-cubo">
                            <p class="nombre-cubo"><b>Cubo 3x3 - Classic</b></p>
                            <p class="marca-cubo">Rubik Oficial</p>
                            <p class="precio-cubo">11.99Є</p>
                            <p class="descripcion-cubo">
                                 - Oficial de la marca Rubik
                            </p>
                            <input type="button" value="Añadir al carrito" class="btn intro">
                        </div>
                    </div>
                    <div class="column-prod">    
                        <div class="card">
                            <img src="../imagenes/lunaoo2x2.jpg" alt class="foto-cubo">
                            <p class="nombre-cubo"><b>Cubo 2x2</b></p>
                            <p class="marca-cubo">Lunaoo</p>
                            <p class="precio-cubo">8.99Ð</p>
                            <p class="descripcion-cubo">
                                - Apto para Speedcubing
                            </p>
                            <input type="button" value="Añadir al carrito" class="btn intro" onclick="anyadirCarrito(2, 'Cubo 2x2', 8.99);Cargar('../html/carrito.html', 'cuerpo')">
                        </div>
                    </div>
                    <div class="column-prod">    
                        <div class="card">
                            <img src="../imagenes/maomaoyu2x2.jpg" alt class="foto-cubo">
                            <p class="nombre-cubo"><b>Cubo 2x2 - Fibra de Carbono</b></p>
                            <p class="marca-cubo">Maomaoyu</p>
                            <p class="precio-cubo">19.94Ð</p>
                            <p class="descripcion-cubo">
                                - Apto para Speedcubing<br>
                                - Cuerpo de fibra de carbono
                            </p>
                            <input type="button" value="AÃ±adir al carrito" class="btn intro" onclick="anyadirCarrito(3, 'Cubo 2x2 - Fibra de Carbono', 19.94);Cargar('../html/carrito.html', 'cuerpo')">
                        </div>
                    </div>
                    <div class="column-prod">    
                        <div class="card">
                            <img src="../imagenes/lsmy4x4.jpg" alt class="foto-cubo">
                            <p class="nombre-cubo"><b>Cubo 4x4 - Fibra de Carbono</b></p>
                            <p class="marca-cubo">LSMY</p>
                            <p class="precio-cubo">20.50Ð</p>
                            <p class="descripcion-cubo">
                                - Apto para Speedcubing<br>
                                - Cuerpo de fibra de carbono
                            </p>
                            <input type="button" value="Añadir al carrito" class="btn intro" onclick="anyadirCarrito(4, 'Cubo 4x4 - Fibra de Carbono', 20.50);Cargar('../html/carrito.html', 'cuerpo')">
                        </div>
                    </div>
                    <div class="column-prod">    
                        <div class="card">
                            <img src="../imagenes/ghost3x3.jpg" alt class="foto-cubo">
                            <p class="nombre-cubo"><b>Ghost - 3x3 rotado</b></p>
                            <p class="marca-cubo">Meffert's</p>
                            <p class="precio-cubo">22.99Ð</p>
                            <p class="descripcion-cubo">
                                - DesafÃ­o adicional
                            </p>
                            <input type="button" value="AÃ±adir al carrito" class="btn intro" onclick="anyadirCarrito(5, 'Ghost - 3x3 rotado', 22.99);Cargar('../html/carrito.html', 'cuerpo')">
                        </div>
                    </div>
                </div>
                
                <div class="row-prod">
                    <div class="column-prod">    
                        <div class="card">
                            <img src="../imagenes/mirror3x3.jpg" alt class="foto-cubo">
                            <p class="nombre-cubo"><b>Mirror 3x3</b></p>
                            <p class="marca-cubo">MEISHINE</p>
                            <p class="precio-cubo">10.99Ð</p>
                            <p class="descripcion-cubo">
                                - DesafÃ­o adicional<br>
                                - Color dorado
                            </p>
                            <input type="button" value="AÃ±adir al carrito" class="btn intro" onclick="anyadirCarrito(6, 'Mirror 3x3', 10.99);Cargar('../html/carrito.html', 'cuerpo')">
                        </div>
                    </div>
                    <div class="column-prod">    
                        <div class="card">
                            <img src="../imagenes/base.jpg" alt class="foto-cubo">
                            <p class="nombre-cubo"><b>Soporte para cubo</b></p>
                            <p class="marca-cubo">Runrain</p>
                            <p class="precio-cubo">2.42Ð</p>
                            <p class="descripcion-cubo">
                                - Accesorio para cubos<br>
                                - Amplia gama de colores
                            </p>
                            <input type="button" value="AÃ±adir al carrito" class="btn intro" onclick="anyadirCarrito(7, 'Soporte para cubo', 2.42);Cargar('../html/carrito.html', 'cuerpo')">
                        </div>
                    </div>
                    <div class="column-prod">    
                        <div class="card">
                            <img src="../imagenes/lubricante.jpg" alt class="foto-cubo">
                            <p class="nombre-cubo"><b>Lubricante para cubos</b></p>
                            <p class="marca-cubo">Maru</p>
                            <p class="precio-cubo">1.45Ð</p>
                            <p class="descripcion-cubo">
                                - Herramienta de cuidado de cubos<br>
                                - Botella pequeÃ±a 10 ml<br>
                                - No volÃ¡til<br>
                                -InsÃ­pido y no tÃ³xico<br>
                            </p>
                            <input type="button" value="AÃ±adir al carrito" class="btn intro" onclick="anyadirCarrito(8, 'Lubricante para cubos', 1.45);Cargar('../html/carrito.html', 'cuerpo')"">
                        </div>
                    </div>
                </div>
                -->
                
            </div>
            <br><br><br><br><br><br><br>
        </div>
    </body>
</html>
