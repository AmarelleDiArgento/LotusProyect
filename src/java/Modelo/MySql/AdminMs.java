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
import Modelo.Interface.Armado;
import Modelo.Interface.Permiso;
import Modelo.Interface.Rol;
import javax.sql.DataSource;
import Modelo.Interface.AsignaPermiso;
import Modelo.Interface.Menu;
import Modelo.Interface.Parametros;
import Modelo.Interface.Paso;
import Modelo.Interface.Poscosecha;
import Modelo.Interface.Preliminar;
import Modelo.Interface.Producto;
import Modelo.Interface.Tipo;
import Modelo.Interface.Variedad;
import Modelo.Tabs.VariedadTab;
import javafx.geometry.Pos;

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

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LotusProyect", "lotusproyect", "1311138C72A04BB7D228AFB9D574ED2D00DFD264C67161A958AD62E32672DEFF");
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
    private AsignaPermiso AsgPer = null;
    private Armado Arm = null;
    private Variedad Var =null;

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
    public AsignaPermiso getAsignaPer() {
        if (AsgPer == null) {
            AsgPer = new AsignaPermisoMs(con);
        }
        return AsgPer;
    }

    @Override
    public Armado getArmado() {
        if (Arm == null) {
            Arm = new ArmadoMs(con);
        }
        return Arm;
    }
    @Override
    public Variedad getVariedad() {
        if (Var == null) {
            Var = new VariedadMs(con) {
                @Override
                public String eliminar(Integer id) {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public VariedadTab obtener(Integer id) {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }
            };
        }
        return Var;
    }
    @Override
    public Tipo getTipo() {
        if (Ti == null) {
            Ti = new TipoMs(con);
        }
        return Ti;
    }
    @Override
    public Producto getProducto() {
        if (Pro == null) {
            Pro = new ProductoMs(con);
        }
        return Pro;
    }
   
    @Override
    public Preliminar getPreliminar() {
        if (Pre == null) {
            Pre = new PreliminarsMs(con);
        }
        return Pre;
   
    }
    @Override
    public Poscosecha getPoscosecha() {
        if (Pos == null) {
            Pos = new PoscosechaMs(con);
        }
        return Pos;
    }
    @Override
    public Paso getPaso() {
        if (Pas == null) {
            Pas = new PasoMs(con);
        }
        return Pas;
}
 @Override
    public Parametros getParametros() {
        if (Par == null) {
            Par = new ParametrosMs(con);
        }
        return Par;
}

 @Override
    public Menu getMenu() {
        if (Me == null) {
            Me = new MenuMs(con);
        }
        return Me;
}

 @Override
    public Menu getMenu() {
        if (Me == null) {
            Me = new MenuMs(con);
        }
        return Me;
}
}
