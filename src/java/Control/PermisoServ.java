/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.PermisoTab;
import Modelo.Tabs.AsignaPermisoTab;
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
public class PermisoServ extends HttpServlet {

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
            ruta = "permiso.jsp";
        }

        //if (Ses.getAttribute("log") != null) {
        String Accion = request.getParameter("accion");
        UsuarioTab uSes = (UsuarioTab) Ses.getAttribute("log");

        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Permiso")) {
                acc = a;
            }
        }
        if (acc == null) {
            m.setTipo("Error");
            m.setMsj("Permiso: Permisos insuficientes");
            m.setDetalles("No tienes permiso para ingresar a esta area");
            ruta = "main.jsp";
        }

        PermisoTab p = null;
        int Id;
        String Nombre;
        String Modulo;
        String Descripcion;
        String Ico;
        String Url;
        String E;
        Boolean Estado;

        try {
            AdminMs Asql = new AdminMs(pool);

            switch (Accion) {
                case "Insertar":
                    //                  if (acc.isRpNuevo()) {
                    Nombre = request.getParameter("Nombre");
                    Modulo = request.getParameter("Modulo");
                    Descripcion = request.getParameter("Descripcion");
                    Ico = request.getParameter("Ico");
                    Url = request.getParameter("Url");
                    E = request.getParameter("Estado");
                    Estado = E.equals("on");
                    p = new PermisoTab(Nombre, Modulo, Descripcion, Ico, Url, Estado);
                    m = Asql.getPermiso().insertar(p);
//                    } else {
//                        m.setTipo("Error");
//                        m.setMsj("No tienes permisos para hacer registros\"");
//                    }

                    break;

                case "modificar":
                    //                   if (acc.isRpEditar()) {
                    Id = Integer.parseInt(request.getParameter("Id"));
                    Nombre = request.getParameter("Nombre");
                    Modulo = request.getParameter("Modulo");
                    Descripcion = request.getParameter("Descripcion");
                    Ico = request.getParameter("Ico");
                    Url = request.getParameter("Url");
                    E = request.getParameter("Estado");
                    Estado = E.equals("on");
                    p = new PermisoTab(Id, Nombre, Modulo, Descripcion, Ico, Url, Estado);
                    m = Asql.getPermiso().modificar(p);
                    /*                   } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para hacer modificaciones");
                    }
                     */ break;
                case "eliminar":
                    //                   if (acc.isRpEliminar()) {
                    Id = Integer.parseInt(request.getParameter("Id"));
                    m = Asql.getPermiso().eliminar(Id);
                    m.setTipo("Ok");
                    /*                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para eliminar registros");
                    }
                     */ break;
                case "obtener":
//                    if (acc.isRpLeer()) {
                    Id = Integer.parseInt(request.getParameter("Id"));
                    p = Asql.getPermiso().obtener(Id);
                    Ses.setAttribute("Per", p);
                    m.setMsj("Se ha obtenido el Permiso con id: " + p.getPerId());
                    m.setTipo("Ok");
                    /*                   } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para consultar registros");
                    }

                     */ break;
                case "Listar":
//                    if (acc.isRpLeer()) {
                    List<PermisoTab> pl = Asql.getPermiso().listar();
                    Ses.setAttribute("lisPe", pl);
                    /*                    
                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para consultar estos registros");
                    }
                     */
                    break;
                case "menu":
                    if (uSes.getCedula() != null) {
                        List<PermisoTab> menu = Asql.getPermiso().menu(uSes.getCedula());
                        Ses.setAttribute("Menu", menu);
                        m.setTipo("Msj");
                        if (uSes.getGenero().equalsIgnoreCase("M")) {
                            m.setMsj("Bienvenido " + uSes.toFullName());
                        } else {
                            m.setMsj("Bienvenida " + uSes.toFullName());
                        }
                        ruta = "main.jsp";
                    } else {
                        m.setTipo("Error");
                        m.setMsj("No has iniciado sesión");
                        ruta = "index.jsp";
                    }
                    break;

                default:
                    ruta = "permiso.jsp";
            }
        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("MySql Error");
            m.setDetalles("Detalles: " + ex);

        } catch (Exception ex) {
            m.setTipo("Error");
            m.setMsj("Error");
            m.setDetalles("Detalles: " + ex);
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
