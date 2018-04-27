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
    private String Imagen;

    public PasoTab(int PasId, int Pasorden, String PasDescripcion, String Imagen) {
        this.PasId = PasId;
        this.Pasorden = Pasorden;
        this.PasDescripcion = PasDescripcion;
        this.Imagen = Imagen;
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
    public String getImagen() {
        return Imagen;
    }

    /**
     * @param Imagen the Imagen to set
     */
    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    @Override
    public String toString() {
        return "PasoTab{" + "PasId=" + PasId + ", Pasorden=" + Pasorden + ", PasDescripcion=" + PasDescripcion + ", Imagen=" + Imagen + '}';
    }

   
    
}
