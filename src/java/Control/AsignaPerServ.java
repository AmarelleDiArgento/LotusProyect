/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.AsignaPermisoTab;
import Modelo.Tabs.PermisoTab;
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
        if (Ses.getAttribute("log") != null) {

        Mensajes m = new Mensajes();
        if (Ses.getAttribute("msj") != null) {
            m = (Mensajes) Ses.getAttribute("msj");
        }

        String ruta;
        if (Ses.getAttribute("jsp") != null) {
            ruta = (String) Ses.getAttribute("jsp");
        } else {
            ruta = "usuario.jsp";
        }

        boolean L, N, M, E;
        int Rol;

        String Accion = request.getParameter("accion");
        try {
            AdminMs Asql = new AdminMs(pool);

            switch (Accion) {
                case "Insertar":

                    Rol = Integer.parseInt(request.getParameter("Rol"));
                    List<PermisoTab> Lp = Asql.getPermiso().listar();

                    L = false;
                    N = false;
                    M = false;
                    E = false;

                    for (PermisoTab p : Lp) {
                        AsignaPermisoTab aps = new AsignaPermisoTab(Rol, p.getPerId(), L, N, M, E);
                        Asql.getAsignaPer().insertar(aps);
                    }
                    m.setTipo("Ok");
                    m.setMsj("Modificacion Exitosa");
                    m.setDetalles(":D");
                    ruta = "rol.jsp";
                    break;

                case "modificar":

                    Rol = Integer.parseInt(request.getParameter("Rol"));
                    List<PermisoTab> Lpm = Asql.getPermiso().listar();
                    for (PermisoTab p : Lpm) {

                            L = false;
                            N = false;
                            M = false;
                            E = false;

                        if (request.getParameterValues(String.valueOf(p.getPerId())) != null) {

                            String[] cap = request.getParameterValues(String.valueOf(p.getPerId()));
                            for (String a : cap) {
                                switch (a) {
                                    case "L":
                                        L = true;
                                        break;
                                    case "N":
                                        N = true;
                                        break;
                                    case "M":
                                        M = true;
                                        break;
                                    case "E":
                                        E = true;
                                        break;

                                }
                            }
                        }
                            AsignaPermisoTab aps = new AsignaPermisoTab(Rol, p.getPerId(), L, N, M, E);
                            Asql.getAsignaPer().modificar(aps);

                        }
                        m.setTipo("Ok");
                        m.setMsj("Modificacion Exitosa");
                        m.setDetalles(":D");
                        ruta = "asignaper.jsp?Id=" + Rol;
                        break;
                    
            case "eliminar":

                    break;

                case "Listar":

                    break;
                case "Obtener":
                    int rol = Integer.parseInt(request.getParameter("Rol"));
                    List<AsignaPermisoTab> apli = Asql.getAsignaPer().listar(rol);
                    Ses.setAttribute("lisAp", apli);
                    ruta = "asignaper.jsp";
                    break;
                case "session":
                    UsuarioTab u = (UsuarioTab) Ses.getAttribute("log");
                    List<AsignaPermisoTab> apl = Asql.getAsignaPer().PerSession(u.getCedula());
                    Ses.setAttribute("ApSes", apl);
                    ruta = "permisos.do?accion=menu";

                    break;
                default:
            }
        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("Serv MySql Error" + ex.getSQLState());
            m.setDetalles("Detalles: " + ex);

        }catch (Exception ex) {
            m.setTipo("Error");
            m.setMsj("Serv Error " + ex.getMessage());
            m.setDetalles("Detalles: " + ex);
        }

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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
