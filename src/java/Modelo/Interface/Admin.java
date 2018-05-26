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

    Armado getArmado();

    AsignaPermiso getAsignaPer();

    ControlCambios getControlCambios();

    FitoProducto getFitoProducto();

    Fitosanidad getFitosanidad();

    Grados getGrados();

    Linea getLinea();

    Maestro getMaestro();

    Marcacion getMarcacion();
    
    MaterialSeco getMaterialSeco();

    Menu getMenu();

    Parametros getParametros();

    Paso getPaso();

    Permiso getPermiso();

    Poscosecha getPoscosecha();

    Preliminar getPreliminar();

    Producto getProducto();

    Rol getRol();

    Tipo getTipo();

    Usuario getUsuario();

    Variedad getVariedad();

}
