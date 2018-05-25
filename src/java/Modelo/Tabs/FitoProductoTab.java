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
public class FitoProductoTab implements Serializable{
    
    
    private int FitId;
    private int maestro_MaeId;
    private int productos_ProId;
    private int variedad_VarId;
    private String FpArea;
    private String FpImagen;
    private String Maenombre;
    private String pronombre;
    private String varnombre;

    public FitoProductoTab(int FitId,String FpArea, String FpImagen, String Maenombre, String pronombre, String varnombre) {
        this.FitId = FitId;     
        this.FpArea = FpArea;
        this.FpImagen = FpImagen;
        this.Maenombre = Maenombre;
        this.pronombre = pronombre;
        this.varnombre = varnombre;
    }

    public FitoProductoTab(String FpArea, String FpImagen, String Maenombre, String pronombre, String varnombre) {
        this.FpArea = FpArea;
        this.FpImagen = FpImagen;
        this.Maenombre = Maenombre;
        this.pronombre = pronombre;
        this.varnombre = varnombre;
    }

    public FitoProductoTab(int FitId, String FpArea, String FpImagen) {
        this.FitId = FitId;
        this.FpArea = FpArea;
        this.FpImagen = FpImagen;
    }
    
    

    /**
     * @return the FitId
     */
    public int getFitId() {
        return FitId;
    }

    /**
     * @param FitId the FitId to set
     */
    public void setFitId(int FitId) {
        this.FitId = FitId;
    }

    /**
     * @return the maestro_MaeId
     */
    public int getMaestro_MaeId() {
        return maestro_MaeId;
    }

    /**
     * @param maestro_MaeId the maestro_MaeId to set
     */
    public void setMaestro_MaeId(int maestro_MaeId) {
        this.maestro_MaeId = maestro_MaeId;
    }

    /**
     * @return the productos_ProId
     */
    public int getProductos_ProId() {
        return productos_ProId;
    }

    /**
     * @param productos_ProId the productos_ProId to set
     */
    public void setProductos_ProId(int productos_ProId) {
        this.productos_ProId = productos_ProId;
    }

    /**
     * @return the variedad_VarId
     */
    public int getVariedad_VarId() {
        return variedad_VarId;
    }

    /**
     * @param variedad_VarId the variedad_VarId to set
     */
    public void setVariedad_VarId(int variedad_VarId) {
        this.variedad_VarId = variedad_VarId;
    }

    /**
     * @return the FpArea
     */
    public String getFpArea() {
        return FpArea;
    }

    /**
     * @param FpArea the FpArea to set
     */
    public void setFpArea(String FpArea) {
        this.FpArea = FpArea;
    }

    /**
     * @return the FpImagen
     */
    public String getFpImagen() {
        return FpImagen;
    }

    /**
     * @param FpImagen the FpImagen to set
     */
    public void setFpImagen(String FpImagen) {
        this.FpImagen = FpImagen;
    }

    /**
     * @return the Maenombre
     */
    public String getMaenombre() {
        return Maenombre;
    }

    /**
     * @param Maenombre the Maenombre to set
     */
    public void setMaenombre(String Maenombre) {
        this.Maenombre = Maenombre;
    }

    /**
     * @return the pronombre
     */
    public String getPronombre() {
        return pronombre;
    }

    /**
     * @param pronombre the pronombre to set
     */
    public void setPronombre(String pronombre) {
        this.pronombre = pronombre;
    }

    /**
     * @return the varnombre
     */
    public String getVarnombre() {
        return varnombre;
    }

    /**
     * @param varnombre the varnombre to set
     */
    public void setVarnombre(String varnombre) {
        this.varnombre = varnombre;
    }

    @Override
    public String toString() {
        return "FitoProductoTab{" + "FitId=" + FitId + ", maestro_MaeId=" + maestro_MaeId + ", productos_ProId=" + productos_ProId + ", variedad_VarId=" + variedad_VarId + ", FpArea=" + FpArea + ", FpImagen=" + FpImagen + ", Maenombre=" + Maenombre + ", pronombre=" + pronombre + ", varnombre=" + varnombre + '}';
    }
}

    