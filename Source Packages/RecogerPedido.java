/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p2;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; //Para acceder al entorno de sesión

/**
 *
 * @author jaumo
 */
public class RecogerPedido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            ArrayList <Producto> carro = new <Producto>ArrayList();
            JsonReader jsonReader = Json.createReader(
            new InputStreamReader(request.getInputStream()));
            JsonObject jobj = jsonReader.readObject();
            
            float total = 0;
            for (String key : jobj.keySet()) { // Se recorren todos los productos pasados en el JSON
                JsonObject prod = (JsonObject)jobj.getJsonObject(key);
                Producto nuevo = new Producto();
                nuevo.setId_producto(prod.getInt("id_producto"));
                nuevo.setNombre(prod.getString("nombre"));
                nuevo.setPrecio(Float.parseFloat(prod.get("precio").toString()));
                nuevo.setCantidad(prod.getInt("cantidad"));
                carro.add(nuevo);
                total += nuevo.getCantidad() * nuevo.getPrecio();
            }
            
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("carritoProcesado", carro);
            sesion.setAttribute("precioTotal",total);
            response.sendRedirect("html/compra2.jsp");     
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
