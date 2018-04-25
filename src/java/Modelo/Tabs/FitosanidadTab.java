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

    public int getFitId() {
        return FitId;
    }

    public void setFitId(int FitId) {
        this.FitId = FitId;
    }

    public String getFitNombre() {
        return FitNombre;
    }

    public void setFitNombre(String FitNombre) {
        this.FitNombre = FitNombre;
    }

    public String getFitDescripcion() {
        return FitDescripcion;
    }

    public void setFitDescripcion(String FitDescripcion) {
        this.FitDescripcion = FitDescripcion;
    }

    public Boolean getFitTipo() {
        return FitTipo;
    }

    public void setFitTipo(Boolean FitTipo) {
        this.FitTipo = FitTipo;
    }

    public String getFitImagen() {
        return FitImagen;
    }

    public void setFitImagen(String FitImagen) {
        this.FitImagen = FitImagen;
    }

    public Boolean getFitEstado() {
        return FitEstado;
    }

    public void setFitEstado(Boolean FitEstado) {
        this.FitEstado = FitEstado;
    }
    
    
    
    
}
