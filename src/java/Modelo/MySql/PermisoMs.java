/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Permiso;
import Modelo.Tabs.PermisoTab;
import Servicios.Mensajes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Amarelle
 */
public class PermisoMs implements Permiso {

    private final Connection con;
    Mensajes m = null;

    public PermisoMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProyect.permisoIn(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    final String Modificar = "call LotusProyect.permisoMo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    final String Eliminar = "call LotusProyect.permisoEl(?);";
    final String Consultar = "call LotusProyect.permisoCo(?);";
    final String ListarTodos = "call LotusProyect.permisoLi();";
    final String Menu = "call LotusProyect.perMenu(?);";

    @Override
    public Mensajes insertar(PermisoTab p) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, p.getPerNombre());
            stat.setString(2, p.getPerModulo());
            stat.setString(3, p.getPerDescripcion());
            stat.setString(4, p.getPerIco());
            stat.setString(5, p.getPerUrl());

            if (p.getPerEstado()) {
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
                m.setMsj(p.getPerNombre() + " agregado exitosamente");
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
    public Mensajes modificar(PermisoTab o) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Mensajes eliminar(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PermisoTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("PerId");
        String nombre = rs.getString("PerNombre");
        String modulo = rs.getString("PerModulo");
        String descripcion = rs.getString("PerDescripcion");
        String ico = rs.getString("PerIco");
        String url = rs.getString("PerUrl");
        int st = rs.getInt("PerEstado");
        boolean status = st == 1;
        PermisoTab pTab = new PermisoTab(Id, nombre, modulo, descripcion, ico, url, status);
        return pTab;
    }

    @Override
    public PermisoTab obtener(Integer id) {
        throw new UnsupportedOperationException("Métodos en proceso"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<PermisoTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<PermisoTab> rTab = new ArrayList<>();
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

    private PermisoTab conMenu(ResultSet rs) throws SQLException {
        String Permiso = rs.getString("PerNombre");
        String Ico = rs.getString("PerIco");
        String Url = rs.getString("PerUrl");
        PermisoTab pModel = new PermisoTab(Permiso, Ico, Url);
        return pModel;

    }

    @Override //Menuuuu!!!
    public List<PermisoTab> menu(String cedula) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<PermisoTab> pModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(Menu);
                stat.setString(1, cedula);

                rs = stat.executeQuery();
                while (rs.next()) {
                    pModel.add(conMenu(rs));
                }
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(PermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (stat != null) {
                    try {
                        stat.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(PermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(PermisoMs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pModel;

    }

}
