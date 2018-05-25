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
public class LineaTab implements Serializable{
    
    private int LinId;
    private Boolean LinEstado;
    private int poscosecha_PosId;
    private int PosId;
    private String PosNombre;

    public LineaTab(Boolean LinEstado, int poscosecha_PosId, int PosId) {
        this.LinEstado = LinEstado;
        this.poscosecha_PosId = poscosecha_PosId;
        this.PosId = PosId;
    }

    public LineaTab(int LinId, Boolean LinEstado) {
        this.LinId = LinId;
        this.LinEstado = LinEstado;
    }

    public LineaTab(String PosNombre,Boolean LinEstado) {
        this.PosNombre = PosNombre;
        this.LinEstado = LinEstado;        

    }

    public LineaTab(int LinId,String PosNombre,Boolean LinEstado) {
        this.LinId = LinId;
        this.PosNombre = PosNombre;
        this.LinEstado = LinEstado;
    }

    /**
     * @return the LinId
     */
    public int getLinId() {
        return LinId;
    }

    /**
     * @param LinId the LinId to set
     */
    public void setLinId(int LinId) {
        this.LinId = LinId;
    }

    /**
     * @param LinEstado the LinEstado to set
     */
    public void setArmEstado(Boolean LinEstado) {
        this.LinEstado = LinEstado;
    }

    /**
     * @return the LinEstado
     */
    public Boolean isLinEstado() {
        return LinEstado;
    }

    /**
     * @return the poscosecha_PosId
     */
    public int getPoscosecha_PosId() {
        return poscosecha_PosId;
    }

    /**
     * @param poscosecha_PosId the poscosecha_PosId to set
     */
    public void setPoscosecha_PosId(int poscosecha_PosId) {
        this.poscosecha_PosId = poscosecha_PosId;
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
        return "LineaTab{" + "LinId=" + LinId + ", LinEstado=" + LinEstado + ", poscosecha_PosId=" + poscosecha_PosId + ", PosId=" + PosId + ", PosNombre=" + PosNombre + '}';
    }
    }


   
    
    

   

   
