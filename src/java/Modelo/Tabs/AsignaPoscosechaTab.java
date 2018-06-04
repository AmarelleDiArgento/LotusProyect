/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

import java.io.Serializable;

/**
 *
 * @author ale-j
 */
public class AsignaPoscosechaTab implements Serializable{
    
    private int PosId;
    private String UsuCedula;
    private String PosNombre;

    public AsignaPoscosechaTab(int PosId, String UsuCedula, String PosNombre) {
        this.PosId = PosId;
        this.UsuCedula = UsuCedula;
        this.PosNombre = PosNombre;
    }

    public AsignaPoscosechaTab(int PosId, String UsuCedula) {
        this.PosId = PosId;
        this.UsuCedula = UsuCedula;
    }

    /**
     * @return the PosId
     */
    public int getPosId() {
        return PosId;
    }

    /**
     * @param PosId the PosId to set
     */
    public void setPosId(int PosId) {
        this.PosId = PosId;
    }

    /**
     * @return the UsuCedula
     */
    public String getUsuCedula() {
        return UsuCedula;
    }

    /**
     * @param UsuCedula the UsuCedula to set
     */
    public void setUsuCedula(String UsuCedula) {
        this.UsuCedula = UsuCedula;
    }

    /**
     * @return the PosNombre
     */
    public String getPosNombre() {
        return PosNombre;
    }

    /**
     * @param PosNombre the PosNombre to set
     */
    public void setPosNombre(String PosNombre) {
        this.PosNombre = PosNombre;
    }

    @Override
    public String toString() {
        return "AsignaPoscosechaTab{" + "PosId=" + PosId + ", UsuCedula=" + UsuCedula + ", PosNombre=" + PosNombre + '}';
    }
    
    
    
}
