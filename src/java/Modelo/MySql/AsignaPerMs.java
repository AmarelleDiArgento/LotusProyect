/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Tabs.AsignaPerTab;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import Modelo.Interface.AsignaPer;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Amarelle
 */
public class AsignaPerMs implements AsignaPer{
    private final Connection con;

    public AsignaPerMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";
    final String PerSession = "call LotusProyect.rolPerSession(?);";

    @Override
    public List<AsignaPerTab> PerSession(String cedula) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaPerTab> apModel = new ArrayList<>();
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
                        Logger.getLogger(AsignaPerMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (stat != null) {
                    try {
                        stat.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AsignaPerMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AsignaPerMs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apModel;
    }

    @Override
    public List<AsignaPerTab> listar(Integer rol) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String insertar(AsignaPerTab o) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String modificar(AsignaPerTab o) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AsignaPerTab convertir(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }
    
        public AsignaPerTab coSession(ResultSet rs) throws SQLException {

        String Permiso = rs.getString("PerNombre");
        int l = rs.getInt("rolperLeer");
        boolean leer = l == 1;
        int n = rs.getInt("rolperNuevo");
        boolean nuevo = n == 1;
        int m = rs.getInt("rolperEditar");
        boolean modificar = m == 1;
        int e = rs.getInt("rolperEliminar");
        boolean eliminar = e == 1;
        AsignaPerTab apModel = new AsignaPerTab(Permiso, leer, nuevo, modificar, eliminar);
        return apModel;
    }

    @Override
    public AsignaPerTab obtener(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<AsignaPerTab> listar() {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }
}
