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
public class PreliminarTab implements Serializable{
   
    private int PreId;
    private String PreFecha;
    private Boolean PreEstado;
    private int Poscosecha_Posnombre;
    private String Posnombre;

    public PreliminarTab(String PreFecha,String Posnombre, Boolean PreEstado) {
        this.PreFecha = PreFecha;
        this.Posnombre = Posnombre;
        this.PreEstado = PreEstado;

    }

    public PreliminarTab(int PreId, String PreFecha,String Posnombre, Boolean PreEstado) {
        this.PreId = PreId;
        this.PreFecha = PreFecha;
        this.Posnombre = Posnombre;
        this.PreEstado = PreEstado;
    }

    public PreliminarTab(int PreId, String PreFecha, Boolean PreEstado) {
        this.PreId = PreId;
        this.PreFecha = PreFecha;
        this.PreEstado = PreEstado;
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
     * @return the PreFecha
     */
    public String getPreFecha() {
        return PreFecha;
    }

    /**
     * @param PreFecha the PreFecha to set
     */
    public void setPreFecha(String PreFecha) {
        this.PreFecha = PreFecha;
    }

    
    /**
     * @param PreEstado the Estado to set
     */
    public void setPreEstado(Boolean PreEstado) {
        this.PreEstado = PreEstado;
    }

    /**
     * @return the PreEstado
     */
    public Boolean isPreEstado() {
        return PreEstado;
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

    /**
     * @return the Posnombre
     */
    public String getPosnombre() {
        return Posnombre;
    }

    /**
     * @param Posnombre the Posnombre to set
     */
    public void setPosnombre(String Posnombre) {
        this.Posnombre = Posnombre;
    }

    @Override
    public String toString() {
        return "PreliminarTab{" + "PreId=" + PreId + ", PreFecha=" + PreFecha + ", PreEstado=" + PreEstado + ", Poscosecha_Posnombre=" + Poscosecha_Posnombre + ", Posnombre=" + Posnombre + '}';
    }
}
    

    

    
    
