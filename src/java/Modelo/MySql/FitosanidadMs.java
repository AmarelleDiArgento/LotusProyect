/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Fitosanidad;
import Modelo.Tabs.FitosanidadTab;
import Servicios.Mensajes;
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
    Mensajes m = null;

    public FitosanidadMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call lotusproyect.fitosanidadIn(?,?,?,?,?);";
    final String Modificar = "call lotusproyect.fitosanidadMo(?,?,?,?,?);";
    final String Eliminar = "call lotusproyect.fitosanidadEl(?);";
    final String Consultar = "call lotusproyect.fitosanidadCo(?);";
    final String ListarTodos = "call lotusproyect.fitosanidadLi();";
    
    @Override
    public Mensajes insertar(FitosanidadTab f) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, f.getFitNombre());
            stat.setString(2, f.getFitDescripcion());
            stat.setString(3, f.getFitTipo());

          
            if (f.isFitEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(3, 0);
            }
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(f.getFitNombre() + " agregado exitosamente");
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
    public FitosanidadTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("FitId");
        String nombre = rs.getString("FitNombre");
        String descripcion = rs.getString("FitDescripcion");
        String tipo = rs.getString("FitTipo");
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
        List<FitosanidadTab> fModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    fModel.add(convertir(rs));
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
        return fModel;    
    }
     
       @Override
    public Mensajes modificar(FitosanidadTab f) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, f.getFitId());
            stat.setString(2, f.getFitNombre());
            stat.setString(3, f.getFitDescripcion());
            stat.setString(4, f.getFitTipo());
            stat.setString(5, f.getFitImagen());
            if (f.isFitEstado()) {
                stat.setInt(6, 1);
            } else {
                stat.setInt(6, 0);
            }
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
    
    @Override
    public FitosanidadTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;

        FitosanidadTab fMod = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setInt(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                fMod = convertir(rs);
            } else {
                throw new SQLException("Error, usuario no encontrado");
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
        return fMod;
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

}
