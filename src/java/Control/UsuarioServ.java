/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.UsuarioTab;
import Servicios.Mensajes;
import Servicios.AdminFile;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

/**
 *
 * @author Amarelle
 */
@MultipartConfig

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
        if (Ses.getAttribute("msj") != null) {
            m = (Mensajes) Ses.getAttribute("msj");
        }

        String ruta;

        //if (Ses.getAttribute("log") != null) {
        String Accion = request.getParameter("accion");

        if (Ses.getAttribute("jsp") != null) {
            ruta = (String) Ses.getAttribute("jsp");
        } else {
            ruta = "usuario.jsp";
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
        String Avatar;
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
                    Avatar = request.getParameter("Avatar");
                    String E = request.getParameter("Estado");
                    Estado = E.equals("on");
                    if (request.getParameter("Rol") != null) {
                        RolId = Integer.parseInt(request.getParameter("Rol"));
                    } else {
                        RolId = 3;
                    }
                    u = new UsuarioTab(Cedula, Nombre, Apellido, Usuario, Password, Extencion, Celular, Email, Avatar, Estado, RolId);
                    m = Asql.getUsuario().insertar(u);

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
                    Avatar = Usuario + request.getParameter("Avatar");
                    String Em = request.getParameter("Estado");
                    Estado = Em.equals("on");
                    if (request.getParameter("Rol") != null) {
                        RolId = Integer.parseInt(request.getParameter("Rol"));
                    } else {
                        RolId = 3;
                    }
                    u = new UsuarioTab(Cedula, Nombre, Apellido, Usuario, Password, Extencion, Celular, Email, Avatar, Estado, RolId);
                    m = Asql.getUsuario().modificar(u);
                    break;

                case "Eliminar":
                    Cedula = request.getParameter("Id");
                    m = Asql.getUsuario().eliminar(Cedula);
                    break;

                case "Obtener":
                    Cedula = request.getParameter("Cedula");
                    u = Asql.getUsuario().obtener(Cedula);
                    Ses.setAttribute("Usu", u);
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
                        ruta = "asignapers.do?accion=session";
                    } else {
                        m.setDetalles("Usuario o contraseña invalidos");
                        m.setMsj("Error de usuario");
                        m.setTipo("Error");
                        ruta = "index.jsp";
                    }
                    break;

                case "Subir":
                    Part arc = request.getPart("imagen");
                    AdminFile af = new AdminFile();
//                    String Url = "/home/freyd/NetBeansProjects/LotusProyect/web/img/Test/" + arc.getSubmittedFileName();
//                    m = af.subirImg(arc, Url);

                    break;

                default:
                    m.setTipo("Error");
                    m.setMsj("Error desconocido");
                    m.setDetalles("No se que paso o_oU");

            }
        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("MySql Servlet Error");
            m.setDetalles("Detalles" + ex);

        } catch (Exception ex) {
            m.setTipo("Error");
            m.setMsj("Error Servlet");
            m.setDetalles("Detalles " + ex);

        }
        if (m.getTipo() != null) {
            Ses.setAttribute("msj", m);
        }

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
