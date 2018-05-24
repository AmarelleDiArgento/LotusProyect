/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Marcacion;
import Modelo.Tabs.MaestroTab;
import Modelo.Tabs.MarcacionTab;
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
public abstract class MarcacionMs implements Marcacion {
    
     private final Connection con;

    public MarcacionMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";
    final String Login = "";
    
    @Override
    public String insertar(MarcacionTab m) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, m.getMarNombre());
            stat.setString(2, m.getMarPortada());
          
            if (m.isMarEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(9, 0);
            }
            if (stat.executeUpdate() == 0) {
                msj = "Error al ingresar los datos";
            } else {
                msj =m.getMarNombre() + " agregado exitosamente";
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
    public MarcacionTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("MarId");
        String nombre = rs.getString("MarNombre");
        String portada= rs.getString("MarPortada");
        int st = rs.getInt("MarEstado");
        boolean status = st == 1;
        MarcacionTab mTab = new MarcacionTab (Id, nombre, portada, status);
        return mTab;
    }
  @Override
     public List<MarcacionTab> listar() {
    PreparedStatement stat = null;
        ResultSet rs = null;
        List<MarcacionTab> uModel = new ArrayList<>();
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
    public String modificar(MarcacionTab o) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public MarcacionTab obtener(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

}
