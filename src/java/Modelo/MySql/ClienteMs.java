/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Cliente;
import Modelo.Tabs.ClienteTab;
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
public class ClienteMs implements Cliente {

    private final Connection con;
    Mensajes m = new Mensajes();

    public ClienteMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProject.clienteIn(?,?,?,?,?);";
    final String Modificar = "call LotusProject.clienteMo(?,?,?,?,?,?);";
    final String Eliminar = "call LotusProject.clienteEl(?);";
    final String Consultar = "call LotusProject.clienteCo(?);";
    final String ListarTodos = "call LotusProject.clienteLi();";

    @Override
    public Mensajes insertar(ClienteTab c) {

        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, c.getNombre());
            stat.setString(2, c.getIdUsu());
            stat.setString(3, c.getLocal());
            stat.setString(4, c.getLogo());

            if (c.isEstado()) {
                stat.setInt(5, 1);
            } else {
                stat.setInt(5, 0);
            }

            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(c.getNombre() + " agregado exitosamente");
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
                    m.setMsj("Error Mysql Statement " + ex.getMessage());
                    m.setDetalles("Error Statement, ingresar los datos: " + ex);
                }
            }
        }
        return m;
    }

    @Override
    public Mensajes modificar(ClienteTab c) {

        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, c.getId());
            stat.setString(2, c.getNombre());
            stat.setString(3, c.getIdUsu());
            stat.setString(4, c.getLocal());
            stat.setString(5, c.getLogo());

            if (c.isEstado()) {
                stat.setInt(6, 1);
            } else {
                stat.setInt(6, 0);
            }

            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(c.getNombre() + " agregado exitosamente");
            }

        } catch (SQLException ex) {
            m.setTipo("Error");
            m.setMsj("Error Mysql " + ex.getMessage());
            m.setDetalles("Error al ingresar los datos:" + ex);
        } finally {
            if (stat != null) {
                try {
                    stat.close();
                } catch (SQLException ex) {
                    m.setTipo("Error");
                    m.setMsj("Error Mysql Statement " + ex.getMessage());
                    m.setDetalles("Error Statement, ingresar los datos: " + ex);
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
            m.setMsj("Error Mysql: " + ex.getMessage());
            m.setDetalles("Error al ingresar los datos:" + ex);
        } finally {
            if (stat != null) {
                try {
                    stat.close();
                } catch (SQLException ex) {
                    m.setTipo("Error");
                    m.setMsj("Error Mysql Statement: " + ex.getMessage());
                    m.setDetalles("Error Statement, ingresar los datos:" + ex);
                }
            }
        }
        return m;
    }

    @Override
    public ClienteTab convertir(ResultSet rs) throws SQLException {

        int Id = rs.getInt("CliId");
        String cliente = rs.getString("CliNombre");
        String cedula = rs.getString("UsuCedula");
        String comercial = rs.getString("fullname");
        String local = rs.getString("CliLocalizacion");
        String logo = rs.getString("CliLogo");
        boolean status = rs.getInt("CliEstado") == 1;
        ClienteTab cTab = new ClienteTab(Id, cliente, cedula, comercial, local, logo, status);
        return cTab;
    }

    @Override
    public ClienteTab obtener(Integer id) {

        PreparedStatement stat = null;
        ResultSet rs = null;
        ClienteTab cModel = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setInt(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                cModel = convertir(rs);
            } else {
                throw new SQLException("Error, cliente no encontrado");
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
        return cModel;
    }

    @Override
    public List<ClienteTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<ClienteTab> cModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    cModel.add(convertir(rs));
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
        return cModel;
    }

}
