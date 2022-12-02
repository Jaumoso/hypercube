<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <title>TODO supply a title</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="centrar-contenido">
            <div class="recuadro">
                    <table class="ancho">
                        <tr>
                            <td></td>
                            <td><h1>Registro Nuevo Usuario</h1>
                            <hr class="hr-naranja"></td>
                        </tr>
                    </table>
                <form method="post" onsubmit="ProcesarForm(this,'../RegistroNuevoUsuario','cuerpo');return false">
                    <table class="inputbox tabla-espacio centrar-tabla">
                        <tr>
                            <td>Usuario:</td>                    
                            <td><input type="text" name="usuario" placeholder="3-15 caracteres" required></td>
                            <td>Clave:</td>
                            <td><input type="text" name="clave" placeholder="···············" required></td>
                        </tr>
                        <tr>
                            <td>Nombre:</td>
                            <td><input type="text" name="nombre" placeholder="Nombre" required></td>
                            <td>Apellidos:</td>
                            <td><input type="text" name="apellidos" placeholder="Apellido Apellido" required></td>
                        </tr>
                        <tr>
                            <td>Domicilio:</td>
                            <td><input type="text" name="domicilio" placeholder="Av. Tu Casa, X, XX " required></td>
                            <td>Población:</td>
                            <td><input type="text" name="poblacion" placeholder="Población" required></td>
                        </tr>
                        <tr>
                            <td><label for="provincia">Provincia</label></td>
                            <td>
                                <select id="provincia" name="provincia" class="desplegable" required>
                                <option value="">Seleccione una provincia</option>
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
                            <td><input type="text" name="cp" placeholder="XXXXX" maxlength="5"  required></td>
                        </tr>
                        <tr>
                            <td>Telefono:</td>
                            <td><input type="text" name="telefono" maxlength="9" placeholder="XXXXXXXXX" required></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr class="centro">
                            <td colspan="4"><input type="submit" value="Registrarse" class="btn intro"></td>
                        </tr>
                    </table>
                </form>
              <br><br>
            </div>
            <br><br><br><br>
        </div>
    </body>
</html>
