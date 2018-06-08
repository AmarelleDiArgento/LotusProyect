/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Variedad;
import Modelo.Tabs.VariedadTab;
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
public class VariedadMs implements Variedad {

    private final Connection con;
    Mensajes m = new Mensajes();

    public VariedadMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProject.variedadIn(?,?,?,?,?);";
    final String Modificar = "call LotusProject.variedadMo(?,?,?,?,?);";
    final String Eliminar = "call LotusProject.variedadEl(?);";
    final String Consultar = "call LotusProject.variedadCo(?);";
    final String ListarTodos = "call LotusProject.variedadLi();";

    @Override
    public Mensajes insertar(VariedadTab v) {
        
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, v.getVarNombre());
            if (v.isVarEstado()) {
                stat.setInt(2, 1);
            } else {
                stat.setInt(2, 0);
            }
            stat.setInt(3, v.getProId());
            stat.setString(4, v.getVarImagen());
            stat.setString(5, v.getVarColor());

            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(v.getVarNombre() + " agregado exitosamente");
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
    public VariedadTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("VarId");
        String nombre = rs.getString("VarNombre");
        String imagen = rs.getString("VarImagen");
        String color = rs.getString("VarColor");
        int ProId = rs.getInt("ProId");
        String Pnombre = rs.getString("ProNombre");
        int st = rs.getInt("VarEstado");
        boolean status = st == 1;
        VariedadTab vTab = new VariedadTab(Id, nombre, imagen, color, ProId, Pnombre, status);
        return vTab;
    }

    @Override
    public List<VariedadTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<VariedadTab> uModel = new ArrayList<>();
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
    public VariedadTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        VariedadTab vModel = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setInt(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                vModel = convertir(rs);
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
        return vModel;
    }

    @Override
    public Mensajes modificar(VariedadTab v) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, v.getVarId());
            stat.setString(2, v.getVarNombre());
            if (v.isVarEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(3, 0);
            }
            stat.setInt(4, v.getProId());
            stat.setString(5, v.getVarColor());
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(v.getVarNombre() + " modificado exitosamente");
            }

        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("Error Mysql");
            m.setDetalles("Error al modificar los datos:" + ex.getMessage());
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
