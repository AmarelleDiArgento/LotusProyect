/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Interface;

import Modelo.Dao.DAO;
import Modelo.Tabs.AsignaMarcacionTab;
import java.sql.ResultSet;

/**
 *
 * @author ale-j
 */
public interface AsignaMarcacion extends DAO<ResultSet, AsignaMarcacionTab, Integer> {
    
}
