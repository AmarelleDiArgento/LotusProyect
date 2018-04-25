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
public class GradosTab {
    
    private int GradId;
   private String GraNombre;
   private String GraDetalles;
   private Boolean GraEstado;

    public GradosTab(int GradId, String GraNombre, String GraDetalles, Boolean GraEstado) {
        this.GradId = GradId;
        this.GraNombre = GraNombre;
        this.GraDetalles = GraDetalles;
        this.GraEstado = GraEstado;
    }

    public int getGradId() {
        return GradId;
    }

    public void setGradId(int GradId) {
        this.GradId = GradId;
    }

    public String getGraNombre() {
        return GraNombre;
    }

    public void setGraNombre(String GraNombre) {
        this.GraNombre = GraNombre;
    }

    public String getGraDetalles() {
        return GraDetalles;
    }

    public void setGraDetalles(String GraDetalles) {
        this.GraDetalles = GraDetalles;
    }

    public Boolean getGraEstado() {
        return GraEstado;
    }

    public void setGraEstado(Boolean GraEstado) {
        this.GraEstado = GraEstado;
    }
   
   
   
    
    
}
