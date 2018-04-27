/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Interface;

import Modelo.Dao.DAO;
import Modelo.Tabs.Productos_Has_Menu_Tab;
import java.sql.ResultSet;

/**
 *
 * @author ALEJANDRA MEDINA
 */
public interface Productos_Has_Menu extends DAO<ResultSet, Productos_Has_Menu_Tab, String> {
    
}
