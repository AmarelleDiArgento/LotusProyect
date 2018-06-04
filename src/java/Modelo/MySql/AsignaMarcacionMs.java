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
import Modelo.Interface.AsignaMarcacion;
import Modelo.Tabs.AsignaMarcacionTab;

/**
 *
 * @author ale-j
 */
public class AsignaMarcacionMs implements AsignaMarcacion {

    private final Connection con;
    Mensajes m;

    public AsignaMarcacionMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "";
    final String Modificar = "";
    final String Eliminar = "";
    final String Consultar = "";
    final String ListarTodos = "";

    @Override
    public AsignaMarcacionTab convertir(ResultSet rs) throws SQLException {
        int MarId = rs.getInt("MarId");
        int PreId = rs.getInt("PreId");
        int NoTallos = rs.getInt("NoRamos");

        AsignaMarcacionTab mTab = new AsignaMarcacionTab(PreId, MarId, NoTallos);
        return mTab;
    }

    @Override
    public List<AsignaMarcacionTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaMarcacionTab> amTab = new ArrayList<>();
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

    public Mensajes insertar(AsignaMarcacionTab am) {

        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);

            stat.setInt(1, am.getPreId());
            stat.setInt(2, am.getPreId());
            stat.setInt(3, am.getNoRamos());

            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(am.getNoRamos() + " agregado exitosamente");
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
    public AsignaMarcacionTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        AsignaMarcacionTab aModel = null;
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
    public Mensajes modificar(AsignaMarcacionTab am) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);

            stat.setInt(1, am.getPreId());
            stat.setInt(2, am.getPreId());
            stat.setInt(3, am.getNoRamos());

            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(am.getNoRamos() + " modificado exitosamente");
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
