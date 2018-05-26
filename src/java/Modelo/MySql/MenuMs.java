/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Menu;
import Modelo.Tabs.MenuTab;
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
public class MenuMs implements Menu {

    private final Connection con;
    Mensajes m = null;

    public MenuMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProject.menuIn(?,?,?,?,?,?);";
    final String Modificar = "call LotusProject.menuMo(?,?,?,?,?,?);";
    final String Eliminar = "call LotusProject.menuEl(?);";
    final String Consultar = "call LotusProject.menuCo(?);";
    final String ListarTodos = "call LotusProject.MenuLi();";
    
    @Override
    public Mensajes insertar(MenuTab me) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, me.getPortada());
            stat.setString(2, me.getSuperior());
            stat.setString(3, me.getLongitud());
            stat.setString(4, me.getCauchos());
            stat.setString(5, me.getDescripcion());

            if (me.isEstado()) {
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
                m.setMsj("Agregado exitosamente");
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
    public MenuTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("MenuId");
        String portada = rs.getString("MenPortada");
        String superior = rs.getString("MenSuperior");
        String longitud = rs.getString("MenLongitud");
        String cauchos = rs.getString("MenCauchos");
        String descripcion = rs.getString("MenDescripcion");
        int st = rs.getInt("MenEstado");
        boolean status = st == 1;
        MenuTab mTab = new MenuTab (Id,portada, superior, longitud, cauchos, status, descripcion);
        return mTab;
    }
    
   @Override
     public List<MenuTab> listar() {
    PreparedStatement stat = null;
        ResultSet rs = null;
        List<MenuTab> meModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(ListarTodos);

                rs = stat.executeQuery();
                while (rs.next()) {
                    meModel.add(convertir(rs));
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
        return meModel;    
    }
     
        
      @Override
    public MenuTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;

        MenuTab mMod = null;
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
    public Mensajes modificar(MenuTab me) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, me.getId());
            stat.setString(2,me.getPortada());
            stat.setString(3, me.getSuperior());
            stat.setString(4, me.getLongitud());
            stat.setString(5, me.getCauchos());
            stat.setString(6, me.getDescripcion());


            if (me.isEstado()) {
                stat.setInt(7, 1);
            } else {
                stat.setInt(4, 0);
            }
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(me.getPortada() + " modificado exitosamente");
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