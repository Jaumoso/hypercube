/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p2;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 *
 * @author jaumo
 */
public final class AccesoBD {

    private static AccesoBD instanciaUnica = null;
    private Connection conexionBD = null;
    
    public static AccesoBD getInstance(){
        if (instanciaUnica == null){
            instanciaUnica = new AccesoBD();
        }
        return instanciaUnica;
    }
    
    private AccesoBD(){
        abrirConexionBD();
    }
    
    public void abrirConexionBD(){
        if(conexionBD == null){
            // hypercube es el nombre de la base de datos que hemos creado con anterioridad.
            String nombreConexionBD = "jdbc:mysql://localhost/hypercube";
            try { 
                // root y sin clave es el usuario por defecto que crea XAMPP.
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexionBD = DriverManager.getConnection(nombreConexionBD,"root","");
            }
            catch(Exception e) {
                System.err.println("No se ha podido conectar a la base de datos");
                System.err.println(e.getMessage());
            }
        }
    }
    // PARA COMPROBAR QUE LA CONEXIÓN SE REALIZA CORRECTAMENTE - TRUE -> Exito en conexión
    public boolean comprobarAcceso(){
        abrirConexionBD();
        return conexionBD != null;
    }
    
    // PARA CERRAR LA CONEXIÓN CON LA BASE DE DATOS
    public void cerrarConexionBD(){
        if (conexionBD != null){
            try{
                conexionBD.close();
                conexionBD = null;
            }
            catch(Exception e){ //Error en la conexión con la BD
                System.err.println("No se ha completado la desconexión a la base de datos");
                System.err.println(e.getMessage());
            }
        }
    }
    
    public List<ProductoBD> obtenerProductosBD() {
        abrirConexionBD();
        ArrayList<ProductoBD> productos = new ArrayList<>();
        try {
            String con = "SELECT id_producto,nombre,marca,descripcion,precio,existencias,imagen FROM productos";
            PreparedStatement s = conexionBD.prepareStatement(con);
            // hay que tener en cuenta las columnas de vuestra tabla de productos
            // también se puede utilizar una consulta del tipo:
            // con = "SELECT * FROM productos";
            ResultSet resultado = s.executeQuery();
            
            while(resultado.next()){
                ProductoBD producto = new ProductoBD();
                
                producto.setIdProducto(resultado.getInt("id_producto"));
                producto.setNombre(resultado.getString("nombre"));
                producto.setPrecio(resultado.getFloat("precio"));
                producto.setStock(resultado.getInt("existencias"));
                producto.setImagen(resultado.getString("imagen"));
                producto.setDescripcion(resultado.getString("descripcion"));
                producto.setMarca(resultado.getString("marca"));
                
                productos.add(producto);
            }
        }
        catch(Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos");
            System.err.println(e.getMessage());
        }
        return productos;
}
    
    public boolean comprobarUsuarioBD(String usuario, String clave) {
        abrirConexionBD();
        try{
            String con = "SELECT * FROM usuarios WHERE usuario=? and clave=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            s.setString(2,clave);
            // Consulta, buscamos una correspondencia usuario/clave
            ResultSet resultado = s.executeQuery();
            if ( resultado.next() ){ // El usuario/clave se encuentra en la BD
            
                return true;
            }
            else{ // El usuario/clave no se encuentra en la BD
            
                return false;
            }
        }
        catch(Exception e) { // Error en la conexión con la BD
            System.err.println("Error verificando usuaro/clave");
            System.err.println(e.getMessage());
            return false;
        }
    }
    
    public boolean comprobarAdmin(String usuario, String clave) {
        abrirConexionBD();
        try{
            String con = "SELECT admin FROM usuarios WHERE usuario=? and clave=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            s.setString(2, clave);
            // Consulta, buscamos una correspondencia usuario/clave
            ResultSet resultado = s.executeQuery();
            if ( resultado.equals(1) ){ // El usuario/clave tiene acceso de admin (1)
            
                return true;
            }
            else{ // El usuario/clave no se tiene acceso de admin (0)
            
                return false;
            }
        }
        catch(Exception e) { // Error en la conexión con la BD
            System.err.println("Error verificando usuaro/clave");
            System.err.println(e.getMessage());
            return false;
        }
    }
    
