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
    
    FitoProducto getFitoProducto ();
    
    ControlCambios getControlCambios();
    
    Fitosanidad getFitosanidad();
    
    Grados getGrados();
    
    Linea getLinea ();
    
    Maestro getMaestro();
    
    Marcacion getMarcacion ();
    
    
}
