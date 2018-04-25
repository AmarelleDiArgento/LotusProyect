/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Interface;

import Modelo.Dao.DAO;
import Modelo.Tabs.AsignaPerTab;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Amarelle
 */
public interface AsignaPer extends DAO<ResultSet, AsignaPerTab, Integer>{

    List<AsignaPerTab> PerSession(String cedula);
    public List<AsignaPerTab> listar(Integer rol);    
    
}
