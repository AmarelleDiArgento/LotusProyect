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
        Mensajes m = new Mensajes();
        String ruta;

        //if (Ses.getAttribute("log") != null) {
        String Accion = request.getParameter("accion");

        if (Ses.getAttribute("msj") != null) {
            m = (Mensajes) Ses.getAttribute("msj");
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
                    m.setMsj(Asql.getUsuario().insertar(u));
                    m.setTipo("Ok");
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
                    m.setMsj(Asql.getUsuario().modificar(u));
                    m.setTipo("Ok");
                    break;

                case "Eliminar":
                    Cedula = request.getParameter("Id");
                    m.setMsj(Asql.getUsuario().eliminar(Cedula));
                    m.setTipo("Ok");
                    break;

                case "Obtener":
                    Cedula = request.getParameter("Cedula");
                    u = Asql.getUsuario().obtener(Cedula);
                    Ses.setAttribute("Usu", u);
                    m.setMsj("Se ha obtenido el usuario con cedula: " + u.getCedula());
                    m.setTipo("Ok");
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
                        m.setMsj("Bienvenido " + Us.toFullName());
                        m.setTipo("Ok");
                        ruta = "asignapers.do?accion=session";
                    } else {
                        m.setMsj("Bienvenido " + Us.toFullName());
                        m.setTipo("Usuario o contraseña invalidos");
                        m.setTipo("Error");
                        ruta = "index.jsp";
                    }
                    break;

                default:

                    m.setTipo("No se que paso o_oU");
                    m.setTipo("Error");
                    ruta = "usuario.jsp";
            }

        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setTipo("Error SQL");
            m.setDetalles("Detalles: "+ex);

        } catch (Exception ex) {
            m.setTipo("Error");
            m.setTipo("Error");
            m.setDetalles("Detalles: "+ex);
        }
        //} else {
        //    ruta = "index.jsp";
        //    msj = "No has iniciado sesión";

        //}
        Ses.setAttribute("msj", m);
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
