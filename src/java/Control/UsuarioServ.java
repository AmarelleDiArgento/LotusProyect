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

        String ruta;

        //if (Ses.getAttribute("log") != null) {
        String Accion = request.getParameter("accion");

        if (Ses.getAttribute("jsp") != null) {
            ruta = (String) Ses.getAttribute("jsp");
        } else {
            ruta = "usuario.jsp";
        }
        Mensajes m = new Mensajes();
        if (Ses.getAttribute("msj") != null) {
            m = (Mensajes) Ses.getAttribute("msj");
        }

        UsuarioTab u = null;

        String Cedula;
        String Nombre;
        String Apellido;
        String Usuario;
        String Password;
        String Extencion;
        String Celular;
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
                    Usuario = request.getParameter("Usuario");

                    if (request.getParameter("Password") != null) {
                        Password = request.getParameter("Password");
                    } else {
                        Password = "1234";
                    }
                    Extencion = request.getParameter("Extencion");
                    Celular = request.getParameter("Celular");
                    Email = request.getParameter("Email");
                    String E = request.getParameter("Estado");
                    Estado = E.equals("on");
                    if (request.getParameter("Rol") != null) {
                        RolId = Integer.parseInt(request.getParameter("Rol"));
                    } else {
                        RolId = 3;
                    }
                    u = new UsuarioTab(Cedula, Nombre, Apellido, Usuario, Password, Extencion, Celular, Email, Estado, RolId);
                    m.setMsj(Asql.getUsuario().insertar(u));
                    m.setTipo("Ok");
                    break;

                case "Modificar":
                    Cedula = request.getParameter("Cedula");
                    Nombre = request.getParameter("Nombre");
                    Apellido = request.getParameter("Apellido");
                    Usuario = request.getParameter("Usuario");

                    if (request.getParameter("Password") != null) {
                        Password = request.getParameter("Password");
                    } else {
                        Password = "1234";
                    }
                    Extencion = request.getParameter("Extencion");
                    Celular = request.getParameter("Celular");
                    Email = request.getParameter("Email");
                    String Em = request.getParameter("Estado");
                    Estado = Em.equals("on");
                    if (request.getParameter("Rol") != null) {
                        RolId = Integer.parseInt(request.getParameter("Rol"));
                    } else {
                        RolId = 3;
                    }
                    u = new UsuarioTab(Cedula, Nombre, Apellido, Usuario, Password, Extencion, Celular, Email, Estado, RolId);
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
                    m.setTipo("Mod");
                    break;

                case "Listar":
                    List<UsuarioTab> ul = Asql.getUsuario().listar();
                    Ses.setAttribute("lisU", ul);
                    break;

                case "Ingresar":
                    Usuario = request.getParameter("Usuario");
                    Password = request.getParameter("Password");
                    UsuarioTab Us = Asql.getUsuario().login(Usuario, Password);
                    if (Us != null) {
                        Ses.setAttribute("log", Us);
                        m.setMsj("Bienvenido " + Us.toFullName());
                        m.setTipo("Ok");
                        ruta = "asignapers.do?accion=session";
                    } else {
                        m.setDetalles("Usuario o contraseña invalidos");
                        m.setMsj("Error de usuario");
                        m.setTipo("Error");
                        ruta = "index.jsp";
                    }
                    break;

                default:

                    m.setTipo("Error");
                    m.setMsj("No se que paso o_oU");
                    ruta = "usuario.jsp";
            }

        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("Error SQL");
            m.setDetalles("Detalles: " + ex);

        } catch (Exception ex) {
            m.setTipo("Error");
            m.setMsj("Error");
            m.setDetalles("Detalles: " + ex);
        }
        //} else {
        //    ruta = "index.jsp";
        //    msj = "No has iniciado sesión";

        //}
        
        if (m.getTipo() != null){
            m.setTipo("Vacio");
        }
        Ses.setAttribute("msj",m);
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
