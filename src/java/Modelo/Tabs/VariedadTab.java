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
    private String VarImagen;
    private String VarColor;
    private int ProId;
    private String ProNombre;
    private Boolean VarEstado;

    public VariedadTab(String VarNombre, String VarImagen, String VarColor, int ProId, Boolean VarEstado) {
        this.VarNombre = VarNombre;
        this.VarImagen = VarImagen;
        this.VarColor = VarColor;
        this.ProId = ProId;
        this.VarEstado = VarEstado;
    }

    public VariedadTab(int VarId, String VarNombre, String VarColor, int ProId, Boolean VarEstado) {
        this.VarId = VarId;
        this.VarNombre = VarNombre;
        this.VarColor = VarColor;
        this.ProId = ProId;
        this.VarEstado = VarEstado;
    }

    public VariedadTab(int VarId, String VarNombre, String VarImagen, String VarColor, int ProId, String ProNombre, Boolean VarEstado) {
        this.VarId = VarId;
        this.VarNombre = VarNombre;
        this.VarImagen = VarImagen;
        this.VarColor = VarColor;
        this.ProId = ProId;
        this.ProNombre = ProNombre;
        this.VarEstado = VarEstado;
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
     * @return the VarImagen
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

    /**
     * @return the VarEstado
     */
    public Boolean isVarEstado() {
        return VarEstado;
    }

    /**
     * @param VarEstado the VarEstado to set
     */
    public void setVarEstado(Boolean VarEstado) {
        this.VarEstado = VarEstado;
    }
    
    

    
}
