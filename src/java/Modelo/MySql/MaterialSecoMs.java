/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.MaterialSeco;
import Modelo.Tabs.MarcacionTab;
import Modelo.Tabs.MaterialSecoTab;
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
public abstract class MaterialSecoMs implements MaterialSeco {

    private final Connection con;

    public MaterialSecoMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";
    final String Login = ""; 
    
    @Override
    public String insertar(MaterialSecoTab m) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, m.getMsNombre());
            stat.setString(2, m.getMsImagen());
            stat.setString(3, m.getMsDescripcion());
            stat.setInt(4, m.getMsAlto());
            stat.setInt(5, m.getMsAncho());
            stat.setInt(6, m.getMsProfundo());

            if (m.isMsEstado()) {
                stat.setInt(7, 1);
            } else {
                stat.setInt(9, 0);
            }
            if (stat.executeUpdate() == 0) {
                msj = "Error al ingresar los datos";
            } else {
                msj = m.getMsNombre() + " agregado exitosamente";
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
    public MaterialSecoTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("MsId");
        String nombre = rs.getString("MsNombre");
        String imagen = rs.getString("MsImagen");
        String descripcion = rs.getString("MsDescripcion");
        int alto = rs.getInt("MsAlto");
        int ancho = rs.getInt("MsAncho");
        String profundo = rs.getString("MsProfundo");

        
        int st = rs.getInt("MsEstado");
        boolean status = st == 1;
        MaterialSecoTab mTab = new MaterialSecoTab (Id, nombre, descripcion,imagen, status,alto,ancho,profundo);
        return mTab;
    }
    
 @Override
     public List<MaterialSecoTab> listar() {
    PreparedStatement stat = null;
        ResultSet rs = null;
        List<MaterialSecoTab> uModel = new ArrayList<>();
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
    public String modificar(MaterialSecoTab o) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public MaterialSecoTab obtener(String id) {
        throw new UnsupportedOperationException("Método en proceso"); //To change body of generated methods, choose Tools | Templates.
    }


}