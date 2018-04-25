/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Rol;
import Modelo.Tabs.RolTab;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Amarelle
 */
public class RolMs implements Rol{
    private final Connection con;

    public RolMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";

    @Override
    public String insertar(RolTab o) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String modificar(RolTab o) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public RolTab convertir(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public RolTab obtener(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<RolTab> listar() {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }
    
}
