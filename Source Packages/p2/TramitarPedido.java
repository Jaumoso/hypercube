/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jaumo
 */
public class TramitarPedido extends HttpServlet {

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
        
        HttpSession sesion = request.getSession(true);
        String usuario = (String) sesion.getAttribute("usuario");
        AccesoBD con = AccesoBD.getInstance();
        int id_usuario = con.getId_usuarioBD(usuario);
        if(id_usuario == -1){
            System.err.println("Error al obtener id_usuario de la BD. Consultar getId_usuarioBD en AccesoBD");
        }
        
        ArrayList<Producto> productos = (ArrayList) sesion.getAttribute("carritoProcesado");
        float precioTotal = (float) sesion.getAttribute("precioTotal");
        
//        float total = 0;
//        for (Producto p : productos){
//            total += p.getCantidad()*p.getPrecio();
//        }

        int id_pedido = -1;
        if(precioTotal > 0){
            id_pedido = con.nuevoPedido(id_usuario, precioTotal);
            if(id_pedido > 0){
                for(Producto p : productos){
                    if(con.detallesPedido(id_pedido,p.getId_producto(),p.getCantidad(),p.getPrecio())){
                        System.err.println("detalles añadidos");
                    }
                    else{
                        System.err.println("Error al añadir detalles al producto");
                    }
                    
                }
            }
        }
        
        if(precioTotal < 0){
            sesion.setAttribute("mensaje","Error al procesar el pedido - Pedido vacío");
            sesion.setAttribute("id_pedido",id_pedido);
            response.sendRedirect("html/mensaje.jsp");
        }
        
        sesion.setAttribute("id_pedido",id_pedido);
        sesion.setAttribute("mensaje","¡Muchas gracias por su compra!");
        response.sendRedirect("html/mensaje.jsp");
        
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
