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
    public ProductoTab(int ProId, Boolean ProEstado) {
        this.ProId = ProId;
        this.ProEstado = ProEstado;
    }

    /**
     * @return the ProId
     */
    public int getProId() {
        return ProId;
    }

    /**
     * @param ProId the ProId to set
     */
    public void setProId(int ProId) {
        this.ProId = ProId;
    }

    /**
     * @return the ProNombre
     */
    public String getProNombre() {
        return ProNombre;
    }

    /**
     * @param ProNombre the ProNombre to set
     */
    public void setProNombre(String ProNombre) {
        this.ProNombre = ProNombre;
    }

    /**
     * @return the ProEstado
     */
    public Boolean getProEstado() {
        return ProEstado;
    }

    /**
     * @param ProEstado the ProEstado to set
     */
    public void setProEstado(Boolean ProEstado) {
        this.ProEstado = ProEstado;
    }

    @Override
    public String toString() {
        return "ProductoTab{" + "ProId=" + ProId + ", ProNombre=" + ProNombre + ", ProEstado=" + ProEstado + '}';
    }

    public boolean isProEstado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    }
