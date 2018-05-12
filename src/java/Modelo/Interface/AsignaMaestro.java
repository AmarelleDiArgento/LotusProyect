/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Interface;

import Modelo.Dao.DAO;
import Modelo.Tabs.AsignaMaestroTab;
import java.sql.ResultSet;

/**
 *
 * @author ale-j
 */
public interface AsignaMaestro extends DAO<ResultSet, AsignaMaestroTab, String> {
    
}
