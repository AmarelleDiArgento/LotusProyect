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
public class FitoProductoTab {
    
    
    private int FitId;
    private int maestro_MaeId;
    private int productos_ProId;
    private int variedad_VarId;
    private String FpArea;
    private String FpImagen;

    public FitoProductoTab(int FitId, int maestro_MaeId, int productos_ProId, int variedad_VarId, String FpArea, String FpImagen) {
        this.FitId = FitId;
        this.maestro_MaeId = maestro_MaeId;
        this.productos_ProId = productos_ProId;
        this.variedad_VarId = variedad_VarId;
        this.FpArea = FpArea;
        this.FpImagen = FpImagen;
    }

    public FitoProductoTab(String FpArea, String FpImagen) {
        this.FpArea = FpArea;
        this.FpImagen = FpImagen;
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
     * @param FitId the Fitoproducto_FitId to set
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

    @Override
    public String toString() {
        return "FitoProductoTab{" + "FitId=" + FitId + ", maestro_MaeId=" + maestro_MaeId + ", productos_ProId=" + productos_ProId + ", variedad_VarId=" + variedad_VarId + ", FpArea=" + FpArea + ", FpImagen=" + FpImagen + '}';
    }
    

}
