/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Permiso;
import Modelo.Tabs.PermisoTab;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Amarelle
 */
public class PermisoMs implements Permiso {

    private final Connection con;

    public PermisoMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProyect.permisoIn(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    final String Modificar = "call LotusProyect.permisoMo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    final String Eliminar = "call LotusProyect.permisoEl(?);";
    final String Consultar = "call LotusProyect.permisoCo(?);";
    final String ListarTodos = "call LotusProyect.permisoLi();";
    final String Menu = "call LotusProyect.perMenu(?);";
    @Override
    public String insertar(PermisoTab o) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String modificar(PermisoTab o) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PermisoTab convertir(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PermisoTab obtener(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<PermisoTab> listar() {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    private PermisoTab conMenu(ResultSet rs) throws SQLException {
        String Permiso = rs.getString("PerNombre");
        String Ico = rs.getString("PerIco");
        String Url = rs.getString("PerUrl");
        PermisoTab pModel = new PermisoTab(Permiso, Ico, Url);
        return pModel;

    }

    @Override //Menuuuu!!!
    public List<PermisoTab> menu(String cedula) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<PermisoTab> pModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(Menu);
                stat.setString(1, cedula);

                rs = stat.executeQuery();
                while (rs.next()) {
                    pModel.add(conMenu(rs));
                }
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(PermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (stat != null) {
                    try {
                        stat.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(PermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PermisoMs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pModel;

    }

}
