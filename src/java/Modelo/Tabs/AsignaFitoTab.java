/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;
import java.io.Serializable;


/**
 *
 * @author ale-j
 */
public class AsignaFitoTab implements Serializable {
    
    private int AsPrtID;
    private int FitId;
    private String AsfImagen;
    private String AsfDescripcion;
    private String FitNombre;

    public AsignaFitoTab(int AsPrtID, int FitId, String AsfImagen, String AsfDescripcion, String FitNombre) {
        this.AsPrtID = AsPrtID;
        this.FitId = FitId;
        this.AsfImagen = AsfImagen;
        this.AsfDescripcion = AsfDescripcion;
        this.FitNombre = FitNombre;
    }

    public AsignaFitoTab(int AsPrtID, int FitId, String AsfImagen, String AsfDescripcion) {
        this.AsPrtID = AsPrtID;
        this.FitId = FitId;
        this.AsfImagen = AsfImagen;
        this.AsfDescripcion = AsfDescripcion;
    }
 

    /**
     * @return the AsPrtID
     */
    public int getAsPrtID() {
        return AsPrtID;
    }

    /**
     * @param AsPrtID the AsPrtID to set
     */
    public void setAsPrtID(int AsPrtID) {
        this.AsPrtID = AsPrtID;
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
     * @return the AsfImagen
     */
    public String getAsfImagen() {
        return AsfImagen;
    }

    /**
     * @param AsfImagen the AsfImagen to set
     */
    public void setAsfImagen(String AsfImagen) {
        this.AsfImagen = AsfImagen;
    }

    /**
     * @return the AsfDescripcion
     */
    public String getAsfDescripcion() {
        return AsfDescripcion;
    }

    /**
     * @param AsfDescripcion the AsfDescripcion to set
     */
    public void setAsfDescripcion(String AsfDescripcion) {
        this.AsfDescripcion = AsfDescripcion;
    }

    /**
     * @return the FitNombre
     */
    public String getFitNombre() {
        return FitNombre;
    }

    /**
     * @param FitNombre the FitNombre to set
     */
    public void setFitNombre(String FitNombre) {
        this.FitNombre = FitNombre;
    }

    @Override
    public String toString() {
        return "AsignaFito{" + "AsPrtID=" + AsPrtID + ", FitId=" + FitId + ", AsfImagen=" + AsfImagen + ", AsfDescripcion=" + AsfDescripcion + ", FitNombre=" + FitNombre + '}';
    }
    
    }
    
 
