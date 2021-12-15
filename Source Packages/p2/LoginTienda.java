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
public class LoginTienda extends HttpServlet {

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
            String usuario = request.getParameter("usuario"); // Se obtiene el nombre de usuasrio
            String clave = request.getParameter("clave"); // Se obtiene la clave de usuario
            String origen = request.getParameter("origen"); // Obtiene el origen de la peticion para poder redirigir donde toca
            HttpSession sesion = request.getSession(true); // Se accede al entorno de sesión
            
            AccesoBD con = AccesoBD.getInstance(); //Instancia de la clase factoría AccesoBD
            if ((usuario != null) && (clave != null)){ //Se si se han pasado usuario y clave
                if (con.comprobarUsuarioBD(usuario, clave)){ // Se comprueba en la base de datos
                    // Registramos al usuario en el entorno de la sesión
                    sesion.setAttribute("usuario", usuario);
                }
                else{ // El usuario/clave no se encuentra en la BD
                    // Registramos el error en el entorno de la sesión
                    sesion.setAttribute("mensaje","Usuario y/o clave incorrectos<br>");
                }
            }
            
            // NO HACE FALTA, LOS CAMPOS SON OBLIGATORIOS PARA INICIAR SESION
//            else{
//                // Registramos el error en el entorno de la sesión
//                sesion.setAttribute("mensaje", "Falta introducir el usuario o la clave<br>");
//            }

            if(origen.equals("tienda")){
                response.sendRedirect("html/loginTienda.jsp"); //Redirigimos la petición a la página de login
            }
            if(origen.equals("perfil")){
                response.sendRedirect("html/loginPerfil.jsp"); //Redirigimos la petición a la página de login
            }
            if(origen.equals("carrito")){
                response.sendRedirect("html/loginCarrito.jsp"); //Redirigimos la petición a la página de login
            }
            if(origen.equals("admin")){
                response.sendRedirect("html/loginAdmin.jsp"); //Redirigimos la petición a la página de login
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