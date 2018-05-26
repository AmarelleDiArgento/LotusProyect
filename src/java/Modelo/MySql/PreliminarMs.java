/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Preliminar;
import Modelo.Tabs.PreliminarTab;
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
public class PreliminarMs implements Preliminar {

    private final Connection con;
    Mensajes m = null;

    public PreliminarMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProject.preliminarIn(?,?);";
    final String Modificar = "call LotusProject.preliminarMo(?,?,?);";
    final String Eliminar = "call LotusProject.preliminarEl(?);";
    final String Consultar = "call LotusProject.preliminarCo(?);";
    final String ListarTodos = "call LotusProject.preliminarLi();";

    @Override
    public Mensajes insertar(PreliminarTab p) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, p.getPreFecha());

            if (p.isPreEstado()) {
                stat.setInt(2, 1);
            } else {
                stat.setInt(2, 0);
            }
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj("Agregada exitosamente");
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
    public PreliminarTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("PreId");
        String fecha = rs.getString("PreFecha");
        int st = rs.getInt("PreEstado");
        boolean status = st == 1;
        PreliminarTab pTab = new PreliminarTab (Id, fecha,status);
        return pTab;
    }
   @Override
     public List<PreliminarTab> listar() {
    PreparedStatement stat = null;
        ResultSet rs = null;
        List<PreliminarTab> pModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    pModel.add(convertir(rs));
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
        return pModel;    
    }

   @Override
    public PreliminarTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        PreliminarTab pModel = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setInt(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                pModel = convertir(rs);
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
        return pModel;
    }

        @Override
        public Mensajes modificar(PreliminarTab p) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, p.getPreId());
            stat.setString(2, p.getPreFecha());
            if (p.isPreEstado()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(3, 0);
            }
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(p.getPreFecha() + " modificado exitosamente");
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
