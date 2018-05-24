/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Fitosanidad;
import Modelo.Tabs.FitoProductoTab;
import Modelo.Tabs.FitosanidadTab;
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
public abstract class FitosanidadMs implements Fitosanidad {
    
     private final Connection con;

    public FitosanidadMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";
    final String Login = "";
    
    @Override
    public String insertar(FitosanidadTab f) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, f.getFitNombre());
            stat.setString(2, f.getFitDescripcion());
            stat.setBoolean(3, f.getFitTipo());

          
            if (f.isFitEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(9, 0);
            }
            if (stat.executeUpdate() == 0) {
                msj = "Error al ingresar los datos";
            } else {
                msj = f.getFitNombre() + " agregado exitosamente";
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
    public FitosanidadTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("FitId");
        String nombre = rs.getString("FitNombre");
        String descripcion = rs.getString("FitDescripcion");
        Boolean tipo = rs.getBoolean("FitTipo");
        String imagen = rs.getString("FitImagen");


        int st = rs.getInt("FitEstado");
        boolean status = st == 1;
        FitosanidadTab fTab = new FitosanidadTab (Id, nombre, descripcion,tipo,imagen,status);
        return fTab;
    }

        
 @Override
     public List<FitosanidadTab> listar() {
    PreparedStatement stat = null;
        ResultSet rs = null;
        List<FitosanidadTab> uModel = new ArrayList<>();
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
    public String modificar(FitosanidadTab o) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public FitosanidadTab obtener(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

}
