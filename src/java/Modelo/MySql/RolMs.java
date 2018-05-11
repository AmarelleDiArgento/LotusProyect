/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.Rol;
import Modelo.Tabs.RolTab;
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

    public RolMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProyect.rolIn(?,?,?);";
    final String Modificar = "call LotusProyect.rolMo(?,?,?,?);";
    final String Eliminar = "call LotusProyect.rolEl(?);";
    final String Consultar = "call LotusProyect.rolCo(?)";
    final String ListarTodos = "call LotusProyect.rolLi()";

    @Override
    public String insertar(RolTab r) {
        String msj = "";
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
                msj = "Error al ingresar los datos";
            } else {
                msj = r.getRolNombre() + " agregado exitosamente";
            }

        } catch (SQLException ex) {
            msj = "Error de SQL " + ex;
        } finally {
            if (stat != null) {
                try {
                    stat.close();
                } catch (SQLException ex) {
                    msj = "Error de SQL " + ex;
                }
            }

        }
        return msj;
    }

    @Override
    public String modificar(RolTab o) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, o.getRolId());
            stat.setString(2, o.getRolNombre());
            stat.setString(3, o.getRolDescripcion());
            if (o.isRolEstado()) {
                stat.setInt(4, 1);
            } else {
                stat.setInt(4, 0);
            }
            if (stat.executeUpdate() == 0) {
                msj = "Error al modificar los datos";
            } else {
                msj = o.getRolNombre() + " modificado exitosamente";
            }
        } catch (SQLException ex) {
            msj = "Error de SQL" + ex;
        } finally {
            if (stat != null) {
                try {
                    stat.close();
                } catch (SQLException ex) {
                    msj = "Error de SQL" + ex;
                }
            }
        }
        return msj;
    }

    @Override
    public String eliminar(Integer id) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Eliminar);
            stat.setInt(1, id);
            if (stat.executeUpdate() == 0) {
                msj = "Error al eliminar los datos";
            } else {
                msj = id + " eliminado exitosamente";
            }
        } catch (SQLException ex) {
            msj = "Error de SQL" + ex;
        } finally {
            if (stat != null) {
                try {
                    stat.close();
                } catch (SQLException ex) {
                    msj = "Error de SQL" + ex;
                }
            }
        }
        return msj;
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
