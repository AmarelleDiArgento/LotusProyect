/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.ControlCambios;
import Modelo.Tabs.ControlCambioTab;
import Servicios.Mensajes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author ale-j
 */
public class ControlCambiosMs  implements ControlCambios{
    private final Connection con;
    Mensajes m = null;

    public ControlCambiosMs(Connection con) {

        this.con = con;
    }
     final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";
    final String Login = "";
    
    
  @Override
    public Mensajes insertar(ControlCambioTab c) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, c.getCCAntes());
            stat.setString(2, c.getCCDespues());
            stat.setString(2, c.getCCUsuarios());

          
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(c.getCCUsuarios() + " agregado exitosamente");
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
    public Mensajes modificar(ControlCambioTab o) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Mensajes eliminar(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ControlCambioTab convertir(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ControlCambioTab obtener(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ControlCambioTab> listar() {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }
}
  