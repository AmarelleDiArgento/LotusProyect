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
public class PasoTab implements Serializable{
    
    private int PasId;
    private int Pasorden;
    private String PasDescripcion;
    private String PasImagen;
    private int ArmId;
    private String ArmNombre;

    public PasoTab(int Pasorden, String PasDescripcion, String PasImagen, int ArmId) {
        this.Pasorden = Pasorden;
        this.PasDescripcion = PasDescripcion;
        this.PasImagen = PasImagen;
        this.ArmId = ArmId;
    }

    public PasoTab(int PasId, int Pasorden, String PasDescripcion, String PasImagen, int ArmId) {
        this.PasId = PasId;
        this.Pasorden = Pasorden;
        this.PasDescripcion = PasDescripcion;
        this.PasImagen = PasImagen;
        this.ArmId = ArmId;
    }

    public PasoTab(int PasId, int Pasorden, String PasDescripcion, String PasImagen, int ArmId, String ArmNombre) {
        this.PasId = PasId;
        this.Pasorden = Pasorden;
        this.PasDescripcion = PasDescripcion;
        this.PasImagen = PasImagen;
        this.ArmId = ArmId;
        this.ArmNombre = ArmNombre;
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
     * @return the PasImagen
     */
    public String getPasImagen() {
        return PasImagen;
    }

    /**
     * @param PasImagen the PasImagen to set
     */
    public void setPasImagen(String PasImagen) {
        this.PasImagen = PasImagen;
    }

    /**
     * @return the ArmId
     */
    public int getArmId() {
        return ArmId;
    }

    /**
     * @param ArmId the ArmId to set
     */
    public void setArmId(int ArmId) {
        this.ArmId = ArmId;
    }

    /**
     * @return the ArmNombre
     */
    public String getArmNombre() {
        return ArmNombre;
    }

    /**
     * @param ArmNombre the ArmNombre to set
     */
    public void setArmNombre(String ArmNombre) {
        this.ArmNombre = ArmNombre;
    }

    @Override
    public String toString() {
        return "PasoTab{" + "PasId=" + PasId + ", Pasorden=" + Pasorden + ", PasDescripcion=" + PasDescripcion + ", PasImagen=" + PasImagen + ", ArmId=" + ArmId + ", ArmNombre=" + ArmNombre + '}';
    }



}
