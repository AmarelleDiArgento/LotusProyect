/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Marcacion;
import Modelo.Tabs.MarcacionTab;
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
public class MarcacionMs implements Marcacion {

    private final Connection con;
    Mensajes m = new Mensajes();

    public MarcacionMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProject.marcacionIn(?,?,?,?,?);";
    final String Modificar = "call LotusProject.marcacionMo(?,?,?,?,?,?);";
    final String Eliminar = "call LotusProject.marcacionEl(?);";
    final String Consultar = "call LotusProject.marcacionCo(?);";
    final String ListarTodos = "call LotusProject.marcacionLi();";

    @Override
    public Mensajes insertar(MarcacionTab ma) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, ma.getMarNombre());
            stat.setString(2, ma.getMarPortada());

            if (ma.isMarEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(3, 0);
            }
            stat.setInt(4, ma.getArmId());
            stat.setInt(5, ma.getCliId());
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ma.getMarNombre() + " agregado exitosamente");
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
    public MarcacionTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("MarId");
        String nombre = rs.getString("MarNombre");
        String portada = rs.getString("MarPortada");
        boolean status = rs.getInt("MarEstado") == 1;
        int aId = rs.getInt("ArmId");
        String nArmado = rs.getString("ArmNombre");
        int cId = rs.getInt("CliId");
        String nCliente = rs.getString("CliNombre");
        MarcacionTab mTab = new MarcacionTab(Id, nombre, portada, status, aId, nArmado, cId, nCliente);
        return mTab;
    }

    @Override
    public List<MarcacionTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<MarcacionTab> mModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    mModel.add(convertir(rs));
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
        return mModel;
    }

    @Override
    public MarcacionTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;

        MarcacionTab mMod = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setInt(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                mMod = convertir(rs);
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
        return mMod;
    }

    @Override
    public Mensajes modificar(MarcacionTab ma) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, ma.getMarId());
            stat.setString(2, ma.getMarNombre());
            stat.setString(3, ma.getMarPortada());
            if (ma.isMarEstado()) {
                stat.setInt(4, 1);
            } else {
                stat.setInt(4, 0);
            }
            
            stat.setInt(5, ma.getArmId());
            stat.setInt(6, ma.getCliId());
            
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ma.getMarNombre() + " modificado exitosamente");
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
