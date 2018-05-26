/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Rol;
import Modelo.Tabs.RolTab;
import Servicios.Mensajes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Amarelle
 */
public class RolMs implements Rol {

    private final Connection con;
    Mensajes m = null;

    public RolMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProject.rolIn(?,?,?);";
    final String Modificar = "call LotusProject.rolMo(?,?,?,?);";
    final String Eliminar = "call LotusProject.rolEl(?);";
    final String Consultar = "call LotusProject.rolCo(?)";
    final String ListarTodos = "call LotusProject.rolLi()";

    @Override
    public Mensajes insertar(RolTab r) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, r.getRolNombre());
            stat.setString(2, r.getRolDescripcion());

            if (r.isRolEstado()) {
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
                m.setMsj(r.getRolNombre() + " agregado exitosamente");
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
    public Mensajes modificar(RolTab r) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, r.getRolId());
            stat.setString(2, r.getRolNombre());
            stat.setString(3, r.getRolDescripcion());
            if (r.isRolEstado()) {
                stat.setInt(4, 1);
            } else {
                stat.setInt(4, 0);
            }
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(r.getRolNombre() + " modificado exitosamente");
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

    @Override
    public RolTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("RolId");
        String nombre = rs.getString("RolNombre");
        String Descripcion = rs.getString("RolDescripcion");
        int st = rs.getInt("RolEstado");
        boolean status = st == 1;
        RolTab uTab = new RolTab(Id, nombre, Descripcion, status);
        return uTab;
    }

    @Override
    public RolTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;

        RolTab rMod = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setInt(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                rMod = convertir(rs);
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
        return rMod;
    }

    @Override
    public List<RolTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<RolTab> rTab = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    rTab.add(convertir(rs));
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
        return rTab;
    }

}
