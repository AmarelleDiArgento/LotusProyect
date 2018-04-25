/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.AsignaPerTab;
import Modelo.Tabs.RolTab;
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
        String msj;
        String ruta;

        //if (Ses.getAttribute("log") != null) {
        String Accion = request.getParameter("accion");

        List<AsignaPerTab> ap = (List<AsignaPerTab>) Ses.getAttribute("ApSes");
        AsignaPerTab acc = null;
        for (AsignaPerTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Rol")) {
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
            ruta = "rol.jsp";
        }
        RolTab r = null;
        int Id;
        String Nombre;
        String Descripcion;
        Boolean Estado;
        String E;

        try {
            AdminMs Asql = new AdminMs(pool);

            switch (Accion) {
                case "Insertar":
                    if (acc.isRpNuevo()) {
                        Nombre = request.getParameter("Nombre");
                        Descripcion = request.getParameter("Descripcion");
                        E = request.getParameter("Estado");
                        Estado = E.equals("on");
                        r = new RolTab(Nombre, Descripcion, Estado);
                        msj = Asql.getRol().insertar(r);

                    } else {
                        msj = "No tienes permisos para hacer registros";
                    }

                    break;

                case "modificar":
                    if (acc.isRpEditar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        Nombre = request.getParameter("Nombre");
                        Descripcion = request.getParameter("Descripcion");
                        E = request.getParameter("Estado");
                        Estado = E.equals("on");
                        r = new RolTab(Id, Nombre, Descripcion, Estado);
                        msj = Asql.getRol().modificar(r);
                    } else {
                        msj = "No tienes permisos para hacer modificaciones";
                    }
                    break;
                case "eliminar":
                    if (acc.isRpEliminar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        msj = Asql.getRol().eliminar(Id);
                    } else {
                        msj = "No tienes permisos para eliminar registros";
                    }
                    break;
                case "obtener":
                    if (acc.isRpLeer()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        r = Asql.getRol().obtener(Id);
                        Ses.setAttribute("Rol", r);
                        msj = "Se ha obtenido el rol con id: " + r.getRolId();
                    } else {
                        msj = "No tienes permisos para consultar registros";
                    }

                    break;
                case "Listar":
                    //if (acc.isRpLeer()) {
                    List<RolTab> rl = Asql.getRol().listar();
                    Ses.setAttribute("lisR", rl);
                    //} else {
                    msj = "No tienes permisos para consultar registros";
                    //}
                    break;

                default:
                    ruta = "rol.jsp";
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
