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
public class PartesTab implements Serializable {
    
    private int prtId;
    private String PrtNombre;
    private String PrtDescripcion;

    public PartesTab(int prtId, String PrtNombre, String PrtDescripcion) {
        this.prtId = prtId;
        this.PrtNombre = PrtNombre;
        this.PrtDescripcion = PrtDescripcion;
    }

    public PartesTab(String PrtNombre, String PrtDescripcion) {
        this.PrtNombre = PrtNombre;
        this.PrtDescripcion = PrtDescripcion;
    }

    /**
     * @return the prtId
     */
    public int getprtId() {
        return prtId;
    }

    /**
     * @param prtId the prtId to set
     */
    public void setprtId(int prtId) {
        this.prtId = prtId;
    }

    /**
     * @return the PrtNombre
     */
    public String getPrtNombre() {
        return PrtNombre;
    }

    /**
     * @param PrtNombre the PrtNombre to set
     */
    public void setPrtNombre(String PrtNombre) {
        this.PrtNombre = PrtNombre;
    }

    /**
     * @return the PrtDescripcion
     */
    public String getPrtDescripcion() {
        return PrtDescripcion;
    }

    /**
     * @param PrtDescripcion the PrtDescripcion to set
     */
    public void setPrtDescripcion(String PrtDescripcion) {
        this.PrtDescripcion = PrtDescripcion;
    }

    @Override
    public String toString() {
        return "PartesTab{" + "prtId=" + prtId + ", PrtNombre=" + PrtNombre + ", PrtDescripcion=" + PrtDescripcion + '}';
    }
    
    
    
}
