/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Interface;

import Modelo.Dao.DAO;
import Modelo.Tabs.AsignaPermisoTab;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Amarelle
 */
public interface AsignaPermiso extends DAO<ResultSet, AsignaPermisoTab, Integer>{

    List<AsignaPermisoTab> PerSession(String cedula);
    public List<AsignaPermisoTab> listar(Integer rol);    
    
}
