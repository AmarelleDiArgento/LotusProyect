/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Interface;

import Modelo.Dao.DAO;
import Modelo.Tabs.PermisoTab;
import Modelo.Tabs.UsuarioTab;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Amarelle
 */
public interface Permiso extends DAO<ResultSet, PermisoTab, Integer>{
    List<PermisoTab> menu(String cedula);
    
}
