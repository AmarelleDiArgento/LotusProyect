/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

/**
 *
 * @author ALEJANDRA MEDINA
 */
public class PreliminarTab {
   
    private int PreId;
    private Boolean Estado;
    private int Poscosecha_Posnombre;

    public PreliminarTab(int PreId, Boolean Estado, int Poscosecha_Posnombre) {
        this.PreId = PreId;
        this.Estado = Estado;
        this.Poscosecha_Posnombre = Poscosecha_Posnombre;
    }

    /**
     * @return the PreId
     */
    public int getPreId() {
        return PreId;
    }

    /**
     * @param PreId the PreId to set
     */
    public void setPreId(int PreId) {
        this.PreId = PreId;
    }

    /**
     * @return the Estado
     */
    public Boolean getEstado() {
        return Estado;
    }

    /**
     * @param Estado the Estado to set
     */
    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }

    /**
     * @return the Poscosecha_Posnombre
     */
    public int getPoscosecha_Posnombre() {
        return Poscosecha_Posnombre;
    }

    /**
     * @param Poscosecha_Posnombre the Poscosecha_Posnombre to set
     */
    public void setPoscosecha_Posnombre(int Poscosecha_Posnombre) {
        this.Poscosecha_Posnombre = Poscosecha_Posnombre;
    }

    @Override
    public String toString() {
        return "PreliminarTab{" + "PreId=" + PreId + ", Estado=" + Estado + ", Poscosecha_Posnombre=" + Poscosecha_Posnombre + '}';
    }
}
    
