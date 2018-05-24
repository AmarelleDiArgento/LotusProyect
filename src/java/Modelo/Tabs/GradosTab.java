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
    
    private int GraId;
   private String GraNombre;
   private String GraDetalles;
   private Boolean GraEstado;

    public GradosTab(int GraId, String GraNombre, String GraDetalles, Boolean GraEstado) {
        this.GraId = GraId;
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
     * @return the GraId
     */
    public int getGraId() {
        return GraId;
    }

    /**
     * @param GraId the GraId to set
     */
    public void setGraId(int GraId) {
        this.GraId = GraId;
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
     * @param GraEstado the GraEstado to set
     */
    public void setArmEstado(Boolean GraEstado) {
        this.GraEstado = GraEstado;
    }

    /**
     * @return the GraEstado
     */
    public Boolean isGraEstado() {
        return GraEstado;
    }

    @Override
    public String toString() {
        return "GradosTab{" + "GraId=" + GraId + ", GraNombre=" + GraNombre + ", GraDetalles=" + GraDetalles + ", GraEstado=" + GraEstado + '}';
    }   
}
