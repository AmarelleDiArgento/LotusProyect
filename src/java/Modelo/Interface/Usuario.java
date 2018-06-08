/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Interface;

import Modelo.Dao.DAO;
import Modelo.Tabs.UsuarioTab;
import Servicios.Mensajes;
import java.sql.ResultSet;

/**
 *
 * @author Amarelle
 */
public interface Usuario extends DAO<ResultSet, UsuarioTab, String> {

    UsuarioTab login(String cedula, String pass);
    Mensajes Avatar (String cedula, String Avatar);
}
