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
public class VariedadTab implements Serializable{
    
    private int VarId;
    private String VarNombre;
    private Boolean VarEstado;
    private String VarImagen;
    private String VarColor;

    public VariedadTab(int VarId, String VarNombre, String VarImagen, String VarColor,Boolean VarEstado) {
        this.VarId = VarId;
        this.VarNombre = VarNombre;
        this.VarImagen = VarImagen;
        this.VarColor = VarColor;
        this.VarEstado = VarEstado;
    }
    public VariedadTab(String VarNombre,String VarImagen, String VarColor,Boolean VarEstado) {
        this.VarNombre = VarNombre;
        this.VarImagen = VarImagen;
        this.VarColor = VarColor;
        this.VarEstado = VarEstado;
    }

    public VariedadTab(int VarId, String VarNombre, Boolean VarEstado, String VarImagen, String VarColor) {
        this.VarId = VarId;
        this.VarNombre = VarNombre;
        this.VarEstado = VarEstado;
        this.VarImagen = VarImagen;
        this.VarColor = VarColor;
    }
    

    /**
     * @return the VarId
     */
    public int getVarId() {
        return VarId;
    }

    /**
     * @param VarId the VarId to set
     */
    public void setVarId(int VarId) {
        this.VarId = VarId;
    }

    /**
     * @return the VarNombre
     */
    public String getVarNombre() {
        return VarNombre;
    }

    /**
     * @param VarNombre the VarNombre to set
     */
    public void setVarNombre(String VarNombre) {
        this.VarNombre = VarNombre;
    }
 /**
     * @param VarEstado the ArmEstado to set
     */
    public void setVarEstado(Boolean VarEstado) {
        this.VarEstado = VarEstado;
    }

    /**
     * @return the ArmEstado
     */
    public Boolean isVarEstado() {
        return VarEstado;
    }
    /**
     * @return the Varimagen
     */
    public String getVarImagen() {
        return VarImagen;
    }

    /**
     * @param VarImagen the VarImagen to set
     */
    public void setVarImagen(String VarImagen) {
        this.VarImagen = VarImagen;
    }

    /**
     * @return the VarColor
     */
    public String getVarColor() {
        return VarColor;
    }

    /**
     * @param VarColor the VarColor to set
     */
    public void setVarColor(String VarColor) {
        this.VarColor = VarColor;
    }

    @Override
    public String toString() {
        return "VariedadTab{" + "VarId=" + VarId + ", VarNombre=" + VarNombre + ", VarEstado=" + VarEstado + ", VarImagen=" + VarImagen + ", VarColor=" + VarColor + '}';
    }

}
