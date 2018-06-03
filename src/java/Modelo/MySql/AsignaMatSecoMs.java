/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.AsignaMatSeco;
import Modelo.Tabs.AsignaMatSecoTab;
import Servicios.Mensajes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ale-j
 */
public class AsignaMatSecoMs implements AsignaMatSeco  {
  
    private final Connection con;
    Mensajes m;

    public AsignaMatSecoMs(Connection con) {

        this.con = con;
    }
    
    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = ""; {
    
}
    
     @Override
    public AsignaMatSecoTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("MsId");
        String nombre = rs.getString("MenuNombre");
        String ubicacion = rs.getString("MsMenUbicacion");
        String imagen = rs.getString("MsMenImagen");
        int cantidad = rs.getInt("MsMenCantidad");

        AsignaMatSecoTab mTab = new AsignaMatSecoTab(Id, nombre, ubicacion,imagen,cantidad);
        return mTab;
    }
    
    
     @Override
    public List<AsignaMatSecoTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaMatSecoTab> amTab = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    amTab.add(convertir(rs));
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
        return amTab;
    }
    
    public Mensajes insertar(AsignaMatSecoTab amt) {

        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            
          stat.setInt(1, amt.getMsMenCantidad());
          stat.setString(2, amt.getMenuNombre());
          stat.setString(3, amt.getMsMenUbicacion());
          stat.setString(4, amt.getMsMenImagen());

            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(amt.getMenuNombre() + " agregado exitosamente");
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
    public AsignaMatSecoTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        AsignaMatSecoTab aModel = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setInt(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                aModel = convertir(rs);
            } else {
                throw new SQLException("Error, armado no encontrado");
            }
        } catch (SQLException ex) {
            System.out.println("Error de SQL " + ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    System.out.println("Error de SQL rs: " + ex);
                }
            }
            if (stat != null) {
                try {
                    stat.close();
                } catch (SQLException ex) {
                    System.out.println("Error de SQL: " + ex);
                }

            }
        }
        return aModel;
    }
    
    @Override
    public Mensajes eliminar(Integer id) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Eliminar);
            stat.setInt(1, id);
            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al eliminar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(id + " eliminado exitosamente");
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
    public Mensajes modificar(AsignaMatSecoTab amt) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            
           stat.setInt(1, amt.getMsMenCantidad());
          stat.setString(2, amt.getMenuNombre());
          stat.setString(3, amt.getMsMenUbicacion());
          stat.setString(4, amt.getMsMenImagen());
          stat.setInt(5, amt.getMsId());
          stat.setInt(6, amt.getMenuId());
          
            
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(amt.getMenuNombre() + " modificado exitosamente");
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
   
}
