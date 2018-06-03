/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import Modelo.Interface.Parametros;
import Modelo.MySql.AdminMs;
import Modelo.Tabs.ArmadoTab;
import Modelo.Tabs.AsignaPermisoTab;
import Modelo.Tabs.ParametrosTab;
import Modelo.Tabs.PermisoTab;
import Modelo.Tabs.ProductoTab;
import Modelo.Tabs.RolTab;
import Modelo.Tabs.UsuarioTab;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Amarelle
 */
public class Probador {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Mensajes m = new Mensajes();
        try {
            AdminMs Asql = new AdminMs();
            //Insertar usuario
            /*
            String Cedula = "1013579";
            String Nombre = "Diana";
            String Apellido = "Ardila";
            String Loger = "dardila";
            String Password = "1234";
            String Extencion = "2316";
            String Telefono = "319234";
            String Email = Loger + "@eliteflower.com";
            Boolean Estado = true;
            int RolId = 1;
            UsuarioTab u = new UsuarioTab(Cedula, Nombre, Apellido, Loger, Password, Extencion, Telefono, Email, Estado, RolId);
            msj = Asql.getUsuario().insertar(u);
             */
            //modificar usuario
            /*
            String Cedula = "1013579";
            String Nombre = "Diana";
            String Apellido = "Ardila";
            String Loger = "dardila";
            String Password = "1234";
            String Extencion = "2316";
            String Telefono = "319234";
            String Email = Loger + "@eliteflower.com";
            Boolean Estado = false;
            int RolId = 1;
            UsuarioTab u = new UsuarioTab(Cedula, Nombre, Apellido, Loger, Password, Extencion, Telefono, Email, Estado, RolId);
            msj = Asql.getUsuario().modificar(u);
             */
            //Eliminar usuario
            /*
            String Cedula = "1013579";
            msj = Asql.getUsuario().eliminar(Cedula);
             */
            //Consultar usuario por cedula
            /*
            String Cedula = "1070949";
            UsuarioTab u = Asql.getUsuario().obtener(Cedula);
            msj = u.toFullName();
             */
            //Listar todos los usuarios
            /* 
            List<UsuarioTab> uList = Asql.getUsuario().listar();
            for (UsuarioTab u : uList) {
                System.out.println(u.toFullName());
            }
            
             */
 /*String Loger = "almoreno";
            String pass = "1234";
            
            UsuarioTab u = Asql.getUsuario().login(Loger, pass);
            msj = u.toFullName();*/
 /*List<RolTab> rlis = Asql.getRol().listar();
            for (RolTab r : rlis) {
                System.out.println(r.toString());
            }*/
            //Asql.getArmado().insertar(o)
            /*List<AsignaPerTab> apList = Asql.getAsignaPer().PerSession("1070949");
            
            
            for (AsignaPermisoTab ap : apList) {
                System.out.println(ap.toString());
            }*/
 /*
            String nombre = "Queso";
            String descrip = "Quesito Coteño, ajá!";
            Boolean est = true;
            RolTab r = new RolTab(nombre, descrip, est);
            msj = Asql.getRol().insertar(r);
             */
 /*
            int id = 7;
            String nombre = "Queso";
            String descrip = "Quesito Coteño, ajá!";
            Boolean est = true;
            RolTab r = new RolTab(id, nombre, descrip, est);
            msj = Asql.getRol().modificar(r);
             */
 /*
            int id = 7;
            msj = Asql.getRol().eliminar(id);
             */
 /*
            int id = 7
            RolTab r = Asql.getRol().obtener(id);
            msj = r.toString();
             */
 /*
            List<RolTab> rl = Asql.getRol().listar();
            for (RolTab r : rl) {
                System.out.println(r.toString());
            }
             */
            ParametrosTab par = Asql.getParametros().obtener(3);
            System.out.println(par.getParNombre());
 
        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("Error " + ex.getLocalizedMessage());
            m.setDetalles("Error sql: " + ex.getMessage());
        }

        System.out.println(m.getTipo());
        System.out.println(m.getMsj());
        System.out.println(m.getDetalles());

    }
}
