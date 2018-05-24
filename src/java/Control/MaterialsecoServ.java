/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.MaterialSecoTab;
import Modelo.Tabs.AsignaPermisoTab;
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
 * @author ale-j
 */
public class MaterialsecoServ extends HttpServlet {

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

        List<AsignaPermisoTab> ap = (List<AsignaPermisoTab>) Ses.getAttribute("ApSes");
        AsignaPermisoTab acc = null;
        for (AsignaPermisoTab a : ap) {
            if (a.getnPermiso().equalsIgnoreCase("Rol")) {
                acc = a;
            }
        }

        if (Ses.getAttribute("jsp") != null) {
            ruta = (String) Ses.getAttribute("jsp");
        } else {
            ruta = "rol.jsp";
        }
        MaterialSecoTab ma = null;
        int Id;
      String TiMNombre;
     String MsNombre;
     String MsImagen;
     String MsDescripcion;
     int MsAlto;
     int MsAncho;
     int MsProfundo;
     Boolean Estado;
     String E;

        try {
            AdminMs Asql = new AdminMs(pool);
            switch (Accion) {
                case "Insertar":
                    if (acc.isRpNuevo()) {
                        MsNombre = request.getParameter("MsNombre");
                        MsImagen = request.getParameter("MsImagen");
                        MsDescripcion = request.getParameter("MsDescripcion");
                        MsAlto = request.getParameter("MsAlto");
                        MsAncho = request.getParameter("MsAncho");
                        MsProfundo = request.getParameter("MsProfundo");
                        TiMNombre = request.getParameter("TiMNombre");
                        E = request.getParameter("Estado");
                        Estado = E.equals("on");
                        me = new PoscosechaTab(MsNombre,MenSuperior,MsImagen,MsDescripcion,MsAlto,MsAncho,MsProfundo,TiMNombre,Estado);
                        m.setMsj(Asql.getPoscosecha().insertar(me));
                        m.setTipo("Ok");

                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para hacer registros");
                    }

                    break;

                case "modificar":
                    if (acc.isRpNuevo()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        MenPortada = request.getParameter("MenPortada");
                        MenSuperior = request.getParameter("MenSuperior");
                        MenLongitud = request.getParameter("MenLongitud");
                        MenCauchos = request.getParameter("MenCauchos");
                        MenDescripcion = request.getParameter("MenDescripcion");
                        Marcacion = request.getParameter("Marcacion");
                        E = request.getParameter("Estado");
                        Estado = E.equals("on");
                        me = new PoscosechaTab(MenPortada,MenSuperior,MenLongitud,MenCauchos,MenDescripcion,Marcacion,Estado);
                        m.setMsj(Asql.getPoscosecha().insertar(me));
                        m.setTipo("Ok");
                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para hacer modificaciones");
                    }
                    break;
                case "eliminar":
                    if (acc.isRpEliminar()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        m.setMsj(Asql.getRol().eliminar(Id));
                        m.setTipo("Ok");
                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para eliminar registros");
                    }
                    break;
                case "obtener":
                    if (acc.isRpLeer()) {
                        Id = Integer.parseInt(request.getParameter("Id"));
                        m = Asql.getMenu().obtener(Id);
                        Ses.setAttribute("men", me);
                        m.setMsj("Se ha obtenido el menu con id: " + me.getMenuId());
                        m.setTipo("Ok");
                    } else {
                        m.setTipo("Error");
                        m.setMsj("No tienes permisos para consultar registros");
                    }

                    break;
                case "Listar":
                    //if (acc.isRpLeer()) {
                    List<MenuTab> mel = Asql.getPoscosecha().listar();
                    Ses.setAttribute("lisMe", mel);
                    //} else {
                    // msj = "No tienes permisos para consultar registros";
                    //}
                    break;

                default:
                    ruta = "menu.jsp";
            }
        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("MySql Error");
            m.setDetalles("Detalles" + ex.getMessage());

        } catch (Exception ex) {
            m.setTipo("Error");
            m.setMsj("Error");
            m.setDetalles("Detalles" + ex.getMessage());

        }
        //}else{
        //    ruta = "index.jsp";
        //    msj = "No has iniciado sesión";
        //}
        if (m.getmenu() != null) {
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

