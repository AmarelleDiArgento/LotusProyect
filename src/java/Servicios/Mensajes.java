/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

/**
 *
 * @author Amarelle
 */
public class Mensajes {

    private String tipo;
    private String msj;
    private String detalles;
    

    public Mensajes() {
    }

    public Mensajes(String tipo, String msj, String detalles) {
        this.tipo = tipo;
        this.msj = msj;
        this.detalles = detalles;
    }

    public Mensajes(String tipo, String msj) {
        this.tipo = tipo;
        this.msj = msj;
    }

    
    
    
    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the msj
     */
    public String getMsj() {
        return msj;
    }

    /**
     * @param msj the msj to set
     */
    public void setMsj(String msj) {
        this.msj = msj;
    }

    /**
     * @return the detalles
     */
    public String getDetalles() {
        return detalles;
    }

    /**
     * @param detalles the detalles to set
     */
    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }

    
    public String toBody() {
    if (tipo.equals("Ok")){
        
    }    
        
        return "Mensajes{" + "tipo=" + tipo + ", msj=" + msj + ", detalles=" + detalles + '}';
    }
    
    
}
