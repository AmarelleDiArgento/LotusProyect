/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Poscosecha;
import Modelo.Tabs.PasoTab;
import Modelo.Tabs.PoscosechaTab;
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
public abstract class PoscosechaMs implements Poscosecha {

    private final Connection con;

    public PoscosechaMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";
    final String Login = "";  
    
    @Override
    public String insertar(PoscosechaTab p) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, p.getPosNombre());
            stat.setString(2, p.getPosDireccion());
            stat.setString(3, p.getPosTelefono());

            if (p.isPosEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(9, 0);
            }
            if (stat.executeUpdate() == 0) {
                msj = "Error al ingresar los datos";
            } else {
                msj = p.getPosNombre() + " agregado exitosamente";
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
    public PoscosechaTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("PosId");
        String nombre = rs.getString("PosNombre");
        String direccion = rs.getString("PosDireccion");
        String telefono = rs.getString("PosTelefono");
        int st = rs.getInt("PosEstado");
        boolean status = st == 1;
        PoscosechaTab aTab = new PoscosechaTab (Id, nombre, direccion,telefono,status);
        return aTab;
    }

  @Override
     public List<PoscosechaTab> listar() {
    PreparedStatement stat = null;
        ResultSet rs = null;
        List<PoscosechaTab> uModel = new ArrayList<>();
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
    public String modificar(PoscosechaTab o) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public PoscosechaTab obtener(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

}