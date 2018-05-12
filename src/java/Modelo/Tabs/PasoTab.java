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
public class PasoTab {
    
    private int PasId;
    private int Pasorden;
    private String PasDescripcion;
    private String PasImagen;

    public PasoTab(int PasId, int Pasorden, String PasDescripcion, String PasImagen) {
        this.PasId = PasId;
        this.Pasorden = Pasorden;
        this.PasDescripcion = PasDescripcion;
        this.PasImagen = PasImagen;
    }

    /**
     * @return the PasId
     */
    public int getPasId() {
        return PasId;
    }

    /**
     * @param PasId the PasId to set
     */
    public void setPasId(int PasId) {
        this.PasId = PasId;
    }

    /**
     * @return the Pasorden
     */
    public int getPasorden() {
        return Pasorden;
    }

    /**
     * @param Pasorden the Pasorden to set
     */
    public void setPasorden(int Pasorden) {
        this.Pasorden = Pasorden;
    }

    /**
     * @return the PasDescripcion
     */
    public String getPasDescripcion() {
        return PasDescripcion;
    }

    /**
     * @param PasDescripcion the PasDescripcion to set
     */
    public void setPasDescripcion(String PasDescripcion) {
        this.PasDescripcion = PasDescripcion;
    }

    /**
     * @return the Imagen
     */
    public String getPasImagen() {
        return PasImagen;
    }

    /**
     * @param PasImagen the Imagen to set
     */
    public void setPasImagen(String PasImagen) {
        this.PasImagen = PasImagen;
    }

    @Override
    public String toString() {
        return "PasoTab{" + "PasId=" + PasId + ", Pasorden=" + Pasorden + ", PasDescripcion=" + PasDescripcion + ", PasImagen=" + PasImagen + '}';
    }

   
    
}
