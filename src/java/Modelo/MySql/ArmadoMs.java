/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Armado;
import Modelo.Tabs.ArmadoTab;
import Servicios.Mensajes;
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
    Mensajes m;

    public ArmadoMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProyect.armadoIn(?, ?, ?);";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "call LotusProyect.armadoLi();";

    @Override
    public Mensajes insertar(ArmadoTab a) {

        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, a.getArmNombre());
            stat.setString(2, a.getArmDescripcion());

            if (a.isArmEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(3, 0);
            }
            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(a.getArmNombre() + " agregado exitosamente");
            }

        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("Error Mysql");
            m.setDetalles("Error al ingresar los datos:" + ex.getMessage());
        } finally {
            if (stat != null) {
                try {
                    stat.close();
                } catch (SQLException ex) {
                    m.setTipo("Error");
                    m.setMsj("Error Mysql Statement");
                    m.setDetalles("Error Statement, ingresar los datos:" + ex.getMessage());
                }
            }

        }
        return m;
    }

    @Override
    public ArmadoTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("ArmId");
        String nombre = rs.getString("ArmNombre");
        String descripcion = rs.getString("ArmDescripcion");
        int st = rs.getInt("ArmEstado");
        boolean status = st == 1;
        ArmadoTab uTab = new ArmadoTab(Id, nombre, descripcion, status);
        return uTab;
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

    @Override
    public ArmadoTab obtener(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   @Override
    public Mensajes modificar(ArmadoTab o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Mensajes eliminar(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
