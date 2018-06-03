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
import Modelo.Interface.AsignaFito;
import Modelo.Tabs.AsignaFitoTab;

/**
 *
 * @author ale-j
 */

    
    
    public class AsignaFitoMs implements AsignaFito {

    private final Connection con;
    Mensajes m;

    public AsignaFitoMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";
    
    
    public Mensajes insertar(AsignaFitoTab f) {

        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, f.getAsfImagen());
            stat.setString(2, f.getAsfDescripcion());
            stat.setString(3, f.getFitNombre());

            

            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(f.getAsfDescripcion() + " agregado exitosamente");
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
    public AsignaFitoTab convertir(ResultSet rs) throws SQLException {
        int AsPrtID = rs.getInt("AsPrtID");
        int FitId = rs.getInt("FitId");
        String nombre = rs.getString("FitNombre");
        String descripcion = rs.getString("AsfDescripcion");
        String imagen = rs.getString("AsfImagen");

        AsignaFitoTab fTab = new AsignaFitoTab(AsPrtID,FitId,imagen, nombre, descripcion);
        return fTab;
    }
    
    @Override
    public List<AsignaFitoTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaFitoTab> fTab = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    fTab.add(convertir(rs));
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
        return fTab;
    }
    
    
     @Override
    public AsignaFitoTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        AsignaFitoTab fModel = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setInt(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                fModel = convertir(rs);
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
        return fModel;
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
    public Mensajes modificar(AsignaFitoTab f) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
           
            stat.setInt(1, f.getAsPrtID());
            stat.setInt(2, f.getFitId());
            stat.setString(3, f.getAsfImagen());
            stat.setString(4, f.getAsfDescripcion());
            stat.setString(5, f.getFitNombre());
            
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(f.getFitNombre() + " modificado exitosamente");
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


    

