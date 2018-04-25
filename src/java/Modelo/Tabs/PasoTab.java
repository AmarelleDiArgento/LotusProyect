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

    public int getPasId() {
        return PasId;
    }

    public void setPasId(int PasId) {
        this.PasId = PasId;
    }

    public int getPasorden() {
        return Pasorden;
    }

    public void setPasorden(int Pasorden) {
        this.Pasorden = Pasorden;
    }

    public String getPasDescripcion() {
        return PasDescripcion;
    }

    public void setPasDescripcion(String PasDescripcion) {
        this.PasDescripcion = PasDescripcion;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }
    
    
}
