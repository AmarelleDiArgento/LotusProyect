package Modelo.MySql;

import Modelo.Interface.Usuario;
import Modelo.Tabs.UsuarioTab;
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
public class UsuarioMs implements Usuario {
    Mensajes m = new Mensajes();
    private final Connection con;

    public UsuarioMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call LotusProject.usuarioIn(?, ?, ?, ?, ?, ?, ?,?, ?,?, ?,?);";
    final String Modificar = "call LotusProject.usuarioMo(?, ?, ?, ?, ?, ?, ?,?, ?,?,?, ?);";
    final String Eliminar = "call LotusProject.usuarioEl(?);";
    final String Consultar = "call LotusProject.usuarioCo(?);";
    final String ListarTodos = "call LotusProject.usuarioLi();";
    final String Login = "call LotusProject.usuarioLogin(?,?);";

    @Override
    public UsuarioTab login(String cedula, String pass) {
        PreparedStatement stat = null;
        ResultSet rs = null;
        UsuarioTab uModel = null;
        try {
            stat = con.prepareCall(Login);
            stat.setString(1, cedula);
            stat.setString(2, pass);
            rs = stat.executeQuery();
            if (rs.next()) {
                uModel = convertir(rs);
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
        return uModel;
    }

    @Override
    public Mensajes insertar(UsuarioTab u) {
        
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, u.getCedula());
            stat.setString(2, u.getNombre());
            stat.setString(3, u.getApellido());
            stat.setString(4, u.getLoger());
            stat.setString(5, u.getPassword());
            stat.setString(6, u.getExtencion());
            stat.setString(7, u.getTelefono());
            stat.setString(8, u.getEmail());
            stat.setString(9, u.getGenero());
            stat.setString(10, u.getAvatar());
            if (u.getEstado()) {
                stat.setInt(11, 1);
            } else {
                stat.setInt(11, 0);
            }
            stat.setInt(12, u.getRolId());

            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(u.getCedula());
                m.setDetalles("Agregado exitosamente");
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
        System.out.println(m.getTipo());
        return m;
    }

    @Override
    public Mensajes modificar(UsuarioTab u) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setString(1, u.getCedula());
            stat.setString(2, u.getNombre());
            stat.setString(3, u.getApellido());
            stat.setString(4, u.getLoger());
            stat.setString(5, u.getPassword());
            stat.setString(6, u.getExtencion());
            stat.setString(7, u.getTelefono());
            stat.setString(8, u.getEmail());
            if (u.getEstado()) {
                stat.setInt(9, 1);
            } else {
                stat.setInt(9, 0);
            }
            stat.setString(10, u.getAvatar());
            stat.setInt(11, u.getRolId());
            
            if (stat.executeUpdate() == 0) {
                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(u.getCedula());
                m.setDetalles("Modificado exitosamente");
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
    public Mensajes eliminar(String Cedula) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Eliminar);
            stat.setString(1, Cedula);
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al eliminar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(Cedula);
                m.setDetalles("Eliminado exitosamente");
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

        System.out.println(m.getTipo());
        return m;
    }

    @Override
    public UsuarioTab convertir(ResultSet rs) throws SQLException {
        String cedula = rs.getString("UsuCedula");
        String nombre = rs.getString("UsuNombre");
        String apellido = rs.getString("UsuApellido");
        String loger = rs.getString("UsuLoger");
        String pass = rs.getString("UsuPassword");
        String ext = rs.getString("UsuExtencion");
        String tel = rs.getString("UsuTelefono");
        String email = rs.getString("UsuEmail");
        String genero = rs.getString("UsuGenero");
        String avatar = rs.getString("UsuAvatar");
        int st = rs.getInt("UsuEstado");
        boolean status = st == 1;
        int rol_id = rs.getInt("RolId");
        String rol_n = rs.getString("RolNombre");
        UsuarioTab uTab = new UsuarioTab(cedula, nombre, apellido, loger, pass, ext, tel, email, genero, avatar, status, rol_id, rol_n);
        return uTab;
    }

    @Override
    public UsuarioTab obtener(String id) {
        PreparedStatement stat = null;
        ResultSet rs = null;

        UsuarioTab uModel = null;
        try {
            stat = con.prepareCall(Consultar);
            stat.setString(1, id);
            rs = stat.executeQuery();
            if (rs.next()) {
                uModel = convertir(rs);
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
        return uModel;
    }

    @Override
    public List<UsuarioTab> listar() {
        PreparedStatement stat = null;
        ResultSet rs = null;
        List<UsuarioTab> uModel = new ArrayList<>();
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

}
