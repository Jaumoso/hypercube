<%@page import="p2.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <title>&nbsp;</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/listaProductos.js"></script>
    </head>
    <body>
        <%
        AccesoBD con = AccesoBD.getInstance();
        String usuario = (String)session.getAttribute("usuario");
        ArrayList<PedidoBD> pedidos = con.getPedidos(usuario);
        ArrayList<DetallesBD> detalles;
        
        boolean sinpedidos = pedidos.isEmpty();
        %>
        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1>Gestión de Pedidos</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <br>
                <table class="centro tabla-espacio centrar-tabla">
                <tr>
                    <th>ID del pedido</th>
                    <th>Fecha</th>
                    <th>Productos<br> (ID:cantidad:nombre)</th>
                    <th>Importe</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
                <tr>
                    <td colspan="5"><hr class="hr-gris"></td> 
                </tr>
                <%
                if(sinpedidos == true){
                %>
                <tr>
                    <td colspan="5" class="centro"><p>Sin pedidos que mostrar.</p></td>
                </tr>
                <%
                }
                for(PedidoBD pedido : pedidos){
                    int id_pedido = pedido.getId_pedido();
                    String fecha = pedido.getFecha();
                    float importe = pedido.getImporte();
                    int estado = pedido.getEstado();
                    
                    detalles = con.getDetalles(id_pedido);
                    
                    // CANCELA EL PEDIDO SI NO HAY DETALLES
                    int tam = detalles.size();
                    if(tam == 0){
                        estado = 3;
                    }


                    String situacion = "";
                    // PENDIENTE = 0
                    // ENVIADO = 1
                    // ENTREGADO = 2
                    // CANCELADO = 3

                    if(estado == 0){situacion = "Pendiente";}
                    if(estado == 1){situacion = "Enviado";}
                    if(estado == 2){situacion = "Entregado";}
                    if(estado == 3){situacion = "Cancelado";}
                %>
                <tr>
                    <td><%=id_pedido%></td>
                    <td><%=fecha%></td>
                    <td style="min-width: 400px;">
                        <ul id="lista-productos">
                            <li><span class="flecha">Productos</span>
                                <ul class="oculta">
                    <%
                    for(DetallesBD detalle : detalles){
                        int id_producto = detalle.getCodigo_producto();
                        String nombre = con.getNombreProducto(id_producto);
                        int unidades = detalle.getUnidades();
                    %>
                    <li id="izquierda">
                        
                        <form method="post" onsubmit="ProcesarForm(this, '../CancelarProducto','cuerpo');return false">
                        <input type="hidden" name="id_pedido" value="<%=id_pedido%>">
                        <input type="hidden" name="id_producto" value="<%=id_producto%>">
                        <button class="boton-papelera intro" type="submit"><i class="fa fa-trash"></i></button>&nbsp;[<%=id_producto%>] - [x<%=unidades%>] - <%=nombre%>
                        </form>
                    </li>
                    <%
                    }
                    %>
                                </ul>
                            </li>
                        </ul>
                    </td>
                    <td><%=importe%> €</td>
                    <td><%=situacion%></td>
                    <td>
                        <%if(estado == 0){%>   
                        <form method="post" onsubmit="ProcesarForm(this, '../CancelarPedido','cuerpo');return false">
                        <input type="submit" class="btn intro" value="Cancelar pedido"> 
                        <input type="hidden" name="id_pedido" value="<%=id_pedido%>">
                        </form>
                        <% } else{%>   &nbsp;   <% } %>
                    </td>
                </tr>
                <%
                }
                %>
                <tr>
                    <td colspan="5"><hr class="hr-gris"></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="5"><input type="button" value="Volver" class="btn intro" onclick='Cargar("../html/usuario2.jsp","cuerpo")'></td>
                </tr>
            </table>
                <br><br>
            </div>
            <br><br><br><br>
        </div>
    </body>
</html>
