/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p2;

/**
 *
 * @author jaumo
 */
public class ProductoBD {

    private int id_producto;
    private String nombre;
    private float precio;
    private int stock;
    private String imagen;
    private String marca;
    private String descripcion;

    // GETTERS
    public int getIdProducto(){
        return id_producto;
    }
    
    public String getMarca(){
        return marca;
    }
    
    public String getDescripcion(){
        return descripcion;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public float getPrecio(){
        return precio;
    }
    
    public int getStock(){
        return stock;
    }
    
    public String getImagen(){
        return imagen;
    }
    
    // SETTERS

    public void setIdProducto(int id_producto) {
        this.id_producto = id_producto;
    }
    
    public void setMarca(String marca){
        this.marca = marca;
    }
    
    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
}