    public boolean registroUsuario(String usuario, String clave, String nombre, String apellidos, String domicilio, String poblacion, String provincia, String cp, String telefono) {
        abrirConexionBD();

        try {
            
            String con = "SELECT * FROM usuarios WHERE usuario=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            // MIRAMOS SI EXISTE EL USUARIO EN LA BD
            ResultSet res = s.executeQuery();
            
            if(res.next()){ // YA EXISTE UN USUARIO REGISTRADO CON EL MISMO NICK
                cerrarConexionBD();
                return false;
            }
            else{ // NO SE ENCUENTRA EN LA BASE DE DATOS, PROCEDE A REGISTRAR
                String registro = "INSERT INTO usuarios VALUES (NULL,1,0,?,?,?,?,?,?,?,?,?);";
                s = conexionBD.prepareStatement(registro);
                s.setString(1, usuario);
                s.setString(2, clave);
                s.setString(3, nombre);
                s.setString(4, apellidos);
                s.setString(5, domicilio);
                s.setString(6, poblacion);
                s.setString(7, provincia);
                s.setString(8, cp);
                s.setString(9, telefono);
                s.executeUpdate();
                cerrarConexionBD();
                return true;
            }
        } 
        catch (Exception e) {
            //Error en la conexión con la BD
            System.out.println("No se ha podido registrar al nuevo usuario.");
            System.err.println(e.getMessage());
            cerrarConexionBD();
            return false;
        }
    }
    
    // PARA CARGAR LOS DATOS DEL USUARIO EN LA PAGINA DE CAMBIO DE DATOS
    public UsuarioBD descargaDatosUsuario(String usuario){
        
        abrirConexionBD();
        UsuarioBD usuariobd = new UsuarioBD();
        
        try {
           
            String con = "SELECT usuario,clave,nombre,apellidos,domicilio,poblacion,provincia,cp,telefono FROM usuarios WHERE usuario=?;";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            ResultSet resultado = s.executeQuery();
            resultado.next();
            
            usuariobd.setUsuario(resultado.getString("usuario"));
            usuariobd.setClave(resultado.getString("clave"));
            usuariobd.setNombre(resultado.getString("nombre"));
            usuariobd.setApellidos(resultado.getString("apellidos"));
            usuariobd.setDomicilio(resultado.getString("domicilio"));
            usuariobd.setPoblacion(resultado.getString("poblacion"));
            usuariobd.setProvincia(resultado.getString("provincia"));
            usuariobd.setCp(resultado.getString("cp"));
            usuariobd.setTelefono(resultado.getString("telefono"));
        }
        
        catch(Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos");
            System.err.println(e.getMessage());
        }
        
        return usuariobd;
    }
    
    public int getId_usuarioBD(String usuario){
        abrirConexionBD();
        
        try{
            String con = "SELECT id_usuario FROM usuarios WHERE usuario=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            ResultSet res = s.executeQuery();
            res.next();
            int id = Integer.parseInt(res.getString("id_usuario"));

            cerrarConexionBD();
            return id;

        }
        catch (Exception e) {
            //Error en la conexión con la BD
            System.out.println("No se ha podido acceder al id del usuario.");
            System.err.println(e.getMessage());
            cerrarConexionBD();
            return -1;
        }
    }


    public boolean cambiarDatosUsuario(String usuario, String clave, String nombre, String apellidos, String domicilio, String poblacion, String provincia, String cp, String telefono){
        abrirConexionBD();
        
        try {
            
            String con = "SELECT * FROM usuarios WHERE usuario=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            // MIRAMOS SI EXISTE EL USUARIO EN LA BD
            ResultSet res = s.executeQuery();
            
            if(res.next()){ // SE PROCEDE A CAMBIAR LOS DATOS
                String cambio = "UPDATE usuarios SET clave=?, nombre=?, apellidos=?, domicilio=?, poblacion=?, provincia=?, cp=?, telefono=? WHERE usuario=?;";
                s = conexionBD.prepareStatement(cambio);
                s.setString(1, clave);
                s.setString(2, nombre);
                s.setString(3, apellidos);
                s.setString(4, domicilio);
                s.setString(5, poblacion);
                s.setString(6, provincia);
                s.setString(7, cp);
                s.setString(8, telefono);
                s.setString(9, usuario);
                s.executeUpdate();
                cerrarConexionBD();
                return true;
            }
            else{ // NO SE ENCUENTRA EN LA BASE DE DATOS, PROCEDE A REGISTRAR
                cerrarConexionBD();
                return false;
            }
        } 
        catch (Exception e) {
            //Error en la conexión con la BD
            System.out.println("No se ha podido actualizar al usuario.");
            System.err.println(e.getMessage());
            cerrarConexionBD();
            return false;
        }
    }
    
    
   public int nuevoPedido(int id_usuario, float total) {
        abrirConexionBD();

        try {
            //SE COGE LA FECHA
//            java.util.Date myDate = new java.util.Date();
//            java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
            Calendar calendario = Calendar.getInstance();
            java.sql.Date fecha = new java.sql.Date(calendario.getTime().getTime());
            int estado = 0;
            String pedido = "INSERT INTO pedidos VALUES (NULL,?, ?, ?, ?);";
            PreparedStatement s = conexionBD.prepareStatement(pedido);
            s.setInt(1, id_usuario);
            s.setDate(2,fecha);
            s.setFloat(3, total);
            s.setInt(4, estado);
//          String pedido = "INSERT INTO pedidos(id_pedido,persona,fecha,importe,estado) VALUES (NULL,'"+ id_usuario +"','" + fecha +"','"+ total +"','"+ estado +"');";
            s.executeUpdate();
            

            String maximo = "SELECT MAX(id_pedido) FROM pedidos;";
            s = conexionBD.prepareStatement(maximo);
            ResultSet res = s.executeQuery();
            res.next();
            int max = Integer.parseInt(res.getString("MAX(id_pedido)"));
            
            cerrarConexionBD();
            return max;
        } 
        catch (Exception e) {
            //Error en la conexión con la BD
            System.out.println("No se ha podido crear el pedido.");
            System.err.println(e.getMessage());
            cerrarConexionBD();
            return -1;
        }
    }
    
