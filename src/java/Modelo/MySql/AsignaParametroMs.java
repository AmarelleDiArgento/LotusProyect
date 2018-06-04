/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Servicios.Mensajes;
import java.sql.Connection;
import Modelo.Interface.AsignaParametro;
import Modelo.Tabs.AsignaParametroTab;

/**
 *
 * @author ale-j
 */
public class AsignaParametroMs implements AsignaParametro  {
  
    private final Connection con;
    Mensajes m;

    public AsignaParametroMs(Connection con) {

        this.con = con;
    }
    
    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = ""; {
    
}
    
    
@Override
    public AsignaParametroTab convertir(ResultSet rs) throws SQLException {
        int GraID = rs.getInt("GraID");
        int ParId = rs.getInt("ParId");
        int MaeId = rs.getInt("MaeId");
        int ProId = rs.getInt("ProId");
        int VarId = rs.getInt("VarId");
        String PaProDescripcion = rs.getString("PaProDescripcion");
        String PaProFoto = rs.getString("PaProFoto");
        String GraNombre = rs.getString("GraNombre");
         String ParNombre = rs.getString("ParNombre");
         String MaeNombre = rs.getString("MaeNombre");
         String ProNombre = rs.getString("ProNombre");
         String VarNombre = rs.getString("VarNombre");


        AsignaParametroTab apTab = new AsignaParametroTab(GraID,ParId,MaeId,ProId,VarId,PaProDescripcion,PaProFoto,GraNombre,ParNombre,MaeNombre,ProNombre,VarNombre);
        return apTab;
    }
    
    
     @Override
    public List<AsignaParametroTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaParametroTab> apTab = new ArrayList<>();
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
    
    public Mensajes insertar(AsignaParametroTab ap) {

        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            
          stat.setString(1, ap.getPaProDescripcion());
          stat.setString(2, ap.getPaProFoto());
          stat.setString(3, ap.getGraNombre());
          stat.setString(4, ap.getParNombre());
          stat.setString(5, ap.getMaeNombre());
          stat.setString(6, ap.getProNombre());
          stat.setString(7, ap.getVarNombre());


            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ap.getParNombre() + " agregado exitosamente");
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
    public AsignaParametroTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        AsignaParametroTab apModel = null;
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
    public Mensajes modificar(AsignaParametroTab ap) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            
          stat.setString(1, ap.getPaProDescripcion());
          stat.setString(2, ap.getPaProFoto());
          stat.setString(3, ap.getGraNombre());
          stat.setString(4, ap.getParNombre());
          stat.setString(5, ap.getMaeNombre());
          stat.setString(6, ap.getProNombre());
          stat.setString(7, ap.getVarNombre());
          stat.setInt(8, ap.getGraID());
          stat.setInt(9, ap.getParId());
          stat.setInt(10, ap.getMaeId());
          stat.setInt(11, ap.getProId());
          stat.setInt(12, ap.getVarId());

          
            
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ap.getParNombre() + " modificado exitosamente");
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
