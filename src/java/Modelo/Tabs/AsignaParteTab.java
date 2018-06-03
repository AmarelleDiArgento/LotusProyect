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
public class AsignaParteTab implements Serializable { 
    
    private int AsPrtID;
    private int PrtId;
    private int ProId;
    private String ProNombre;

    public AsignaParteTab(int AsPrtID, int PrtId, int ProId, String ProNombre) {
        this.AsPrtID = AsPrtID;
        this.PrtId = PrtId;
        this.ProId = ProId;
        this.ProNombre = ProNombre;
    }

    public AsignaParteTab(int AsPrtID, int PrtId, int ProId) {
        this.AsPrtID = AsPrtID;
        this.PrtId = PrtId;
        this.ProId = ProId;
    }

    /**
     * @return the AsPrtID
     */
    public int getAsPrtID() {
        return AsPrtID;
    }

    /**
     * @param AsPrtID the AsPrtID to set
     */
    public void setAsPrtID(int AsPrtID) {
        this.AsPrtID = AsPrtID;
    }

    /**
     * @return the PrtId
     */
    public int getPrtId() {
        return PrtId;
    }

    /**
     * @param PrtId the PrtId to set
     */
    public void setPrtId(int PrtId) {
        this.PrtId = PrtId;
    }

    /**
     * @return the ProId
     */
    public int getProId() {
        return ProId;
    }

    /**
     * @param ProId the ProId to set
     */
    public void setProId(int ProId) {
        this.ProId = ProId;
    }

    /**
     * @return the ProNombre
     */
    public String getProNombre() {
        return ProNombre;
    }

    /**
     * @param ProNombre the ProNombre to set
     */
    public void setProNombre(String ProNombre) {
        this.ProNombre = ProNombre;
    }

    @Override
    public String toString() {
        return "AsignaParte{" + "AsPrtID=" + AsPrtID + ", PrtId=" + PrtId + ", ProId=" + ProId + ", ProNombre=" + ProNombre + '}';
    }
    
    
    
   
}
