/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Modelo.MySql.AdminMs;
import Modelo.Tabs.AsignaPerTab;
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
        String msj = "";
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
            String Loger = "almoreno";
            String pass = "1234";
            
            UsuarioTab u = Asql.getUsuario().login(Loger, pass);
            msj = u.toFullName();
            /*List<AsignaPerTab> apList = Asql.getAsignaPer().PerSession("1070949");
            
            
            for (AsignaPerTab ap : apList) {
                System.out.println(ap.toString());
            }*/

        } catch (SQLException ex) {
            msj = "Error sql: " + ex;
        }
        System.out.println(msj);

    }
}
