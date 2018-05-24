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
public class FitosanidadTab {
  
    private int FitId;
    private String FitNombre;
    private String FitDescripcion;
    private String FitTipo;
    private String FitImagen;
    private Boolean FitEstado;

    public FitosanidadTab(int FitId, String FitNombre, String FitDescripcion, String FitTipo, String FitImagen, Boolean FitEstado) {
        this.FitId = FitId;
        this.FitNombre = FitNombre;
        this.FitDescripcion = FitDescripcion;
        this.FitTipo = FitTipo;
        this.FitImagen = FitImagen;
        this.FitEstado = FitEstado;
    }

    public FitosanidadTab(String FitNombre, String FitDescripcion, String FitTipo, String FitImagen, Boolean FitEstado) {
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
    public String getFitTipo() {
        return FitTipo;
    }

    /**
     * @param FitTipo the FitTipo to set
     */
    public void setFitTipo(String FitTipo) {
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
     * @param FitEstado the FitEstado to set
     */
    public void setFitEstado(Boolean FitEstado) {
        this.FitEstado = FitEstado;
    }

    /**
     * @return the FitEstado
     */
    public Boolean isFitEstado() {
        return FitEstado;
    }

    @Override
    public String toString() {
        return "FitosanidadTab{" + "FitId=" + FitId + ", FitNombre=" + FitNombre + ", FitDescripcion=" + FitDescripcion + ", FitTipo=" + FitTipo + ", FitImagen=" + FitImagen + ", FitEstado=" + FitEstado + '}';
    }

   
}
