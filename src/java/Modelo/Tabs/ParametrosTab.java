/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

import java.io.Serializable;

/**
 *
 * @author ALEJANDRA MEDINA
 */
public class ParametrosTab implements Serializable{
    
    private int ParId;
    private String ParNombre;
    private Boolean ParEstado;

    public ParametrosTab(int ParId, String ParNombre, Boolean ParEstado) {
        this.ParId = ParId;
        this.ParNombre = ParNombre;
        this.ParEstado = ParEstado;
    }

    public ParametrosTab(String ParNombre, Boolean ParEstado) {
        this.ParNombre = ParNombre;
        this.ParEstado = ParEstado;
    }
    
    /**
     * @return the ParId
     */
    public int getParId() {
        return ParId;
    }

    /**
     * @param ParId the ParId to set
     */
    public void setParId(int ParId) {
        this.ParId = ParId;
    }

    /**
     * @return the ParNombre
     */
    public String getParNombre() {
        return ParNombre;
    }

    /**
     * @param ParNombre the ParNombre to set
     */
    public void setParNombre(String ParNombre) {
        this.ParNombre = ParNombre;
    }

   /**
     * @param ParEstado the ParEstado to set
     */
    public void setParEstado(Boolean ParEstado) {
        this.ParEstado = ParEstado;
    }

    /**
     * @return the ArmEstado
     */
    public Boolean isParEstado() {
        return ParEstado;
    }

    @Override
    public String toString() {
        return "ParametrosTab{" + "ParId=" + ParId + ", ParNombre=" + ParNombre + ", ParEstado=" + ParEstado + '}';
    } 
}
