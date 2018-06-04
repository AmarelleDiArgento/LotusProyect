/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.AsignaParte;
import Modelo.Tabs.AsignaParteTab;
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
public class AsignaParteMs implements AsignaParte  {
  
    private final Connection con;
    Mensajes m;

    public AsignaParteMs(Connection con) {

        this.con = con;
    }
    
    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = ""; {
    
}

   @Override
    public AsignaParteTab convertir(ResultSet rs) throws SQLException {
        int AsPrtID = rs.getInt("AsPrtID");
        int PrtId = rs.getInt("PrtId");
        int ProId = rs.getInt("ProId");
        String AsPrtNombre = rs.getString("AsPrtNombre");
        String PrtNombre = rs.getString("PrtNombre");
        String ProNombre = rs.getString("ProNombre");

        AsignaParteTab apTab = new AsignaParteTab(AsPrtID,PrtId,ProId, AsPrtNombre,PrtNombre,ProNombre);
        return apTab;
    }
    
    
     @Override
    public List<AsignaParteTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaParteTab> apTab = new ArrayList<>();
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
    
    public Mensajes insertar(AsignaParteTab ap) {

        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            
          stat.setString(1, ap.getProNombre());
          stat.setString(2, ap.getPrtNombre());
          stat.setString(3, ap.getProNombre());

          
            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ap.getProNombre() + " agregado exitosamente");
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
    public AsignaParteTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        AsignaParteTab apModel = null;
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
    public Mensajes modificar(AsignaParteTab ap) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            
           stat.setInt(1, ap.getAsPrtID());
          stat.setInt(2, ap.getPrtId());
          stat.setInt(3, ap.getProId());
          stat.setString(4, ap.getAsPrtNombre());
          stat.setString(5, ap.getPrtNombre());
          stat.setString(6, ap.getProNombre());
          
            
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ap.getAsPrtNombre() + " modificado exitosamente");
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
