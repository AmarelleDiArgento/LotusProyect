/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.AsignaPermisoTab;
import Modelo.Tabs.UsuarioTab;
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
import javax.sql.DataSource;

/**
 *
 * @author Amarelle
 */
public class AsignaPerServ extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession Ses = request.getSession(true);

        Mensajes m = new Mensajes();
        if (Ses.getAttribute("msj") != null) {
            m = (Mensajes) Ses.getAttribute("msj");
        }


        String ruta = "";
        String Dato = "";
        String Accion = request.getParameter("accion");
        try {
            AdminMs Asql = new AdminMs(pool);

            switch (Accion) {
                case "Insertar":

                    break;
                case "modificar":
                    boolean L,
                     N,
                     M,
                     E;
                    List<String> msjs = null;
                    List<AsignaPermisoTab> li = (List<AsignaPermisoTab>) Ses.getAttribute("Aprr");
                    int Rol = li.get(1).getRolId();

                    for (AsignaPermisoTab ap : li) {
                        int P = ap.getPerId();
                        String[] cap = request.getParameterValues(ap.getnPermiso());
                        L = false;
                        N = false;
                        M = false;
                        E = false;
                        for (String a : cap) {
                            switch (a) {
                                case "1":
                                    L = true;
                                    break;
                                case "2":
                                    N = true;
                                    break;
                                case "3":
                                    M = true;
                                    break;
                                case "4":
                                    E = true;
                                    break;

                            }
                        }
                        AsignaPermisoTab aps = new AsignaPermisoTab(Rol, P, L, N, M, E);
                        //msj = msj + Asql.getAsignaPer().modificar(aps);
                        P++;
                    }
                    ruta = "rol.jsp";
                    break;
                case "eliminar":

                    break;

                case "Obtener":
                    int rol = Integer.parseInt(request.getParameter("rol"));
                    List<AsignaPermisoTab> apli = Asql.getAsignaPer().listar(rol);
                    Ses.setAttribute("Aprr", apli);
                    ruta = "rol.jsp";
                    break;
                case "session":
                    UsuarioTab u = (UsuarioTab) Ses.getAttribute("log");
                    List<AsignaPermisoTab> apl = Asql.getAsignaPer().PerSession(u.getCedula());
                    Ses.setAttribute("ApSes", apl);
                    m.setMsj("Bienvenido " + u.toFullName());
                    m.setTipo("Msj");
                    ruta = "main.jsp";

                    break;
                default:
            }
        } catch (SQLException ex) {
                        m.setTipo("Error");
                        m.setMsj("MySql Error");
                        m.setDetalles("Detalles: " +ex);

        } catch (Exception ex) {
                        m.setTipo("Error");
                        m.setMsj("Error");
                        m.setDetalles("Detalles: " +ex);
            }
        
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
