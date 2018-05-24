/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Interface;

/**
 *
 * @author Amarelle
 */
public interface Admin {

    Usuario getUsuario();

    Rol getRol();

    Permiso getPermiso();

    AsignaPermiso getAsignaPer();

    Armado getArmado();
    Variedad getVariedad();
    Tipo getTipo();
    Producto getProductos();
    Preliminar getPreliminar();
    Poscosecha getPoscosecha();
    Paso getPaso();
    Parametros getParametros();
    Menu getMenu();
    
}
