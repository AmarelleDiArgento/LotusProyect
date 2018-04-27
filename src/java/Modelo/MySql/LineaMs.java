/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Linea;
import Modelo.Tabs.LineaTab;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author ALEJANDRA MEDINA
 */
public class LineaMs implements Linea {
    
     private final Connection con;

    public LineaMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";
    final String Login = "";

    @Override
    public String insertar(LineaTab o) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String modificar(LineaTab o) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public LineaTab convertir(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public LineaTab obtener(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<LineaTab> listar() {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
