/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.MySql;

import Modelo.Interface.MaterialSeco;
import Modelo.Tabs.MaterialSecoTab;
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
public abstract class MaterialSecoMs implements MaterialSeco {

    private final Connection con;
    Mensajes m = null;

    public MaterialSecoMs(Connection con) {

        this.con = con;
    }

    final String Insertar = "call lotusproyect.materialsecoIn(?,?,?,?,?,?,?,?);";
    final String Modificar = "call lotusproyect.materialsecoMo(?,?,?,?);";
    final String Eliminar = "call lotusproyect.materialsecoEl(?);";
    final String Consultar = "call lotusproyect.materialsecoCo(?);";
    final String ListarTodos = "call lotusproyect.materialsecoLi();";

    @Override
    public Mensajes insertar(MaterialSecoTab ms) {
        String msj = "";
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Insertar);
            stat.setString(1, ms.getMsNombre());
            stat.setString(2, ms.getMsImagen());
            stat.setString(3, ms.getMsDescripcion());
            stat.setInt(4, ms.getMsAlto());
            stat.setInt(5, ms.getMsAncho());
            stat.setInt(6, ms.getMsProfundo());

            if (ms.isMsEstado()) {
                stat.setInt(7, 1);
            } else {
                stat.setInt(7, 0);
            }
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al ingresar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ms.getMsNombre() + " agregado exitosamente");
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
    public MaterialSecoTab convertir(ResultSet rs) throws SQLException {
        int Id = rs.getInt("MsId");
        String nombre = rs.getString("MsNombre");
        String imagen = rs.getString("MsImagen");
        String descripcion = rs.getString("MsDescripcion");
        int alto = rs.getInt("MsAlto");
        int ancho = rs.getInt("MsAncho");
        int profundo = rs.getInt("MsProfundo");        
        int st = rs.getInt("MsEstado");
        boolean status = st == 1;
        MaterialSecoTab mTab = new MaterialSecoTab (Id, nombre, descripcion,imagen, status,alto,ancho,profundo);
        return mTab;
    }
    
 @Override
     public List<MaterialSecoTab> listar() {
    PreparedStatement stat = null;
        ResultSet rs = null;
        List<MaterialSecoTab> uModel = new ArrayList<>();
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
     
     
     @Override
    public Mensajes modificar(MaterialSecoTab ms) {
        PreparedStatement stat = null;
        try {
            stat = con.prepareStatement(Modificar);
            stat.setInt(1, ms.getMsId());
            stat.setString(2, ms.getMsNombre());
            stat.setString(3, ms.getMsImagen());
            stat.setString(4, ms.getMsDescripcion());
            stat.setInt(5, ms.getMsAlto());
            stat.setInt(6, ms.getMsAncho());
            stat.setInt(7, ms.getMsProfundo());
            
            if (ms.isMsEstado()) {
                stat.setInt(8, 1);
            } else {
                stat.setInt(8, 0);
            }
            if (stat.executeUpdate() == 0) {

                m.setTipo("Error");
                m.setMsj("Error Mysql");
                m.setDetalles("Error al modificar los datos");
            } else {
                m.setTipo("Ok");
                m.setMsj(ms.getMsNombre() + " modificado exitosamente");
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
    public MaterialSecoTab obtener(Integer id) {
        PreparedStatement stat = null;
        ResultSet rs = null;

        MaterialSecoTab mMod = null;
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
