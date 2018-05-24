/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Menu;
import Modelo.Tabs.MaterialSecoTab;
import Modelo.Tabs.MenuTab;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ALEJANDRA MEDINA
 */
public abstract class MenuMs implements Menu {

    private final Connection con;

    public MenuMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";
    final String Login = ""; 
    
    @Override
    public String insertar(MenuTab a) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, a.getMenPortada());
            stat.setString(2, a.getMenSuperior());
            stat.setString(3, a.getMenLongitud());
            stat.setString(4, a.getMenCauchos());
            stat.setString(5, a.getMenDescripcion());

            if (a.isMenEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(9, 0);
            }
            if (stat.executeUpdate() == 0) {
                msj = "Error al ingresar los datos";
            } else {
                msj = a.getMenPortada() + " agregado exitosamente";
            }

        } catch (SQLException ex) {
            msj = "Error de SQL " + ex;
        } finally {
            if (stat != null) {
                try {
                    stat.close();
                } catch (SQLException ex) {
                    msj = "Error de SQL " + ex;
                }
            }

        }
        return msj;
  }
    
     @Override
    public MenuTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("MenuId");
        String nombre = rs.getString("MenPortada");
        String superior = rs.getString("MenSuperior");
        String longitud = rs.getString("MenLongitud");
        String cauchos = rs.getString("MenCauchos");
        String descripcion = rs.getString("MenDescripcion");
        int st = rs.getInt("MenEstado");
        boolean status = st == 1;
        MenuTab mTab = new MenuTab (Id, nombre, superior,longitud,cauchos,descripcion,status);
        return mTab;
    }

    
   @Override
     public List<MenuTab> listar() {
    PreparedStatement stat = null;
        ResultSet rs = null;
        List<MenuTab> uModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    uModel.add(convertir(rs));
                }
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException ex) {
                        System.out.println("Error sql rs: " + ex);
                    }
                }
                if (stat != null) {
                    try {
                        stat.close();
                    } catch (SQLException ex) {
                        System.out.println("Error sql st: " + ex);
                    }
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error sql: " + ex);
        }
        return uModel;    
    }
    @Override
    public String modificar(MenuTab o) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public MenuTab obtener(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

}