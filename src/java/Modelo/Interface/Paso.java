/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Interface;

import Modelo.Dao.DAO;
import Modelo.Tabs.PasoTab;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author ALEJANDRA MEDINA
 */
public interface Paso extends DAO<ResultSet, PasoTab, Integer> {

    public List<PasoTab> listar(int Id);
}
