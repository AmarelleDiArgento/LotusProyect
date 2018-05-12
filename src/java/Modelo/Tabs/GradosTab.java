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

    public GradosTab(String GraNombre, String GraDetalles, Boolean GraEstado) {
        this.GraNombre = GraNombre;
        this.GraDetalles = GraDetalles;
        this.GraEstado = GraEstado;
    }

    /**
     * @return the GradId
     */
    public int getGradId() {
        return GradId;
    }

    /**
     * @param GradId the GradId to set
     */
    public void setGradId(int GradId) {
        this.GradId = GradId;
    }

    /**
     * @return the GraNombre
     */
    public String getGraNombre() {
        return GraNombre;
    }

    /**
     * @param GraNombre the GraNombre to set
     */
    public void setGraNombre(String GraNombre) {
        this.GraNombre = GraNombre;
    }

    /**
     * @return the GraDetalles
     */
    public String getGraDetalles() {
        return GraDetalles;
    }

    /**
     * @param GraDetalles the GraDetalles to set
     */
    public void setGraDetalles(String GraDetalles) {
        this.GraDetalles = GraDetalles;
    }

    /**
     * @return the GraEstado
     */
    public Boolean getGraEstado() {
        return GraEstado;
    }

    /**
     * @param GraEstado the GraEstado to set
     */
    public void setGraEstado(Boolean GraEstado) {
        this.GraEstado = GraEstado;
    }

    @Override
    public String toString() {
        return "GradosTab{" + "GradId=" + GradId + ", GraNombre=" + GraNombre + ", GraDetalles=" + GraDetalles + ", GraEstado=" + GraEstado + '}';
    }

    public boolean isGraEstado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     
}
