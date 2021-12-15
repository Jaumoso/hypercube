/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p2;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; //Para acceder al entorno de sesión

/**
 *
 * @author jaumo
 */
public class RegistroNuevoUsuario extends HttpServlet {

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
            String usuario = request.getParameter("usuario"); // Se obtiene el nombre de usuario
            String clave = request.getParameter("clave"); // Se obtiene la clave de usuario
            String nombre = request.getParameter("nombre"); 
            String apellidos = request.getParameter("apellidos");
            String domicilio = request.getParameter("domicilio");
            String poblacion = request.getParameter("poblacion");
            String provincia = request.getParameter("provincia");
            String cp = request.getParameter("cp");
            String telefono = request.getParameter("telefono");
            
            HttpSession sesion = request.getSession(true); // Se accede al entorno de sesión
            
            AccesoBD con = AccesoBD.getInstance(); //Instancia de la clase factoría AccesoBD
            if(usuario != null && clave != null && nombre != null && apellidos != null && domicilio != null && poblacion != null && provincia != null && cp != null && telefono != null){
                if(con.registroUsuario(usuario, clave, nombre, apellidos, domicilio, poblacion, provincia, cp, telefono)){
//                    sesion.setAttribute("usuario", usuario);
                    response.sendRedirect("html/registroCorrecto.jsp");
                }
                else {
                    response.sendRedirect("html/registroIncorrecto.jsp"); 
                }
            }
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