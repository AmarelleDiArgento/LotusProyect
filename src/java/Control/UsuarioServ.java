/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.UsuarioTab;
import Servicios.Mensajes;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author Amarelle
 */
public class UsuarioServ extends HttpServlet {

    @Resource(name = "Pool")
    private DataSource pool;

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
        HttpSession Ses = request.getSession(true);
        Mensajes m = null;
        String msj;
        String Tipo;
        String Detalles;
        String ruta;

        //if (Ses.getAttribute("log") != null) {
        String Accion = request.getParameter("accion");

        if (Ses.getAttribute("msj") != null) {
            msj = (String) Ses.getAttribute("msj");
        } else {
            msj = "";
        }
        if (Ses.getAttribute("jsp") != null) {
            ruta = (String) Ses.getAttribute("jsp");
        } else {
            ruta = "usuario.jsp";
        }
        UsuarioTab u = null;

        String Cedula;
        String Nombre;
        String Apellido;
        String Loger;
        String Password;
        String Extencion;
        String Telefono;
        String Email;
        Boolean Estado;
        int RolId;
        String nRol;

        try {
            AdminMs Asql = new AdminMs(pool);

            switch (Accion) {
                case "Registrar":
                    Cedula = request.getParameter("Cedula");
                    Nombre = request.getParameter("Nombre");
                    Apellido = request.getParameter("Apellido");
                    Loger = request.getParameter("Loger");

                    if (request.getParameter("Password") != null) {
                        Password = request.getParameter("Password");
                    } else {
                        Password = "1234";
                    }
                    Extencion = request.getParameter("Extencion");
                    Telefono = request.getParameter("Telefono");
                    Email = request.getParameter("Email");
                    String E = request.getParameter("Estado");
                    Estado = E.equals("on");
                    if (request.getParameter("Rol") != null) {
                        RolId = Integer.parseInt(request.getParameter("Rol"));
                    } else {
                        RolId = 3;
                    }
                    u = new UsuarioTab(Cedula, Nombre, Apellido, Loger, Password, Extencion, Telefono, Email, Estado, RolId);
                    msj = Asql.getUsuario().insertar(u);
                    break;

                case "Modificar":
                    Cedula = request.getParameter("Cedula");
                    Nombre = request.getParameter("Nombre");
                    Apellido = request.getParameter("Apellido");
                    Loger = request.getParameter("Loger");

                    if (request.getParameter("Password") != null) {
                        Password = request.getParameter("Password");
                    } else {
                        Password = "1234";
                    }
                    Extencion = request.getParameter("Extencion");
                    Telefono = request.getParameter("Telefono");
                    Email = request.getParameter("Email");
                    String Em = request.getParameter("Estado");
                    Estado = Em.equals("on");
                    if (request.getParameter("Rol") != null) {
                        RolId = Integer.parseInt(request.getParameter("Rol"));
                    } else {
                        RolId = 3;
                    }
                    u = new UsuarioTab(Cedula, Nombre, Apellido, Loger, Password, Extencion, Telefono, Email, Estado, RolId);
                    msj = Asql.getUsuario().modificar(u);
                    break;
                case "Eliminar":
                    Cedula = request.getParameter("Id");
                    msj = Asql.getUsuario().eliminar(Cedula);
                    break;
                case "Obtener":
                    Cedula = request.getParameter("Cedula");
                    u = Asql.getUsuario().obtener(Cedula);
                    Ses.setAttribute("Usu", u);
                    msj = "Se ha obtenido el usuario con cedula: " + u.getCedula();

                    break;
                case "Listar":
                    List<UsuarioTab> ul = Asql.getUsuario().listar();
                    Ses.setAttribute("lisU", ul);
                    break;

                case "Ingresar":
                    Loger = request.getParameter("Loger");
                    Password = request.getParameter("Password");
                    UsuarioTab Us = Asql.getUsuario().login(Loger, Password);
                    if (Us != null) {
                        Ses.setAttribute("log", Us);
                        ruta = "asignapers.do?accion=session";
                    } else {
                        msj = "Usuario o contraseña invalidos";
                        ruta = "index.jsp";
                    }
                    break;

                default:
                    msj = "No se que paso o_oU";
                    ruta = "usuario.jsp";
            }

        } catch (SQLException ex) {
            msj = "Error " + ex;
            ruta = "main.jsp";

        } catch (Exception ex) {
            msj = "Error " + ex;
            ruta = "main.jsp";
        }
        //} else {
        //    ruta = "index.jsp";
        //    msj = "No has iniciado sesión";

        //}
        Ses.setAttribute("msj", msj);
        request.getRequestDispatcher(ruta).forward(request, response);

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
