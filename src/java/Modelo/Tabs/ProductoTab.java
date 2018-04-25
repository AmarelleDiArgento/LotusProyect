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
public class ProductoTab {
    
    private int ProId;
    private String ProNombre;
    private Boolean ProEstado;

    public ProductoTab(int ProId, String ProNombre, Boolean ProEstado) {
        this.ProId = ProId;
        this.ProNombre = ProNombre;
        this.ProEstado = ProEstado;
    }

    public int getProId() {
        return ProId;
    }

    public void setProId(int ProId) {
        this.ProId = ProId;
    }

    public String getProNombre() {
        return ProNombre;
    }

    public void setProNombre(String ProNombre) {
        this.ProNombre = ProNombre;
    }

    public Boolean getProEstado() {
        return ProEstado;
    }

    public void setProEstado(Boolean ProEstado) {
        this.ProEstado = ProEstado;
    }
    
    
    
}
