/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import Modelo.Interface.Admin;
import Modelo.Interface.Permiso;
import Modelo.Interface.Rol;
import javax.sql.DataSource;
import Modelo.Interface.AsignaPer;

/**
 *
 * @author Amarelle
 */
public class AdminMs implements Admin {

    private Connection con = null;
    private DataSource pool = null;

    /*public AdministradorSql(DataSource con) throws SQLException{
        
        this.con = con.getConnection();
    }*/
    public AdminMs() throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LotusProyect", "root", "0000");
        } catch (ClassNotFoundException ex) {
            System.out.print("Class for name " + ex);
        }
    }

    public AdminMs(DataSource ds) throws SQLException {
        this.pool = ds;
        this.con = pool.getConnection();
    }

    private Usuario Usu = null;
    private Permiso Per = null;
    private Rol Rol = null;
    private AsignaPer RolPer = null;

    @Override
    public Usuario getUsuario() {
        if (Usu == null) {
            Usu = new UsuarioMs(con);
        }
        return Usu;
    }

    @Override
    public Rol getRol() {
        if (Rol == null) {
            Rol = new RolMs(con);
        }
        return Rol;
    }

    @Override
    public Permiso getPermiso() {
        if (Per == null) {
            Per = new PermisoMs(con);
        }
        return Per;
    }

    @Override
    public AsignaPer getAsignaPer() {
        if (RolPer == null) {
            RolPer = new AsignaPerMs(con);
        }
        return RolPer;
    }
}