    public boolean detallesPedido(int codigo_pedido, int codigo_producto, int unidades, float precio_unitario) {
        abrirConexionBD();

        try {
            String detalle = "INSERT INTO detalle VALUES (?, ?, ?, ?);";
            PreparedStatement s = conexionBD.prepareStatement(detalle);
            s.setInt(1, codigo_pedido);
            s.setInt(2, codigo_producto);
            s.setInt(3, unidades);
            s.setFloat(4, precio_unitario);
            s.executeUpdate();

            cerrarConexionBD();
            return true;
        } 
        catch (Exception e) {
            //Error en la conexión con la BD
            System.out.println("No se ha podido crear el pedido.");
            System.err.println(e.getMessage());
            cerrarConexionBD();
            return false;
        }
    }
   
    
    public ArrayList<PedidoBD> getPedidos(String usuario){
        
        abrirConexionBD();
        ArrayList<PedidoBD> pedidos = new <PedidoBD>ArrayList();
        
        try {
           
            String getid = "SELECT id_usuario FROM usuarios WHERE usuario=?;";
            PreparedStatement s = conexionBD.prepareStatement(getid);
            s.setString(1, usuario);
            ResultSet resultado = s.executeQuery();
            resultado.next();
            int id_usuario = Integer.parseInt(resultado.getString("id_usuario"));
                         
            String getpedidos = "SELECT id_pedido, fecha, importe, estado  FROM pedidos WHERE persona=?;";
            s = conexionBD.prepareStatement(getpedidos);
            s.setInt(1, id_usuario);
            ResultSet res = s.executeQuery(); 
            
            while(res.next()){
            PedidoBD pedido = new PedidoBD();
            pedido.setId_pedido(Integer.parseInt(res.getString("id_pedido")));
            pedido.setFecha(res.getString("fecha"));
            pedido.setImporte(Float.parseFloat(res.getString("importe")));
            pedido.setEstado(Integer.parseInt(res.getString("estado")));
            pedidos.add(pedido);
            }  
        }
        
        catch(Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos en getPedidos AccesoBD");
            System.err.println(e.getMessage());
        }
        
        return pedidos;
    }
    
    
    public boolean cancelarPedido(String usuario, int id_pedido){
        abrirConexionBD();
        
        try {
            
            String con = "SELECT id_usuario FROM usuarios WHERE usuario=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            // MIRAMOS EL ID DEL USUARIO EN LA BD
            ResultSet res = s.executeQuery();
            
            if(res.next()){ // SE PROCEDE A CAMBIAR EL ESTADO
                String cambio = "UPDATE pedidos SET estado='3' WHERE id_pedido=?;";
                s = conexionBD.prepareStatement(cambio);
                s.setInt(1, id_pedido);
                s.executeUpdate();
                cerrarConexionBD();
                return true;
            }
            else{ // NO SE ENCUENTRA EN LA BASE DE DATOS
                cerrarConexionBD();
                return false;
            }
        } 
        catch (Exception e) {
            //Error en la conexión con la BD
            System.out.println("No se ha podido cancelar el pedido.");
            System.err.println(e.getMessage());
            cerrarConexionBD();
            return false;
        }
    }
        
