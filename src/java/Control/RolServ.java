/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.AsignaPermisoTab;
import Modelo.Tabs.RolTab;
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
public class RolServ extends HttpServlet {

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
        //if (Ses.getAttribute("log") != null) {

        Mensajes m = new Mensajes();
        if (Ses.getAttribute("msj") != null) {
            m = (Mensajes) Ses.getAttribute("msj");
        }
        String ruta;

        if (Ses.getAttribute("jsp") != null) {
            ruta = (String) Ses.getAttribute("jsp");
        } else {
            ruta = "rol.jsp";
        }

        //if (Ses.getAttribute("log") != null) {
        String Accion = request.getParameter("accion");

        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Rol")) {
                acc = a;
            }
        }

        if (acc == null) {
            m.setTipo("Error");
            m.setMsj("Fitosanidad: Permisos insuficientes");
            m.setDetalles("No tienes permiso para ingresar a esta area");
            ruta = "main.jsp";
        }

        RolTab r = null;
        int Id;
        String Nombre;
        String Descripcion;
        Boolean Estado;

        try {
            AdminMs Asql = new AdminMs(pool);

            switch (Accion) {
                case "Registrar":
                    if (acc.isRpNuevo()) {
                        Nombre = request.getParameter("Nombre");
                        Descripcion = request.getParameter("Descripcion");
                        Estado = request.getParameter("Estado") != null;
                        r = new RolTab(Nombre, Descripcion, Estado);
                        m = Asql.getRol().insertar(r);
                        if (!m.getTipo().equals("Error")) {
                            ruta = "asignapers.do?accion=Insertar&Id=" + r.getRolId();
                        }
                    } else {
                        m.setTipo("Error");
                        m.setMsj("Permisos insuficientes");
                        m.setDetalles("No tienes permisos para hacer registros");
                        ruta = "main.jsp";
                    }

                    break;

                case "Modificar":
                    if (acc.isRpEditar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        Nombre = request.getParameter("Nombre");
                        Descripcion = request.getParameter("Descripcion");
                        Estado = request.getParameter("Estado") != null;
                        r = new RolTab(Id, Nombre, Descripcion, Estado);
                        m = Asql.getRol().modificar(r);

                    } else {
                        m.setTipo("Error");
                        m.setMsj("Permisos insuficientes");
                        m.setDetalles("No tienes permisos para hacer modificaciones");
                        ruta = "main.jsp";
                    }
                    break;
                case "Eliminar":
                    if (acc.isRpEliminar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        m = Asql.getRol().eliminar(Id);
                    } else {
                        m.setTipo("Error");
                        m.setMsj("Permisos insuficientes");
                        m.setDetalles("No tienes permisos para eliminar registros");
                        ruta = "main.jsp";
                    }
                    break;
                case "Obtener":
                    if (acc.isRpEditar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        r = Asql.getRol().obtener(Id);
                        Ses.setAttribute("Rol", r);

                        m.setMsj("Se ha obtenido el rol con id: " + r.getRolId());
                        m.setTipo("Mod");
                    } else {
                        m.setTipo("Error");
                        m.setMsj("Permisos insuficientes");
                        m.setDetalles("No tienes permisos para editar registros");
                        ruta = "main.jsp";
                    }

                    break;
                case "Listar":
                    if (acc.isRpLeer()) {
                        List<RolTab> rl = Asql.getRol().listar();
                        Ses.setAttribute("lisR", rl);
                    } else {
                        m.setTipo("Error");
                        m.setMsj("Permisos insuficientes");
                        m.setDetalles("No tienes permisos para consultar registros");
                        ruta = "main.jsp";

                    }
                    break;

                default:
                    ruta = "rol.jsp";
            }
        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("MySql Error: ");
            m.setDetalles("Detalles" + ex);

        } catch (Exception ex) {
            m.setTipo("Error");
            m.setMsj("Error");
            m.setDetalles("Detalles" + ex);

        }
        //}else{
        //    ruta = "index.jsp";
        //    msj = "No has iniciado sesión";
        //}
        if (m.getTipo() != null) {
            Ses.setAttribute("msj", m);
        }
        request.getRequestDispatcher(ruta).forward(request, response);
    }

        //request.getRequestDispatcher("index.jsp").forward(request, response);
    //}

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
