/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Tabs.AsignaPermisoTab;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Modelo.Interface.AsignaPermiso;
import Servicios.Mensajes;
import java.util.HashSet;

/**
 *
 * @author Amarelle
 */
public class AsignaPermisoMs implements AsignaPermiso {

    private final Connection con;
    Mensajes m = new Mensajes();

    public AsignaPermisoMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProject.AsgPerIn(?, ?, ?, ?, ?, ?);";
    final String Modificar = "call LotusProject.AsgPerMo(?, ?, ?, ?, ?, ?);";
    final String Eliminar = "call LotusProject.AsgPerEl(?, ?)";
    final String Consultar = "call LotusProject.AsgPerCo(?, ?)";
    final String Listar = "call LotusProject.AsgPerLi(?);";
    final String PerSession = "call LotusProject.AsgPerSession(?);";

    @Override
    public List<AsignaPermisoTab> listar(Integer rol) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaPermisoTab> apModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(Listar);
                stat.setInt(1, rol);
                rs = stat.executeQuery();
                while (rs.next()) {
                    apModel.add(convertir(rs));
                }
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AsignaPermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (stat != null) {
                    try {
                        stat.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AsignaPermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AsignaPermisoMs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apModel;
    }

    @Override
    public Mensajes insertar(AsignaPermisoTab ap) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setInt(1, ap.getRolId());
            stat.setInt(2, ap.getPerId());
            if (ap.isRpLeer()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(3, 0);
            }
            if (ap.isRpNuevo()) {
                stat.setInt(4, 1);
            } else {
                stat.setInt(4, 0);
            }
            if (ap.isRpEditar()) {
                stat.setInt(5, 1);
            } else {
                stat.setInt(5, 0);
            }
            if (ap.isRpEliminar()) {
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
                m.setMsj("Permiso agregado a " + ap.getRolId() + " agregado exitosamente");
                m.setDetalles("Perfecto!");
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
    public Mensajes modificar(AsignaPermisoTab ap) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, ap.getRolId());
            stat.setInt(2, ap.getPerId());
            if (ap.isRpLeer()) {
                stat.setInt(3, 1);
            } else {
                stat.setInt(3, 0);
            }
            if (ap.isRpNuevo()) {
                stat.setInt(4, 1);
            } else {
                stat.setInt(4, 0);
            }
            if (ap.isRpEditar()) {
                stat.setInt(5, 1);
            } else {
                stat.setInt(5, 0);
            }
            if (ap.isRpEliminar()) {
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
                m.setMsj("Permiso modificado a " + ap.getRolId() + " - " + ap.getPerId() + " agregado exitosamente");
                m.setDetalles("Perfecto!");

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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AsignaPermisoTab convertir(ResultSet rs) throws SQLException {
        int RolId = Integer.parseInt(rs.getString("RolId"));
        String Rol = rs.getString("RolNombre");
        int PerId = Integer.parseInt(rs.getString("PerId"));
        String Permiso = rs.getString("PerNombre");
        String Modulo = rs.getString("PerModulo");
        boolean leer = rs.getInt("rolperLeer") == 1;
        boolean nuevo = rs.getInt("rolperNuevo") == 1;
        boolean modificar = rs.getInt("rolperEditar") == 1;
        boolean eliminar = rs.getInt("rolperEliminar") == 1;
        AsignaPermisoTab apModel = new AsignaPermisoTab(RolId, Rol, PerId, Permiso, Modulo, leer, nuevo, eliminar, eliminar);
        return apModel;
    }

    public AsignaPermisoTab coSession(ResultSet rs) throws SQLException {

        String Modulo = rs.getString("PerModulo");
        String Permiso = rs.getString("PerNombre");
        boolean leer = rs.getInt("rolperLeer") == 1;
        boolean nuevo = rs.getInt("rolperNuevo") == 1;
        boolean modificar = rs.getInt("rolperEditar") == 1;
        boolean eliminar = rs.getInt("rolperEliminar") == 1;

        AsignaPermisoTab apModel = new AsignaPermisoTab(Permiso, Modulo, leer, nuevo, eliminar, eliminar);
        return apModel;
    }

    @Override
    public AsignaPermisoTab obtener(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<AsignaPermisoTab> listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<AsignaPermisoTab> PerSession(String cedula) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<AsignaPermisoTab> apModel = new ArrayList<>();
        try {
            try {
                stat = con.prepareCall(PerSession);
                stat.setString(1, cedula);
                rs = stat.executeQuery();
                while (rs.next()) {
                    apModel.add(coSession(rs));
                }
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AsignaPermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (stat != null) {
                    try {
                        stat.close();
                    } catch (SQLException ex) {
                        Logger.getLogger(AsignaPermisoMs.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AsignaPermisoMs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return apModel;
    }

}
