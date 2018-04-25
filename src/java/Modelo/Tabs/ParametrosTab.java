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
public class ParametrosTab {
    
    private int ParId;
    private String ParNombre;
    private Boolean ParEstado;

    public ParametrosTab(int ParId, String ParNombre, Boolean ParEstado) {
        this.ParId = ParId;
        this.ParNombre = ParNombre;
        this.ParEstado = ParEstado;
    }

    public int getParId() {
        return ParId;
    }

    public void setParId(int ParId) {
        this.ParId = ParId;
    }

    public String getParNombre() {
        return ParNombre;
    }

    public void setParNombre(String ParNombre) {
        this.ParNombre = ParNombre;
    }

    public Boolean getParEstado() {
        return ParEstado;
    }

    public void setParEstado(Boolean ParEstado) {
        this.ParEstado = ParEstado;
    }
    
    
    
}
