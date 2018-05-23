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
public class FitosanidadTab implements Serializable{
  
    private int FitId;
    private String FitNombre;
    private String FitDescripcion;
    private Boolean FitTipo;
    private String FitImagen;
    private Boolean FitEstado;

    public FitosanidadTab(int FitId, String FitNombre, String FitDescripcion, Boolean FitTipo, String FitImagen, Boolean FitEstado) {
        this.FitId = FitId;
        this.FitNombre = FitNombre;
        this.FitDescripcion = FitDescripcion;
        this.FitTipo = FitTipo;
        this.FitImagen = FitImagen;
        this.FitEstado = FitEstado;
    }

    public FitosanidadTab(String FitNombre, String FitDescripcion, Boolean FitTipo, String FitImagen, Boolean FitEstado) {
        this.FitNombre = FitNombre;
        this.FitDescripcion = FitDescripcion;
        this.FitTipo = FitTipo;
        this.FitImagen = FitImagen;
        this.FitEstado = FitEstado;
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

    /**
     * @return the FitDescripcion
     */
    public String getFitDescripcion() {
        return FitDescripcion;
    }

    /**
     * @param FitDescripcion the FitDescripcion to set
     */
    public void setFitDescripcion(String FitDescripcion) {
        this.FitDescripcion = FitDescripcion;
    }

    /**
     * @return the FitTipo
     */
    public Boolean getFitTipo() {
        return FitTipo;
    }

    /**
     * @param FitTipo the FitTipo to set
     */
    public void setFitTipo(Boolean FitTipo) {
        this.FitTipo = FitTipo;
    }

    /**
     * @return the FitImagen
     */
    public String getFitImagen() {
        return FitImagen;
    }

    /**
     * @param FitImagen the FitImagen to set
     */
    public void setFitImagen(String FitImagen) {
        this.FitImagen = FitImagen;
    }

    /**
     * @return the FitEstado
     */
    public Boolean getFitEstado() {
        return FitEstado;
    }

    /**
     * @param FitEstado the FitEstado to set
     */
    public void setFitEstado(Boolean FitEstado) {
        this.FitEstado = FitEstado;
    }

    @Override
    public String toString() {
        return "FitosanidadTab{" + "FitId=" + FitId + ", FitNombre=" + FitNombre + ", FitDescripcion=" + FitDescripcion + ", FitTipo=" + FitTipo + ", FitImagen=" + FitImagen + ", FitEstado=" + FitEstado + '}';
    }

    public boolean isFitEstado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    

    
    
}
