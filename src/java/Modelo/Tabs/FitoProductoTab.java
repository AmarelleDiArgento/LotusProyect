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
    
    
    private int Fitosanidad_FitId;
    private int maestro_MaeId;
    private int productos_ProId;
    private int variedad_VarId;
    private String FpArea;
    private String FpImagen;

    public FitoProductoTab(int Fitosanidad_FitId, int maestro_MaeId, int productos_ProId, int variedad_VarId, String FpArea, String FpImagen) {
        this.Fitosanidad_FitId = Fitosanidad_FitId;
        this.maestro_MaeId = maestro_MaeId;
        this.productos_ProId = productos_ProId;
        this.variedad_VarId = variedad_VarId;
        this.FpArea = FpArea;
        this.FpImagen = FpImagen;
    }

    public int getFitosanidad_FitId() {
        return Fitosanidad_FitId;
    }

    public void setFitosanidad_FitId(int Fitosanidad_FitId) {
        this.Fitosanidad_FitId = Fitosanidad_FitId;
    }

    public int getMaestro_MaeId() {
        return maestro_MaeId;
    }

    public void setMaestro_MaeId(int maestro_MaeId) {
        this.maestro_MaeId = maestro_MaeId;
    }

    public int getProductos_ProId() {
        return productos_ProId;
    }

    public void setProductos_ProId(int productos_ProId) {
        this.productos_ProId = productos_ProId;
    }

    public int getVariedad_VarId() {
        return variedad_VarId;
    }

    public void setVariedad_VarId(int variedad_VarId) {
        this.variedad_VarId = variedad_VarId;
    }

    public String getFpArea() {
        return FpArea;
    }

    public void setFpArea(String FpArea) {
        this.FpArea = FpArea;
    }

    public String getFpImagen() {
        return FpImagen;
    }

    public void setFpImagen(String FpImagen) {
        this.FpImagen = FpImagen;
    }
    
    
    
}
