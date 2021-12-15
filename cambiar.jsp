<%-- 
    Document   : cambiar
    Created on : 04-may-2021, 16:45:28
    Author     : jaumo
--%>

<%@page language="java" import="p2.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/style.css" type="text/css"/>
        <title>&nbsp;</title>
    </head>
    <body>
        <% AccesoBD con = AccesoBD.getInstance();
        
        UsuarioBD usuarioActual = con.descargaDatosUsuario((String)session.getAttribute("usuario"));
        String mensaje = (String)session.getAttribute("mensaje");
                
        String usuario = usuarioActual.getUsuario();
        String clave = usuarioActual.getClave();
        String nombre = usuarioActual.getNombre();
        String apellidos = usuarioActual.getApellidos();
        String domicilio = usuarioActual.getDomicilio();
        String poblacion = usuarioActual.getPoblacion();
        String provincia = usuarioActual.getProvincia();
        String cp = usuarioActual.getCp();
        String telefono = usuarioActual.getTelefono();
        %>
        
        <div class="centrar-contenido">
            <div class="recuadro">
                 <table class="ancho">
                    <tr>
                        <td></td>
                        <td><h1>Cambiar Datos</h1>
                        <hr class="hr-naranja"></td>
                    </tr>
                </table>
                <br>
                <%
                        if (mensaje != null) { //Eliminamos el mensaje consumido
                            session.removeAttribute("mensaje");
                %>
                <p class="recuadro centro"><%=mensaje%></p>
                <%
                }
                else{
                %>
                <br>
                <%
                }
                %>
                    <form method="post" onsubmit="ProcesarForm(this,'../CambiarDatosUsuario','cuerpo');return false">
                        <table class="inputbox tabla-espacio centrar-tabla">
                            <tr>
                                <td>Usuario:</td>
                                <td><input type="text" value="<%=usuario%>" name="usuario" disabled></td>
                                <td>~ El usuario no se puede cambiar.
                            </tr>
                            <tr>
                                <td>Clave:</td>
                                <td><input type="password" value="<%=clave%>" name="clave" required></td>
                                <td>Vuelva a introducir la clave:</td>
                                <td><input type="password" value="<%=clave%>" name="clave2" required></td>
                            </tr>
                            <tr>
                                <td>Nombre:</td>
                                <td><input type="text" value="<%=nombre%>" name="nombre" required></td>
                                <td>Apellidos:</td>
                                <td><input type="text" value="<%=apellidos%>" name="apellidos" required></td>
                            </tr>
                            <tr>
                                <td>Domicilio:</td>
                                <td><input type="text" value="<%=domicilio%>" name="domicilio" required></td>
                                <td>Población:</td>
                                <td><input type="text" value="<%=poblacion%>" name="poblacion" required></td>
                            </tr>
                            <tr>
                                <td><label for="provincia">Provincia</label></td>
                                <td>
                                    <select id="provincia" name="provincia" class="desplegable" required>
                                    <option value="<%=provincia%>"><%=provincia%></option>
                                    <option value="Alava">Álava</option>
                                    <option value="Albacete">Albacete</option>
                                    <option value="Alicante">Alicante</option>
                                    <option value="Almeria">Almería</option>
                                    <option value="Asturias">Asturias</option>
                                    <option value="Avila">Ávila</option>
                                    <option value="Badajoz">Badajoz</option>
                                    <option value="Barcelona">Barcelona</option>
                                    <option value="Burgos">Burgos</option>
                                    <option value="Caceres">Cáceres</option>
                                    <option value="Cadiz">Cádiz</option>
                                    <option value="Castellon">Castellón</option>
                                    <option value="Ciudad Real">Ciudad Real</option>
                                    <option value="Cordoba">Córdoba</option>
                                    <option value="Cuenca">Cuenca</option>
                                    <option value="Gerona">Gerona</option>
                                    <option value="Granada">Granada</option>
                                    <option value="Guadalajara">Guadalajara</option>
                                    <option value="Guipuzcoa">Guipúzcoa</option>
                                    <option value="Huelva">Huelva</option>
                                    <option value="Huesca">Huesca</option>
                                    <option value="Islas Baleares">Islas Baleares</option>
                                    <option value="Jaen">Jaén</option>
                                    <option value="La Corunya">La Coruña</option>
                                    <option value="La Rioja">La Rioja</option>
                                    <option value="Las Palmas">Las Palmas</option>
                                    <option value="Leon">León</option>
                                    <option value="Lerida">Lérida</option>
                                    <option value="Lugo">Lugo</option>
                                    <option value="Madrid">Madrid</option>
                                    <option value="Malaga">Málaga</option>
                                    <option value="Murcia">Murcia</option>
                                    <option value="Navarra">Navarra</option>
                                    <option value="Orense">Orense</option>
                                    <option value="Palencia">Palencia</option>
                                    <option value="Pontevedra">Pontevedra</option>
                                    <option value="Salamanca">Salamanca</option>
                                    <option value="Santa Cruz de Tenerife">Santa Cruz de Tenerife</option>
                                    <option value="Segovia">Segovia</option>
                                    <option value="Sevilla">Sevilla</option>
                                    <option value="Soria">Soria</option>
                                    <option value="Tarragona">Tarragona</option>
                                    <option value="Teruel">Teruel</option>
                                    <option value="Toledo">Toledo</option>
                                    <option value="Valencia">Valencia</option>
                                    <option value="Valladolid">Valladolid</option>
                                    <option value="Vizcaya">Vizcaya</option>
                                    <option value="Zamora">Zamora</option>
                                    <option value="Zaragoza">Zaragoza</option>
                                    </select>
                                </td>
                                <td>Código Postal:</td>
                                <td><input type="text" name="cp" value="<%=cp%>" placeholder="XXXXX" maxlength="5" required></td>
                            </tr>
                            <tr>
                                <td>Telefóno:</td>
                                <td><input type="text" value="<%=telefono%>" name="telefono" required></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                        <table class="inputbox tabla-espacio centrar-tabla">
                            <tr class="centro">
                                <td><input type="submit" value="Cambiar" class="btn intro"></td>
                                <td><input type="button" value="Cancelar" class="btn intro" onclick='Cargar("../html/usuario2.jsp","cuerpo")'></td>
                            </tr>
                        </table>
                    </form>
                <br><br>
            </div>
            <br><br><br><br>
        </div>
    </body>
</html>
