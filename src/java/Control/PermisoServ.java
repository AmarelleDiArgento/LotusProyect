/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.PermisoTab;
import Modelo.Tabs.AsignaPerTab;
import Modelo.Tabs.UsuarioTab;
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
        String msj;
        String ruta;

        //if (Ses.getAttribute("log") != null) {
        String Accion = request.getParameter("accion");
        UsuarioTab uSes = (UsuarioTab) Ses.getAttribute("log");

        List<AsignaPerTab> ap = (List<AsignaPerTab>) Ses.getAttribute("ApSes");
        AsignaPerTab acc = null;
        for (AsignaPerTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Permiso")) {
                acc = a;
            }
        }
        if (Ses.getAttribute("msj") != null) {
            msj = (String) Ses.getAttribute("msj");
        } else {
            msj = "";
        }
        if (Ses.getAttribute("jsp") != null) {
            ruta = (String) Ses.getAttribute("jsp");
        } else {
            ruta = "permiso.jsp";
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
                    if (acc.isRpNuevo()) {
                        Nombre = request.getParameter("Nombre");
                        Modulo = request.getParameter("Modulo");
                        Descripcion = request.getParameter("Descripcion");
                        Ico = request.getParameter("Ico");
                        Url = request.getParameter("Url");
                        E = request.getParameter("Estado");
                        Estado = E.equals("on");
                        p = new PermisoTab(Nombre, Modulo, Descripcion, Ico, Url, Estado);
                        msj = Asql.getPermiso().insertar(p);

                    } else {
                        msj = "No tienes permisos para hacer registros";
                    }

                    break;

                case "modificar":
                    if (acc.isRpEditar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        Nombre = request.getParameter("Nombre");
                        Modulo = request.getParameter("Modulo");
                        Descripcion = request.getParameter("Descripcion");
                        Ico = request.getParameter("Ico");
                        Url = request.getParameter("Url");
                        E = request.getParameter("Estado");
                        Estado = E.equals("on");
                        p = new PermisoTab(Id, Nombre, Modulo, Descripcion, Ico, Url, Estado);
                        msj = Asql.getPermiso().modificar(p);
                    } else {
                        msj = "No tienes permisos para hacer modificaciones";
                    }
                    break;
                case "eliminar":
                    if (acc.isRpEliminar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        msj = Asql.getPermiso().eliminar(Id);
                    } else {
                        msj = "No tienes permisos para eliminar registros";
                    }
                    break;
                case "obtener":
                    if (acc.isRpLeer()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        p = Asql.getPermiso().obtener(Id);
                        Ses.setAttribute("Per", p);
                        msj = "Se ha obtenido el Permiso con id: " + p.getPerId();
                    } else {
                        msj = "No tienes permisos para consultar registros";
                    }

                    break;
                case "Listar":
                    if (acc.isRpLeer()) {
                        List<PermisoTab> pl = Asql.getPermiso().listar();
                        Ses.setAttribute("arrPer", pl);
                    } else {
                        msj = "No tienes permisos para consultar registros";
                    }
                    break;
                case "menu":

                    List<PermisoTab> menu = Asql.getPermiso().menu(uSes.getCedula());
                    Ses.setAttribute("Menu", menu);
                    msj = "Bienvenido " + uSes.toFullName();
                    ruta = "main.jsp";

                    break;

                default:
                    ruta = "permiso.jsp";
            }
        } catch (SQLException ex) {
            msj = "MySql Error: " + ex;

        } catch (Exception ex) {
            msj = "Error: " + ex;
        }
        //}else{
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