    public boolean cancelarProducto(String usuario, int id_pedido, int id_producto){
        abrirConexionBD();
        
        try {
            
            String con = "SELECT id_usuario FROM usuarios WHERE usuario=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setString(1, usuario);
            // MIRAMOS EL ID DEL USUARIO EN LA BD
            ResultSet res = s.executeQuery();
            
            if(res.next()){ // SE PROCEDE A QUITAR EL PEDIDO
                
                // DINERO DEL PRODUCTO
                String dineros = "SELECT precio_unitario, unidades FROM detalle WHERE codigo_pedido=? AND codigo_producto=?;";
                s = conexionBD.prepareStatement(dineros);
                s.setInt(1, id_pedido);
                s.setInt(2, id_producto);
                ResultSet resdinero = s.executeQuery();
                resdinero.next();
                float precio_unitario = Float.parseFloat(resdinero.getString("precio_unitario"));
                int unidades = Integer.parseInt(resdinero.getString("unidades"));
                
                // DINERO DEL PEDIDO
                String total = "SELECT importe FROM pedidos WHERE id_pedido=?;";
                s = conexionBD.prepareStatement(total);
                s.setInt(1, id_pedido);
                ResultSet totaldineros = s.executeQuery();
                totaldineros.next();
                float total_pedido = Float.parseFloat(totaldineros.getString("importe"));
                
                // DINERO DEL PEDIDO MENOS EL DEL PRODUCTO
                float total_dineros = total_pedido - precio_unitario * unidades;
                
                // ACTUALIZAMOS EL DINERO DEL PEDIDO
                String cambio = "UPDATE pedidos SET importe=? WHERE id_pedido=?;";
                s = conexionBD.prepareStatement(cambio);
                s.setFloat(1, total_dineros);
                s.setInt(2, id_pedido);
                s.executeUpdate();
                
                String pedido = "DELETE FROM detalle WHERE codigo_pedido=? and codigo_producto=?;";
                s = conexionBD.prepareStatement(pedido);
                s.setInt(1, id_pedido);
                s.setInt(2, id_producto);
                s.executeUpdate();
                cerrarConexionBD();
                return true;
            }
            else{ // NO SE ENCUENTRA EN LA BASE DE DATOS
                cerrarConexionBD();
                return false;
            }
        } 
        catch (Exception e) {
            //Error en la conexión con la BD
            System.out.println("No se ha podido eliminar el producto.");
            System.err.println(e.getMessage());
            cerrarConexionBD();
            return false;
        }
    }
    
        
    public int comprobarExistencias(String usuario,Producto producto){
        
        abrirConexionBD();
        int diferencia = -1;
        try {
           
            String getid = "SELECT id_usuario FROM usuarios WHERE usuario=?;";
            PreparedStatement s = conexionBD.prepareStatement(getid);
            s.setString(1, usuario);
            ResultSet resultado = s.executeQuery();
            resultado.next();
            int id_usuario = Integer.parseInt(resultado.getString("id_usuario"));
            
            String con = "SELECT pr.existencias FROM usuarios us , productos pr where us.id_usuario=? AND pr.id_producto =?;";
            s = conexionBD.prepareStatement(con);
            s.setInt(1, id_usuario);
            s.setInt(2, producto.getId_producto());
            ResultSet res = s.executeQuery(); 
            
            res.next();
            int unidades = producto.getCantidad();
            int existencias = Integer.parseInt(res.getString("existencias"));
            diferencia = existencias - unidades;
        }
        
        catch(Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos en comprobarExistencias AccesoBD");
            System.err.println(e.getMessage());
        }
        
        
        return diferencia;
    }    
    
    
    public ArrayList<DetallesBD> getDetalles(int codigo_pedido){
        
        abrirConexionBD();
        ArrayList<DetallesBD> detalles = new <DetallesBD>ArrayList();
        
        try {
           
            String getid = "SELECT codigo_producto, unidades, precio_unitario FROM detalle WHERE codigo_pedido=?;";
            PreparedStatement s = conexionBD.prepareStatement(getid);
            s.setInt(1, codigo_pedido);
            ResultSet resultado = s.executeQuery();
            
            while(resultado.next()){
            DetallesBD detalle = new DetallesBD();
            detalle.setCodigo_pedido(codigo_pedido);
            detalle.setCodigo_producto(Integer.parseInt(resultado.getString("codigo_producto")));
            detalle.setPrecio_unitario(Float.parseFloat(resultado.getString("precio_unitario")));
            detalle.setUnidades(Integer.parseInt(resultado.getString("unidades")));
            detalles.add(detalle);
            }  
        }
        
        catch(Exception e) {
            System.err.println("Error ejecutando la consulta a la base de datos en getPedidos AccesoBD");
            System.err.println(e.getMessage());
        }
        
        return detalles;
    }
        
    
    public String getNombreProducto(int id_producto){
        abrirConexionBD();
        
        try{
            String con = "SELECT nombre FROM productos WHERE id_producto=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, id_producto);
            
            ResultSet res = s.executeQuery();
            res.next();
            String nombre = res.getString("nombre");
            cerrarConexionBD();
            return nombre;

        }
        catch (Exception e) {
            //Error en la conexión con la BD
            System.out.println("No se ha podido acceder al id del usuario.");
            System.err.println(e.getMessage());
            cerrarConexionBD();
            return "";
        }
    }
}
