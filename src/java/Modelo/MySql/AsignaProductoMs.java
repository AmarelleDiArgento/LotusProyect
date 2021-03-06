/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.AsignaProducto;
import Modelo.Tabs.AsignaProductoTab;
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
public class AsignaProductoMs  implements AsignaProducto  {
  
    private final Connection con;
    Mensajes m;

    public AsignaProductoMs(Connection con) {

        this.con = con;
    }
    
    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";{
    
}

    @Override
    public AsignaProductoTab convertir(ResultSet rs) throws SQLException {
        int ProId = rs.getInt("ProId");
        int MenuId = rs.getInt("MenuId");
        int Tallos = rs.getInt("Tallos");
        String Color = rs.getString("Color");
        String MenuNombre = rs.getString("MenuNombre");
        
        AsignaProductoTab apTab = new AsignaProductoTab(ProId,MenuId,Tallos,Color,MenuNombre);
        return apTab;
    }
    
    
     @Override
    public List<AsignaProductoTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaProductoTab> apTab = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    apTab.add(convertir(rs));
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
        return apTab;
    }
    
    public Mensajes insertar(AsignaProductoTab ap) {

        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            
          stat.setInt(1, ap.getTallos());
          stat.setString(2, ap.getColor());
          stat.setString(2, ap.getMenuNombre());

          
            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ap.getMenuNombre() + " agregado exitosamente");
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
    public AsignaProductoTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        AsignaProductoTab apModel = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setInt(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                apModel = convertir(rs);
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
        return apModel;
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
    public Mensajes modificar(AsignaProductoTab ap) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            
           stat.setInt(1, ap.getProId());
           stat.setInt(2, ap.getMenuId());
           stat.setInt(3, ap.getTallos());
           stat.setString(4, ap.getColor());
           stat.setString(5, ap.getMenuNombre());


            
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ap.getMenuNombre() + " modificado exitosamente");
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

