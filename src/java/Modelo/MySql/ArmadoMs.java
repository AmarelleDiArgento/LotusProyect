/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Armado;
import Modelo.Tabs.ArmadoTab;
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
public class ArmadoMs implements Armado {

    private final Connection con;

    public ArmadoMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call lotusproyect.armadoIn(?, ?, ?);";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "call lotusproyect.armadoLi();";
    
    @Override
    public String insertar(ArmadoTab a) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, a.getArmNombre());
            stat.setString(2, a.getArmDescripcion());
          
            if (a.isArmEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(9, 0);
            }
            if (stat.executeUpdate() == 0) {
                msj = "Error al ingresar los datos";
            } else {
                msj = a.getArmNombre() + " agregado exitosamente";
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
    public String modificar(ArmadoTab o) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(Integer id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArmadoTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("ArmId");
        String nombre = rs.getString("ArmNombre");
        String Descripcion = rs.getString("ArmDescripcion");
        int st = rs.getInt("ArmEstado");
        boolean status = st == 1;
        ArmadoTab uTab = new ArmadoTab(Id, nombre, Descripcion, status);
        return uTab;}

    @Override
    public ArmadoTab obtener(Integer id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ArmadoTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<ArmadoTab> aTab = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    aTab.add(convertir(rs));
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
        return aTab;
    }

    
}
