/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Tabs.AsignaPermisoTab;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Modelo.Interface.AsignaPermiso;

/**
 *
 * @author Amarelle
 */
public class AsignaPermisoMs implements AsignaPermiso{
    private final Connection con;

    public AsignaPermisoMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProyect.AsgPerIn(?, ?, ?, ?, ?, ?);";
    final String Modificar = "call LotusProyect.AsgPerMo(?, ?, ?, ?, ?, ?);";
    final String Eliminar = "call LotusProyect.AsgPerEl(?, ?)";
    final String Consultar = "call LotusProyect.AsgPerCo(?, ?)";
    final String ListarTodos = "call LotusProyect.AsgPerLi(?);";
    final String PerSession = "call LotusProyect.AsgPerSession(?);";

    @Override
    public List<AsignaPermisoTab> PerSession(String cedula) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaPermisoTab> apModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(PerSession);
                stat.setString(1, cedula);
                rs = stat.executeQuery();
                while (rs.next()) {
                    apModel.add(coSession(rs));
                }
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AsignaPermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (stat != null) {
                    try {
                        stat.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AsignaPermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AsignaPermisoMs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apModel;
    }

    @Override
    public List<AsignaPermisoTab> listar(Integer rol) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String insertar(AsignaPermisoTab o) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String modificar(AsignaPermisoTab o) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AsignaPermisoTab convertir(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }
    
        public AsignaPermisoTab coSession(ResultSet rs) throws SQLException {

        String Permiso = rs.getString("PerNombre");
        int l = rs.getInt("rolperLeer");
        boolean leer = l == 1;
        int n = rs.getInt("rolperNuevo");
        boolean nuevo = n == 1;
        int m = rs.getInt("rolperEditar");
        boolean modificar = m == 1;
        int e = rs.getInt("rolperEliminar");
        boolean eliminar = e == 1;
        AsignaPermisoTab apModel = new AsignaPermisoTab(Permiso, leer, nuevo, modificar, eliminar);
        return apModel;
    }

    @Override
    public AsignaPermisoTab obtener(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<AsignaPermisoTab> listar() {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }
}
