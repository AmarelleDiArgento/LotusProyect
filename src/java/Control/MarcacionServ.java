/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.MarcacionTab;
import Modelo.Tabs.AsignaPermisoTab;
import Servicios.AdminFile;
import Servicios.Mensajes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

/**
 *
 * @author ale-j
 */
public class MarcacionServ extends HttpServlet {

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
        if (Ses.getAttribute("log") != null) {

        Mensajes m = new Mensajes();
        if (Ses.getAttribute("msj") != null) {
            m = (Mensajes) Ses.getAttribute("msj");
        }
        String ruta;

        if (Ses.getAttribute("jsp") != null) {
            ruta = (String) Ses.getAttribute("jsp");
        } else {
            ruta = "marcacion.jsp";
        }

        //if (Ses.getAttribute("log") != null) {
        String Accion = request.getParameter("accion");

        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Marcación")) {
                acc = a;
            }
        }

        if (acc == null) {
            m.setTipo("Error");
            m.setMsj("Marcación: Permisos insuficientes");
            m.setDetalles("No tienes permiso para ingresar a esta area");
            ruta = "main.jsp";
        }

        MarcacionTab ma = null;
        AdminFile af = new AdminFile();

        int Id;
        int ArmId;
        String Nombre;
        String Portada;
        String Url;
        String extension = "";
        Boolean Estado;

        try {
            AdminMs Asql = new AdminMs(pool);

            switch (Accion) {
                case "Registrar":
                    if (acc.isRpNuevo()) {
                        Nombre = request.getParameter("Nombre");
                        Portada = request.getParameter("Portada");
                        Estado = request.getParameter("Estado") != null;
                        ArmId = Integer.parseInt(request.getParameter("ArmId"));
                        ma = new MarcacionTab(Nombre, Portada, Estado, ArmId);
                        m = Asql.getMarcacion().insertar(ma);

                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para hacer registros");
                    }

                    break;

                case "Modificar":
                    if (acc.isRpEditar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        Nombre = request.getParameter("Nombre");
                        Part arc = request.getPart("Portada");
                        int i = arc.getSubmittedFileName().lastIndexOf('.');
                        if (i >= 0) {
                            extension = arc.getSubmittedFileName().substring(i + 1);
                        }
                        Url = "img/Marcacion/" + Nombre;
                        Portada = Nombre + "." + extension;
                        m = af.subirImg(arc, Url, Portada);

                        Estado = request.getParameter("Estado") != null;
                        ArmId = Integer.parseInt(request.getParameter("ArmId"));
                        ma = new MarcacionTab(Id, Nombre, Url + Portada, Estado, ArmId);
                        m = Asql.getMarcacion().modificar(ma);

                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para hacer modificaciones");
                    }
                    break;
                case "Eliminar":
                    if (acc.isRpEliminar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        m = Asql.getMarcacion().eliminar(Id);
                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para eliminar registros");
                    }
                    break;
                case "Obtener":
                    if (acc.isRpEditar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        ma = Asql.getMarcacion().obtener(Id);
                        Ses.setAttribute("Mar", ma);
                        m.setMsj("Se ha obtenido el marcacion con id: " + ma.getMarId());
                        m.setTipo("Mod");
                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para consultar registros");
                    }

                    break;
                case "Listar":
                    //if (acc.isRpLeer()) {
                    List<MarcacionTab> ml = Asql.getMarcacion().listar();
                    Ses.setAttribute("lisMar", ml);
                    //} else {
                    // msj = "No tienes permisos para consultar registros";
                    //}
                    break;

                default:
                    ruta = "marcacion.jsp";

                    m.setTipo("Error");
                    m.setMsj("MySql Error");
                    m.setDetalles("No paso nada!!!");
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

        request.getRequestDispatcher("index.jsp").forward(request, response);
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
